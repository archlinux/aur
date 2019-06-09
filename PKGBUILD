# Maintainer: LinRs <LinRs at users.noreply.github.com>
# Contributor: sballert <sballert@posteo.de>

_gituser="AndreaCrotti"
_gitrepo="yasnippet-snippets"

pkgname=emacs-yasnippet-snippets-git
pkgver=0.11.r2.g15e4b08
pkgrel=1
pkgdesc="Collection of yasnippet snippets for many languages"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-yasnippet')
makedepends=('git')
provides=('emacs-yasnippet-snippets')
conflicts=('emacs-yasnippet-snippets')
source=("git+${url}.git")
sha256sums=('SKIP')
install=emacs-yasnippet-snippets.install

pkgver() {
    cd "$_gitrepo"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
    cd "${srcdir}/${_gitrepo}"
    emacs -q --no-site-file --no-splash -batch -L . -f batch-byte-compile *.el
}
package() {
    cd "$_gitrepo"
    install -d  "$pkgdir"/usr/share/emacs/snippets/"${_gitrepo}"
    cp *.el{,c} "${pkgdir}/usr/share/emacs/snippets/${_gitrepo}"
    cp -r snippets/* "$pkgdir"/usr/share/emacs/snippets/"${_gitrepo}"
}
