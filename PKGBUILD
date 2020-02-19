# Maintainer: Peter <craven@gmx.net>
# Contributor: Jonathon Fernyhough <jonathon"manjaro+org>

pkgname=chez-scheme-git
_pkgname=ChezScheme
pkgver=9.5.r65.gd8c2704
pkgrel=4
pkgdesc="Chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) with numerous language and programming environment extensions. (threaded build)"
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
license=('Apache')
depends=('ncurses')
makedepends=('git' 'libx11' 'xorgproto')
provides=(chez-scheme)
conflicts=(petite-chez-scheme)
replaces=(petite-chez-scheme)
source=('git+https://github.com/cisco/ChezScheme.git'
        'git+https://github.com/nanopass/nanopass-framework-scheme.git'
        'git+https://github.com/dybvig/stex.git'
        'git+https://github.com/madler/zlib.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  rmdir nanopass stex zlib
  ln -s ../nanopass-framework-scheme nanopass
  ln -s ../stex
  ln -s ../zlib
}

build() {
  cd "$_pkgname"
  ./configure --installprefix=/usr --temproot="$pkgdir" --threads
  make
}

package() {
  make -C "$_pkgname" DESTDIR="$pkgdir"/ install InstallSchemeName=chez-scheme
  # Replace duplicated files with symlinks
  cd "$pkgdir"/usr/lib/csv*/ta6le
  rm chez-scheme.boot scheme-script.boot
  ln -s scheme.boot chez-scheme.boot
  ln -s scheme.boot scheme-script.boot
}

# vim:set ts=2 sw=2 et:
