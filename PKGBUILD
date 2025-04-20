# Maintainer: xiliuya <xiliuya@aliyun.com>

_pkgname='eask-cli'
pkgname=$_pkgname-git
pkgver=r0.11.2.f2ea3b25
pkgrel=1
pkgdesc='CLI for building, running, testing, and managing your Emacs Lisp dependencies'
arch=(any)
url='https://github.com/emacs-eask/cli'
license=('GPL-3.0')
depends=('emacs')
makedepends=('git' 'npm')
options=('!strip' '!debug') # node puts scripts into debug section, so we can't strip it
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=($_pkgname::'git+https://github.com/emacs-eask/cli.git')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git tag --sort=-creatordate | head -n1)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    npm i
}

build() {
    cd $_pkgname
    npm run pkg-linux-x64
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cd "$srcdir"
    install -Ddm755 "${pkgdir}/usr/share/emacs/${_pkgname}/"
    install -Dm755 "${_pkgname}/dist/eask" "${pkgdir}/usr/share/emacs/${_pkgname}/eask"
    # ATM eask only works when `lisp` dir is installed together with the binary
    cp -r "${_pkgname}/lisp/" "${pkgdir}/usr/share/emacs/${_pkgname}/lisp"
    ln -s /usr/share/emacs/${_pkgname}/eask $pkgdir/usr/bin/eask
}
