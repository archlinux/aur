# Maintainer: Tom Hale <tom[noodle]hale[point]ee>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=nixnote2
pkgname=${_pkgname}-git
pkgver=2.1.0.beta4g.r17.g2065b702
pkgrel=5
pkgdesc='Evernote clone (formerly Nevernote) - git checkout'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(hunspell java-runtime hicolor-icon-theme poppler-qt5 tidy qt5-webkit)
makedepends=(boost gcc git qt5-tools)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake PREFIX=/usr
  make -j "$(nproc)"
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" CONTRIBUTING.md debian/changelog
  # shortcuts.txt is referenced in doc:
  # https://github.com/robert7/nixnote2/wiki/HowTo---Customize-keyboard-shortcuts
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/" shortcuts.txt
}
