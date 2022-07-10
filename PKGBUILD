# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=pistol-git
pkgver=0.3.2.r7.g4b834a9
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64')
_gourl="github.com/doronbehar/pistol"
url="https://$_gourl"
license=('MIT')
makedepends=('go' 'git' 'asciidoctor' 'make')
depends=('file')
optdepends=('ranger: file browser to preview files in' 'lf: file browser to preview files in')
source=("$pkgname::git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cuts off 'v' prefix and uses most recent
  # un-annotated tag reachable from the last commit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  # -fix flag is a no-op when using modules
  GOPATH="$srcdir" go get -v "$_gourl/cmd/pistol"
  make build manpage
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}

post_upgrade() {
  echo "Please replace every occurrence of %s with %pistol-filename% in your pistol.conf file if you haven't already done so."
}

warn_build_references() {
  : # I like __FILE__ and don't consider build references to be a problem
}
# vim:set ts=2 sw=2 et:
