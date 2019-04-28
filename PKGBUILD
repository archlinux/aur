# Maintainer: LinRs <LinRs at users.noreply.github.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-yasnippet-git
epoch=1
pkgver=0.13.0.r28.gfc33b2f
pkgrel=1
pkgdesc="Yet another template system for Emacs - git version"
arch=('any')
url="https://github.com/joaotavora/yasnippet"
license=('GPL')
depends=('emacs')
makedepends=('git' 'ruby-rake')
provides=('emacs-yasnippet')
conflicts=('emacs-yasnippet')
install=yasnippet.install
source=("git+${url}.git")
sha256sums=('SKIP')
_gitname=yasnippet

pkgver() {
    cd $_gitname
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}"
    rake yasnippet.elc
    rake yasnippet-debug.elc
    rake yasnippet-tests.elc #emacs=24.3 tests_Werror=nil
}
check() {
    cd "${_gitname}"
    rake tests
}
package () {
    cd "${_gitname}"
    install -d "${pkgdir}/usr/share/emacs/site-lisp/${_gitname}"
    cp -r * "${pkgdir}/usr/share/emacs/site-lisp/${_gitname}"
}
