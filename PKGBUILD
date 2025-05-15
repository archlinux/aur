# Maintainer: jgmdev <jgmdev@gmail.com>
# Contributor: FreeByrd <nelsonbyrd248@gmail.com>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: erm67 <erm67@yahoo.it>
# Contributor: ssfdust <ssfdust@gmail.com>

pkgname=cairo-dock-core-wayland-git
pkgver=3.5.99.rc2.20250308.a77d61b7
pkgrel=1
pkgdesc='Light eye-candy fully themable animated dock with wayland support'
arch=('i686' 'x86_64')
url='https://github.com/Cairo-Dock/cairo-dock-core'
license=('GPL')
depends=('curl' 'dbus-glib' 'glu' 'gtk3' 'librsvg' 'libxml2' 'wayland' 'gtk-layer-shell')
makedepends=('cmake' 'git' 'extra-cmake-modules')
optdepends=(
  'wayfire-plugins-scale-ipc: Additional functionality on wayfire'
)
provides=("${pkgname%-git}" "cairo-dock")
conflicts=("${pkgname%-git}" "cairo-dock")
options=(debug)
source=(
    "${pkgname}::git+https://github.com/Cairo-Dock/cairo-dock-core.git"
)
sha256sums=(
    'SKIP'
)

_builddir="build"

pkgver () {
    cd "${srcdir}/${pkgname}"
    eval echo -n `grep -oP 'set\s*\(VERSION\s+\K(.*)(?=\))' CMakeLists.txt`
    printf ".%s.%s" "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    
    # if patches are present, apply them
    for patch in $(ls "${srcdir}"/*.patch); do
        msg2 "Applying $(basename "$patch")"
        patch -Np1 -i "$patch"
    done

    if [[ -d "${srcdir}/${pkgname}/${_builddir}" ]];
    then
        rm -rf "${srcdir}/${pkgname}/${_builddir}"
    fi
    mkdir "${srcdir}/${pkgname}/${_builddir}"
}

build() {
    cd "${srcdir}/${pkgname}/${_builddir}"

    cmake .. \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}/${_builddir}"
  
    make DESTDIR="${pkgdir}" install
}
