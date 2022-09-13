# Maintainer: Cirk2 <privat+aur at cirk2 dot de> 

pkgbase=sdbus-cpp-git
_pkgbase=sdbus-cpp
pkgname=(${_pkgbase}-git ${_pkgbase}-doc-git)
pkgver=1.2.0.4.r317.d20220905.74d849d
pkgrel=1
epoch=2
pkgdesc="sdbus-c++ is a high-level C++ D-Bus library for Linux designed to provide expressive, easy-to-use API in modern C++"
url="https://github.com/Kistler-Group/sdbus-cpp"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'custom:sdbus-c++ LGPL Exception 1.0')
depends=('systemd-libs' 'expat')
makedepends=('systemd' 'git' 'cmake' 'doxygen')
provides=(
  "${pkgbase}=${pkgver}"
  "${pkgbase}-git=${pkgver}"
  "${pkgbase}-${_pkgvariant}=${pkgver}"
)
conflicts=(
  "${_pkgbase}"
)
source=("${pkgbase}::git+https://github.com/Kistler-Group/sdbus-cpp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgbase}"
    _ver="$(git describe --tags | sed 's|^v||' | awk -F'-' '{print $1}')"
    _subver="$(git describe --tags | awk -F'-' '{print $2}')"
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"
    _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
    if [ -z ${_ver} ]; then
        error "Error in ${FUNCNAME[0]}: Version information could not determined."
        return 1
    fi
    printf '%s' "${_ver}.${_subver}.r${_rev}.d${_date}.${_hash}"
}

build() {

    cmake -B build -S "$srcdir/${pkgbase}" \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DCMAKE_BUILD_TYPE='Release' \
        -DBUILD_CODE_GEN=ON \
        -DBUILD_DOXYGEN_DOC=ON

    cmake --build build
    cmake --build build --target doc

    # Install so we can split the packaging up later
    DESTDIR="$srcdir/fakeinstall" cmake --install build

    # Remove references to $srcdir
    find "$srcdir/fakeinstall/usr/share/doc" -name \*.html -print -exec sed \
         -e "s|${srcdir}/sdbus-cpp/include|/usr/include|g" \
         -e "s|${srcdir}/sdbus-cpp||" \
         -i {} \;
}

package_sdbus-cpp-git() {
  local dir
  install -Dm644 "$srcdir/${pkgbase}/COPYING-LGPL-Exception" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"

  for dir in lib include bin ; do
    install -dm755 "$pkgdir/usr/$dir"
    cp  -dr --no-preserve=owner "$srcdir/fakeinstall/usr/$dir/"* "$pkgdir/usr/$dir"
  done
}

package_sdbus-cpp-doc-git() {
  local dir
  for dir in share/doc ; do
    install -dm755 "$pkgdir/usr/$dir"
    cp  -dr --no-preserve=owner "$srcdir/fakeinstall/usr/$dir/"* "$pkgdir/usr/$dir"
  done
}
