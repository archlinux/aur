# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgbase=lib32-wayland-git
pkgname=('lib32-wayland-git')
pkgver=1.19.0.r23.g3e897fa
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
provides=('lib32-wayland')
conflicts=('lib32-wayland')
license=('MIT')
depends=('lib32-glibc' 'lib32-libffi' 'lib32-expat' 'lib32-libxml2' 'wayland')
makedepends=('git')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git')
sha256sums=('SKIP')

pkgver() {
    cd wayland
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

    meson build wayland --buildtype='release' --prefix='/usr' --libdir=/usr/lib32 -D documentation=false
}

package() {
     DESTDIR="$pkgdir" ninja -C build install
     rm -rf "${pkgdir}"/usr/{bin,include,share}

#     install -dm 755 "${pkgdir}"/usr/share/licenses
#     ln -s wayland "${pkgdir}"/usr/share/licenses/lib32-wayland
}
