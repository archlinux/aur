# Maintainer:  Linaro <maxim.anisimov.ua@gmail.com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

pkgname='cnrdrvcups-sfp'

# The download link changes with every version, try to keep changes in one place
_pkgver='5.00';  _dl='0/0100005950/10'

pkgver="${_pkgver}"
pkgrel='3'
pkgdesc='Canon UFRII LT Printer Driver for Linux (LBP112/912, LBP113/913, LBP151dw, LBP6030/LBP6040/LBP6018L, LBP6230/LBP6240, LBP7100C/LBP7110C, LBP8100)'
arch=('x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com'
license=('GPL2' 'MIT' 'custom')
# parts of the code are GPL or MIT licensed, some parts have a custom license
makedepends=('jbigkit' 'gzip' 'gtk2')
depends=('gcc-libs' 'libxml2' 'libglade')
optdepends=('libjpeg6-turbo: improves printing results for color i-SENSYS LBP devices'
                        'gtk2: for cnsetuputil2')


conflicts=('cndrvcups-lb' 'cndrvcups-common-lb')
options=('!emptydirs' '!strip' '!libtool')

source=(  "http://gdlp01.c-wss.com/gds/${_dl}/linux-UFRIILT-drv-v${_pkgver//\./}-uken-18.tar.gz")
md5sums=('8bc3a4e3c372bb4d1b9af2cc012c720b')
sha512sums=('e7b964f3d4541e1ec9ba07eac17559233ab2db16d1f025ffd8a46a65297c63205b7a3cdc031d95f04d719e97eaf93fd763bdc6c27f12c5aac346bb4f204d5967')


# Canon provides the sourcecode in a tarball within the dowload and we need to extract the code manually
# In order to keep the $srcdir structure tidy we put the extracted files in "extracted-${pkgname}-${_pkgver}" aka _srcdir
# the code itself is spread over many folders. 
# "cnrdrvcups-common-${_pkgver}" aka _common_dir & "cnrdrvcups-sfp-${_pkgver}" aka _driver_dir
# are used to keep this manageable


_srcdir="extracted-${pkgname}-${_pkgver}"
_common_dir="cnrdrvcups-common-${_pkgver}"
_driver_dir="cnrdrvcups-sfp-${_pkgver}"




prepare() {

    mkdir "${_srcdir}"
    cd "${_srcdir}"
    bsdtar -xf "${srcdir}/linux-UFRIILT-drv-v${_pkgver//\./}-uken/Sources/${pkgname}-${pkgver}-1.tar.gz"

    local _specs=(cnrdrvcups-ncap.spec)

    # cngplp/autogen.sh fails to find several libraries.
    # adding these in the right place of the soon to be generated make script is hard,
    # so we patch it directly into that autogen.sh
    sed -e '2a export LIBS="-lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lgmodule-2.0"' -i "cnrdrvcups-common-${_pkgver}/cngplp/autogen.sh"
    sed -e '2a export LIBS="-latk-1.0 -lgobject-2.0 -lglib-2.0 -lgdk_pixbuf-2.0 -lcups"' -i "cnrdrvcups-sfp-${_pkgver}/StatusMonitor/autogen.sh"

    # the autogen.sh files from canon target an old automake/autoconf version
    # autoreconf converts them to a form compatible with archlinux autoconf/automake
    
    pushd "${_common_dir}"
    for i in "backend" "buftool" "cngplp" "cnjbig" "rasterfilter"
    do
        pushd "$i"
        autoreconf -i
        popd
    done
    popd
    pushd "${_driver_dir}"
    for i in "cngplp/files" "cngplp" "cpca" "StatusMonitor"
    do
        pushd "$i"
        autoreconf -i
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
        -e 's:^./autogen.sh:& --prefix=${_prefix}:g' \
        -e 's:${LIBS}:${_libsarch}:g' \
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
        -e 's:${LIBS}:${_libsarch}:g' \
        > 'make.install.Arch'

}

_setvars() {
    # variables used by the (generated) make.Arch &  make.install.Arch files
    # relative paths start at ${srcdir}/${_srcdir} 

    _vars=(
        _builddir="${srcdir}/${_srcdir}"
        common_dir="${_common_dir}"
        driver_dir="${_driver_dir}"
        utility_dir="cnrdrvcups-utility-${_pkgver}"
        RPM_BUILD_DIR="${srcdir}/${_srcdir}"
        _prefix='/usr'
        _machine_type="MACHINETYPE="$CARCH
        _cflags="CFLAGS=-march=x86-64 -fcommon -O2 -pipe -fno-plt"
        _libdir='/usr/lib'
        _bindir='/usr/bin'
        locallibs='/usr/lib/'
        _includedir='/usr/include'
        b_lib_dir="${srcdir}/${_srcdir}/lib"
        b_include_dir="${srcdir}/${_srcdir}/include"
        _libsarch='libs64'
        libs32='/usr/lib'
  )
# -fcommon is needed to compile with gcc10 , see https://gcc.gnu.org/gcc-10/porting_to.html
# -O2 -pipe -fno-plt are taken from makepkg.conf default for archlinux
# _libsarch is architecture dependent
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

    # licensing information is spread over multiple files and folders
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
    
    install -Dpm644 "StatusMonitor/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/StatusMonitor/README"
    popd 
    
    # documentation
    pushd "$srcdir/linux-UFRIILT-drv-v${_pkgver//\./}-uken/Documents"
    install -Dpm644 "README-ufr2lt-5.0xUK.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2lt-5.0xUK.html"
    install -Dpm644 "UsersGuide-ufr2lt-UK.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2lt-UK.html"
    install -Dpm644 "LICENSE-EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Documents/LICENSE-EN.txt"
    popd
    
}
