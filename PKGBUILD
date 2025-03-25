# Maintainer: SahibBommelig <sahib@online.de>
# Co-Maintainer: Fermin Olaiz <ferminolaiz@gmail.com>
# Last packager: Vassili Tchersky <vt+arch@vbc.su>
# rmlint PKBUILD for ArchLinux
 
_pkgname=rmlint
pkgbase="${_pkgname}-git"
pkgname=('rmlint-git' 'rmlint-shredder-git')
pkgver=2.10.3.r0.g2fe7dc80
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL3')
makedepends=(
  'git'
  'scons'
  'python-sphinx'
  'python-setuptools'
)
optdepends=(
  'util-linux-libs'
  'json-glib'
  'gettext'
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
  scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr --without-gui
}

package_rmlint-shredder-git() {
  pkgdesc="Graphical user interface for rmlint"
  depends=(
    'gtksourceview4'
    'python-cairo'
    'python-colorlog'
    'python-gobject'
    'python-parsedatetime'
    'rmlint'
    'librsvg'
    'xdg-utils' )

  provides=("rmlint-shredder")
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgname"
  scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr --without-compile-glib-schemas

  rm -rf "$pkgdir"/usr/share/{locale,man}
  rm -f "$pkgdir"/usr/bin/rmlint
}
