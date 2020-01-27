# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

set -u
pkgbase='cnrdrvcups-lb'
pkgname="${pkgbase}"
# The download link changes with every version, try to keep changes in one place
_pkgver='5.10';  _dl='8/0100007658/13'

pkgver="${_pkgver}"
pkgrel='1'
pkgdesc='CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers'
arch=('x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('GPL2' 'MIT' 'custom')
# parts of the code are GPL or MIT licensed, some parts have a custom license
makedepends=('jbigkit' 'gzip' 'gtk2')
depends=('gcc-libs' 'libxml2' 'libglade')
optdepends=('libjpeg6-turbo: improves printing results for color imageRUNNER/i-SENSYS LBP devices'
                        'gtk2: for cnsetuputil2')


conflicts=('cndrvcups-lb' 'cndrvcups-common-lb')
options=('!emptydirs' '!strip' '!libtool')

source=(
  "http://gdlp01.c-wss.com/gds/${_dl}/linux-UFRII-drv-v${_pkgver//\./}-uken-08.tar.gz"
)
md5sums=('c80793681b666766cedf864a3fd20dd7')
sha512sums=('dbc8b8e600ec29e73afa4ba8a760fd643d58ee2017f6c3c35e63c7f2186cf0cb675adb0ea344b0bd04d0b4fa7f13763b5ce97e8264790356134e6ded3069bf54')

# variables that are useful in whole PKGBUILD
    _srcdir="extracted-${pkgbase}-${pkgver}"
    _common_dir="cnrdrvcups-common-${_pkgver}"
    _driver_dir="cnrdrvcups-lb-${_pkgver}"


prepare() {

    # In order to keep $srcdir structure tidy we need a place for the extracted sources
    mkdir "${_srcdir}"
    cd "${_srcdir}"
    set -u
    bsdtar -xf "${srcdir}/linux-UFRII-drv-v${_pkgver//\./}-uken/Sources/${pkgbase}-${pkgver}-1.tar.gz"

    local _specs=(cnrdrvcups-*.spec)
    if [ "${#_specs[@]}" -ne 1 ]; then
        echo 'Too many or too few spec files'
        set +u
        false
    fi

    # It isn't easy to get sed to add LIBS at the right place of the soon to be generated make script
    # so we patch it directly into autogen.sh
    sed -e '2a export LIBS="-lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lgmodule-2.0"' -i "cnrdrvcups-common-${_pkgver}/cngplp/autogen.sh"

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
    for i in "cngplp/files" "cngplp" "cpca" "pdftocpca"
    do
        pushd "$i"
        autoreconf -i
        popd
    done
    popd

    # allgen.sh where available is not useful for packaging
    # Debian rules has some undesirable functionality
    # The spec file packages well and is easy to fix and convert to shell

    # Generate make from spec %setup, %build
    sed -n -e '/^%setup/,/^%install/ p' "${_specs[@]}" | \
    grep -v '^%' | \
    sed -e '# Convert spec %{VAR} to shell ${VAR}' \
        -e 's:%{:${:g' \
        -e '# Some autogen left out --prefix. More than one --prefix dont cause problems so we can add it to all of them.' \
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

    set +u
}

_setvars() {
    # variables used by the (generated) make.Arch &  make.install.Arch files
  # relative paths start are supposed to be located under "${srcdir}/${_srcdir}"
  
  # _lib32dirs should no longer be necessary
  # declare -A _lib32dirs=([i686]='lib' [x86_64]='lib32')
  _vars=(
    _builddir="${srcdir}/${_srcdir}"
    common_dir="${_common_dir}"
    driver_dir="${_driver_dir}"
    utility_dir="cnrdrvcups-utility-${_pkgver}"
    RPM_BUILD_DIR="${srcdir}/${_srcdir}"
    _prefix='/usr'
    _machine_type="MACHINETYPE="$CARCH
    _cflags="CFLAGS=-march=x86-64"
    _libdir='/usr/lib'
    _bindir='/usr/bin'
    locallibs='/usr/lib/'
    _includedir='/usr/include'
    b_lib_dir="${srcdir}/${_srcdir}/lib"
    b_include_dir="${srcdir}/${_srcdir}/include"
    _libsarch='libs64'
  )
# The spec file uses 2 values in _cflags, but configure fails with more then one value
# b_lib_dir and b_include_dir are set to ${_builddir}/lib & ${_builddir}/include in the .spec-file
# todo : test whether _buildddir can be used in the same array it's set
# _libsarch is architecture dependent
}

build() {
  set -u

  cd "${_srcdir}"
  local _vars; _setvars
  # Bash does not recognize var assigments hidden by array expansion so we use env.
  env "${_vars[@]}" \
  sh -e -u -x 'make.Arch'

  set +u
}

package() {
    set -u
    cd "${_srcdir}"

    local _vars; _setvars
    env "${_vars[@]}" \
    RPM_BUILD_ROOT="${pkgdir}" \
    sh -e -u -x 'make.install.Arch'

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
    
    install -Dpm644 "pdftocpca/README" "${pkgdir}/usr/share/licenses/${pkgname}/${_driver_dir}/pdftocpca/README"
    popd 
    
    # documentation
    pushd "$srcdir/linux-UFRII-drv-v${_pkgver//\./}-uken/Documents"
    install -Dpm644 "README-ufr2-5.1xUK.html" "${pkgdir}/usr/share/doc/${pkgname}/README-ufr2-5.1xUK.html"
    install -Dpm644 "UsersGuide-ufr2-UK.html" "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide-ufr2-UK.html"
    install -Dpm644 "LICENSE-EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Documents/LICENSE-EN.txt"
    popd
    
    set +u
}

set +u
