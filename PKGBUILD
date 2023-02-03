# Maintainer: SahibBommelig <sahib@online.de>
# rmlint PKBUILD for ArchLinux
 
_pkgname=rmlint
pkgbase="${_pkgname}-git"
pkgname=('rmlint-git' 'rmlint-shredder-git')
pkgver=2.10.1.r34.g2711b84b
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL3')
makedepends=(
  'git'
  'scons'
)

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe master --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  scons config
  scons -j4 DEBUG=1 --prefix=${pkgdir}/usr --actual-prefix=/usr
}

package_rmlint-git() {
  pkgdesc="Tool to remove duplicates and other lint, being much faster than fdupes"
  depends=(
    'glib2'
    'libelf'
  )

  provides=("$_pkgname")
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgname"
  scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr

  rm -rf "$pkgdir"/usr/share/{glib-2.0,icons,applications}
  rm -rf "$pkgdir"/usr/lib
}

package_rmlint-shredder-git() {
  pkgdesc="Graphical user interface for rmlint"
  depends=(
    'gtksourceview3'
    'python-cairo'
    'python-colorlog'
    'python-gobject'
    'python-parsedatetime'
    'rmlint'
    'xdg-utils'
  )

  provides=("rmlint-shredder")
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgname"
  scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr

  rm -rf "$pkgdir"/usr/{bin,share/locale,share/man}
  rm "$pkgdir"/usr/share/glib-2.0/schemas/gschemas.compiled
}
