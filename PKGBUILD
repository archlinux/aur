# Maintainer: jgmdev <jgmdev@gmail.com>
# Contributor: FreeByrd <nelsonbyrd248@gmail.com>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: erm67 <erm67@yahoo.it>
# Contributor: ssfdust <ssfdust@gmail.com>

pkgname=cairo-dock-core-wayland-git
pkgver=3.4.99.alpha1.20231227.85830c2c
pkgrel=1
pkgdesc='Light eye-candy fully themable animated dock with wayland support'
arch=('i686' 'x86_64')
url='https://github.com/dkondor/cairo-dock-core'
license=('GPL')
depends=('curl' 'dbus-glib' 'glu' 'gtk3' 'librsvg' 'wayland' 'gtk-layer-shell')
makedepends=('cmake' 'git' 'extra-cmake-modules')
optdepends=(
  'wayfire-plugins-scale-ipc: Additional functionality on wayfire'
)
provides=("${pkgname%-git}" "cairo-dock")
conflicts=("${pkgname%-git}" "cairo-dock")
source=("${pkgname}::git+https://github.com/dkondor/cairo-dock-core.git#branch=wayland_new")
sha256sums=('SKIP')

_builddir="build"

pkgver () {
    cd "${srcdir}/${pkgname}"
    eval echo -n `grep -oP 'set\s*\(VERSION\s+\K(.*)(?=\))' CMakeLists.txt`
    printf ".%s.%s" "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" "$(git rev-parse --short HEAD)"
}

prepare() {
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
