# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

pkgname='cnrdrvcups-lb'

# The download link changes with every version, try to keep changes in one place
# https://gdlp01.c-wss.com/gds/8/0100007658/27/linux-UFRII-drv-v550-m17n-00.tar.gz
# https://gdlp01.c-wss.com/gds/8/0100007658/30/linux-UFRII-drv-v560-m17n-08.tar.gz
#https://gdlp01.c-wss.com/gds/8/0100007658/33/linux-UFRII-drv-v570-m17n-11.tar.gz
# https://gdlp01.c-wss.com/gds/8/0100007658/35/linux-UFRII-drv-v570-m17n-18.tar.gz
# https://gdlp01.c-wss.com/gds/8/0100007658/38/linux-UFRII-drv-v580-m17n-04.tar.gz
_pkgver='5.80';  _dl='8/0100007658/38';_suffix1='m17n';_suffix2='04'

pkgver="${_pkgver}.1.${_suffix2}"

pkgrel=1
pkgdesc='CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers'
arch=('x86_64' 'aarch64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('GPL-2.0-only' 'MIT' 'custom')
# parts of the code are GPL or MIT licensed, some parts have a custom license
makedepends=('jbigkit' 'gzip' 'gtk3')
depends=('libcups' 'glibc' 'gcc-libs' 'libxml2')
optdepends=('libjpeg6-turbo: solves cpu hang on some color imageRUNNER/i-SENSYS LBP devices'
                        'jbigkit: solves some cpu hangs'
                        'ghostscript: necessary for printing on some devices'
                        'gtk3: for cnsetuputil2'
                        'at-spi2-core: for cnsetuputil2'
                        'gdk-pixbuf2: for cnsetuputil2'
                        'cairo: for cnsetuputil2'
                        'pango: for cnsetuputil2'
)


conflicts=('cndrvcups-lb' 'cndrvcups-common-lb')
options=('!emptydirs' '!strip' '!libtool')

source=(  "http://gdlp01.c-wss.com/gds/${_dl}/linux-UFRII-drv-v${_pkgver//\./}-${_suffix1}-${_suffix2}.tar.gz")
md5sums=('f21fc68223967a5897ba52fd7942ced7')
sha512sums=('c040a636223da374d342c915ecee8de5d3689786430ada9da6b2660f6467290cb23ededc02d1509cafbec86fbfe19a5631a68cfb0b4f2cfd8fff6c2a50ea4724')


# Canon provides the sourcecode in a tarball within the dowload and we need to extract the code manually
# In order to keep the $srcdir structure tidy we put the extracted files in "extracted-${pkgname}-${_pkgver}" aka _srcdir
# the code itself is spread over many folders. 
# "cnrdrvcups-common-${_pkgver}" aka _common_dir & "cnrdrvcups-lb-${_pkgver}" aka _driver_dir
# are used to keep this manageable


_srcdir="extracted-${pkgname}-${_pkgver}"
_common_dir="cnrdrvcups-common-${_pkgver}"
_driver_dir="cnrdrvcups-lb-${_pkgver}"




prepare() {

    # extract sources
    mkdir "${_srcdir}"
    cd "${_srcdir}"
    bsdtar -xf "${srcdir}/linux-UFRII-drv-v${_pkgver//\./}-${_suffix1}/Sources/${pkgname}-${_pkgver}-1.${_suffix2}.tar.xz"

    local _specs=(cnrdrvcups-lb.spec)

    # cngplp/autogen.sh fails to find several libraries.
    # adding these in the right place of the soon to be generated make script is hard,
    # so we patch it directly into that autogen.sh
    #    sed -e '2a export LIBS="-lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lgmodule-2.0"' -i "cnrdrvcups-common-${_pkgver}/cngplp/autogen.sh"
    # the switch to gtk3 appears to have solved this

    
    # the autogen.sh files from canon target an old automake/autoconf version
    # autoreconf converts them to a form compatible with archlinux autoconf/automake
    
    pushd "${_common_dir}"
    for i in "backend" "buftool" "cngplp" "cnjbig" "rasterfilter"
    do
        pushd "$i"
        autoreconf --force --install --warnings=none
        popd
    done
    popd
    pushd "${_driver_dir}"
    for i in "cngplp/files" "cngplp" "cpca" "pdftocpca"
    do
        pushd "$i"
        autoreconf --force --install --warnings=none
        popd
    done
    popd

    # allgen.sh where available is not useful for packaging on archlinux
    # Canon provides methods to build deb & rpm packages.
    # The debian rules are not suited for archlinux. When the .spec-file is converted to shell the resulting arch package works. 
    # Chris Severach figured out a way to automate  this conversion.

    # Generate make from spec %setup, %build
    sed -n -e '/^%setup/,/^%install/ p' "${_specs[@]}" | \
    grep -v '^%' | \
    sed -e '# Convert spec %{VAR} to shell ${VAR}' \
        -e 's:%{:${:g' \
        -e '# Quote to allow _cflags to have spaces' \
        -e 's:${_cflags}:"${_cflags}":g' \
        -e '# Some autogen.sh commands in the spec file do not set  --prefix. More than one --prefix dont cause problems so we can add it to all of them.' \
        -e 's:^./autogen.sh:& --prefix=${_prefix}:g ' \
        > 'make.Arch'

    # Generate make install from spec %install
    sed -n -e '/^%install/,/^%clean/ p' "${_specs[@]}" | \
    grep -v '^%' | \
    sed -e '# Convert spec %{VAR} to shell ${VAR}' \
        -e 's:%{:${:g' \
        -e '# Quote to handle path with spaces' \
        -e 's:${RPM_BUILD_ROOT}:"&":g' \
        -e '# ln -f hides problems so should be avoided' \
        -e 's:ln -sf :ln -s :g' \
        > 'make.install.Arch'

}

_setvars() {
    # variables used by the (generated) make.Arch &  make.install.Arch files
    # relative paths start at ${srcdir}/${_srcdir} 
    # _libsarch is architecture dependent
    
    local -A _libsarchfolder
    _libsarchfolder['x86_64']='libs64/intel'
    _libsarchfolder['aarch64']='libs64/arm'

    _vars=(
        _builddir="${srcdir}/${_srcdir}"
        common_dir="${_common_dir}"
        driver_dir="${_driver_dir}"
        utility_dir="cnrdrvcups-utility-${_pkgver}"
        RPM_BUILD_DIR="${srcdir}/${_srcdir}"
        _prefix='/usr'
        _machine_type="MACHINETYPE="$CARCH
        _cflags="CFLAGS=""$CFLAGS"
        _libdir='/usr/lib'
        _bindir='/usr/bin'
        locallibs='/usr/lib/'
        _includedir='/usr/include'
        b_lib_dir="${srcdir}/${_srcdir}/lib"
        b_include_dir="${srcdir}/${_srcdir}/include"
        _libsarch="${_libsarchfolder[$CARCH]}"
        nobuild=0
  )
}

build() {
  
  cd "${_srcdir}"
  local _vars; _setvars
  # Bash does not recognize var assigments hidden by array expansion so we use env.
  env "${_vars[@]}" \
  sh 'make.Arch'

}

package() {
    cd "${_srcdir}"

    local _vars; _setvars
    env "${_vars[@]}" \
    RPM_BUILD_ROOT="${pkgdir}" \
    sh 'make.install.Arch'

    # licensing information is spread over multiple files and folders and has changed between versions
    # while they could be done in a loop iterating through dirs/files,
    # I feel that would obscure what happens and make troubleshooting harder
    # so each file gets its own install command
    
    pushd "${_common_dir}"
    install -Dpm644 "README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/README"
    
    install -Dpm644 "backend/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/backend/LICENSE.txt"
    install -Dpm644 "backend/LICENSE.canon.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/backend/LICENSE.canon.txt"
    install -Dpm644 "backend/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/backend/README"
    
    install -Dpm644 "buftool/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/buftool/LICENSE.txt"
    install -Dpm644 "buftool/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/buftool/README"

    install -Dpm644 "cngplp/LICENSE.canon.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/cngplpl/LICENSE.canon.txt"
    install -Dpm644 "cngplp/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/cngplpl/README"
    
    install -Dpm644 "cnjbig/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/cnjbig/README"
    
    install -Dpm644 "rasterfilter/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_common_dir}/rasterfilter/README"

    popd
    pushd "${_driver_dir}"
    install -Dpm644 "README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/README"
    
    install -Dpm644 "cngplp/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/cngplp/README"
    install -Dpm644 "cngplp/files/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/cngplp/files/README"
    
    install -Dpm644 "cpca/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/cpca/README"
    install -Dpm644 "cpca/cnpklib/LICENSE.canon.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/cpca/cnpklib/LICENSE.canon.txt"
    
    install -Dpm644 "pdftocpca/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/pdftocpca/README"
    popd 
    
    # documentation
    pushd "$srcdir/linux-UFRII-drv-v${_pkgver//\./}-m17n/Documents"
    
    install -Dpm644 deutsch/"README-ufr2-5.8xDE.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xDE.html"
    install -Dpm644 espanol/"README-ufr2-5.8xSP.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xSP.html"
    install -Dpm644 francais/"README-ufr2-5.8xFR.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xFR.html"
    install -Dpm644 italiano/"README-ufr2-5.8xIT.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xIT.html"
    install -Dpm644 korean/"README-ufr2-5.8xKR.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xKR.html"
    install -Dpm644 simplified_chinese/"README-ufr2-5.8xSC.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xSC.html"
    install -Dpm644 traditional_chinese/"README-ufr2-5.8xTC.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xTC.html"
    install -Dpm644 uk_eng/"README-ufr2-5.8xUK.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.8xUK.html"
    
    install -Dpm644 deutsch/"UsersGuide-ufr2-DE.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-DE.html"
    install -Dpm644 espanol/"UsersGuide-ufr2-SP.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-SP.html"
    install -Dpm644 francais/"UsersGuide-ufr2-FR.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-FR.html"
    install -Dpm644 italiano/"UsersGuide-ufr2-IT.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-IT.html"
    install -Dpm644 korean/"UsersGuide-ufr2-KR.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-KR.html"
    install -Dpm644 simplified_chinese/"UsersGuide-ufr2-SC.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-SC.html"
    install -Dpm644 traditional_chinese/"UsersGuide-ufr2-TC.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-TC.html"
    install -Dpm644 uk_eng/"UsersGuide-ufr2-UK.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-UK.html"
    
    install -Dpm644 deutsch/"LICENSE-DE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-DE.txt"
    install -Dpm644 espanol/"LICENSE-ES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ES.txt"
    install -Dpm644 francais/"LICENSE-FR.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FR.txt"
    install -Dpm644 italiano/"LICENSE-IT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-IT.txt"
    install -Dpm644 korean/"LICENSE-KO.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-KO.txt"
    install -Dpm644 simplified_chinese/"LICENSE-CN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CN.txt"
    install -Dpm644 traditional_chinese/"LICENSE-TW.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-TW.txt"
    install -Dpm644 uk_eng/"LICENSE-EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-EN.txt"
    popd
    
}
