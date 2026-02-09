#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
_pkgname=quickbib
pkgname=quickbib-git
pkgver=0.6.0
pkgrel=1
pkgdesc="QuickBib — DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
provides=('quickbib')
conflicts=('quickbib')
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 python-doi2bib3)
makedepends=(meson ninja pkgconf)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  # Convert 'v0.4.1-12-gabcdef0' -> '0.4.1.12.gabcdef0'
  git describe --long --tags --abbrev=7 | sed 's/^v//' | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname" || return 1
}

build() {
  # run from the source dir so meson can find meson.build
  cd "$srcdir/$_pkgname" || return 1
  # configure with system prefix (/usr) — meson will stage install into destdir
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$srcdir/$_pkgname" || return 1
  meson install -C builddir --destdir="$pkgdir"
}
