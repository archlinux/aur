# Mantainer: Hownioni <honeyhownihoni at gmail dot com>
# Contributor: Previous submitter's and mantainer's name: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=pistol-git
pkgver=0.4.2.r10.g5e71fe6
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
  export GOPATH="$srcdir"/gopath  

  cd "$srcdir/$pkgname"
  # -fix flag is a no-op when using modules
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
  make build manpage
}

package() {
  cd "$srcdir/$pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm755 "$srcdir/pistol-git/pistol" "$pkgdir/usr/bin/pistol"
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

