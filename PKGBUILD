# Maintainer: Vassili Tchersky <vt+arch@vbcy.org>
# Maintainer: Fermin Olaiz <ferminolaiz@gmail.com>
# Contributor: SahibBommelig <sahib@online.de>
 
_pkgname=rmlint
pkgbase="${_pkgname}-git"
pkgname=('rmlint-git' 'rmlint-shredder-git')
pkgver=2.10.3.r10.g8588a71f
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

source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git fetch origin
  git checkout -B glib_hotfix origin/hotfix/glib_option_removal
}
 
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe glib_hotfix --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    'rmlint-git'
    'librsvg'
    'xdg-utils' )

  provides=("rmlint-shredder")
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgname"
  scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr --without-compile-glib-schemas

  rm -rf "$pkgdir"/usr/share/{locale,man}
  rm -f "$pkgdir"/usr/bin/rmlint
}
