# Maintainer: Brandon Clifford <brandon099 at gmail dot com>
# Co-Maintainer: Raymo111 <aur@raymond.li>

_gitname=i3lock-color
pkgname="$_gitname-git"
pkgver=r898.32a1437
pkgrel=1
pkgdesc="The world's most popular non-default computer lockscreen."
arch=('i686' 'x86_64')
url="https://github.com/Raymo111/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'xcb-util-xrm' 'pam' 'libev' 'cairo' 'libxkbcommon-x11' 'libjpeg-turbo')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
makedepends=('git')
source=("git+https://github.com/Raymo111/$_gitname.git")
md5sums=('SKIP')
backup=('etc/pam.d/i3lock')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"
}

build() {
    cd "${srcdir}/${_gitname}"
    git tag -f "aur-$(git rev-parse --short HEAD)"
    autoreconf -fi
	./configure --prefix=/usr \
        --sysconfdir=/etc \
        --enable-debug=no \
        --disable-sanitizers
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 i3lock-bash "${pkgdir}/usr/share/bash-completion/completions/i3lock"
    install -Dm644 i3lock-zsh "${pkgdir}/usr/share/zsh/vendor-completions/_i3lock"
}
