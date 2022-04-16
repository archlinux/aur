# Maintainer: Ryo Munakata <afpacket@gmail.com>
# Rebased on glmark2 (https://aur.archlinux.org/packages/glmark2/)
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: farseerfc <farseerfc@gmail.com>
pkgname=glmark2-git
pkgver=r971.af498f4
pkgrel=1
pkgdesc="An OpenGL 2.0 and ES 2.0 benchmark (X11, Wayland, DRM)"
arch=('x86_64' 'aarch64')
url="https://github.com/glmark2/glmark2"
license=('GPL' 'custom')
depends=('libjpeg-turbo' 'libpng' 'libx11' 'mesa' 'systemd-libs' 'libgl' 'libgles' 'wayland' 'egl-wayland')
makedepends=('git' 'meson' 'systemd' 'wayland-protocols')
conflicts=('glmark2')
provides=('glmark2')
source=("$pkgname"::'git+https://github.com/glmark2/glmark2.git')
md5sums=('SKIP')

# GLMARK2 features
GM2_FLAVORS="x11-gl,x11-glesv2,wayland-gl,wayland-glesv2,drm-gl,drm-glesv2"

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    pwd
    arch-meson "$pkgname" build -Dflavors=${GM2_FLAVORS}
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    cd "$pkgname"
    install -Dm644 COPYING.SGI -t "$pkgdir/usr/share/licenses/$pkgname"
}
