# Maintainer: Tom Hale <tom[noodle]hale[point]ee>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=nixnote2
_repo_url="https://github.com/robert7/${_pkgname}.git"
pkgname=${_pkgname}-git
pkgver=2.1.0.beta3.r95.g8f235769
pkgrel=1
pkgdesc="Evernote clone (formerly Nevernote) - git checkout"
url="https://github.com/robert7/nixnote2"
arch=(x86_64)
license=('GPL3')
depends=(java-runtime hicolor-icon-theme poppler-qt5 tidy qt5-webkit)
makedepends=(git)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
source=("${_pkgname}"::git+$_repo_url)
sha256sums=('SKIP')

set -o pipefail

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake PREFIX=/usr
  make
  # Strip the binary to save 160MB of disk in src tree
  strip qmake-build-release/"$_pkgname"
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 shortcuts.txt "${pkgdir}/usr/share/doc/${_pkgname}/shortcuts_sample.txt"
  install -Dm644 docs/{shortcuts-howto,CHANGELOG}.md "${pkgdir}/usr/share/doc/${_pkgname}"
}
