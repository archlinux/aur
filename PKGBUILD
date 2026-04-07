# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=vxwm-git
pkgver=2.2.r88.g24bbb12
pkgrel=1
pkgdesc="Versatile X Window Manager for X11, a modular dwm fork with infinite tags"
arch=('x86_64')
url="https://codeberg.org/wh1tepearl/vxwm"
license=('MIT')
depends=('fontconfig' 'libx11' 'libxft' 'libxinerama')
makedepends=('git')
provides=('vxwm')
conflicts=('vxwm')
source=("vxwm::git+https://codeberg.org/wh1tepearl/vxwm.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vxwm"
    printf "%s.r%s.g%s" \
        "$(awk '/^VERSION/ {print $3}' config.mk)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/vxwm"
    sed -i 's|^PREFIX = /usr/local|PREFIX = /usr|' config.mk
    sed -i 's|-DSRCDIR=\\"${CURDIR}\\"|-DSRCDIR=\\"https://codeberg.org/wh1tepearl/vxwm\\"|' config.mk
    sed -i 's|^LDFLAGS  = ${LIBS}|LDFLAGS  = ${LIBS} -Wl,-z,relro,-z,now|' config.mk
}

build() {
    cd "${srcdir}/vxwm"
    make
}

package() {
    cd "${srcdir}/vxwm"
    make DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE.dwm "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.dwm"
}
