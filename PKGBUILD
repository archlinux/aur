# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

_gitname=i3lock-color
pkgname="$_gitname-git"
pkgver=r506.5bbdd02
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/PandorasFox/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'xcb-util-xrm' 'pam' 'libev' 'cairo' 'libxkbcommon-x11' 'libjpeg-turbo')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
makedepends=('git')
source=("git+https://github.com/PandorasFox/$_gitname.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"
}

build() {
    cd "${srcdir}/${_gitname}"
    # https://bugs.archlinux.org/task/31544
    sed -i -e 's:login:system-auth:' pam/i3lock

    git tag -f "aur-$(git rev-parse --short HEAD)"
    autoreconf -fi
    ./configure --prefix="/usr" --sysconfdir="/etc"
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
