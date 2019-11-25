# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=pistol-git
pkgver=0.0.2.r15.gbd918ca
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64')
_gourl="github.com/doronbehar/pistol"
url="https://$_gourl"
license=('MIT')
makedepends=('go' 'git')
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
  strip -x "$srcdir/bin/pistol"
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname/LICENSE"
  install -Dm755 "$srcdir/bin/pistol" "$pkgdir/usr/bin/pistol"
  chmod -R u+wX "$srcdir/$pkgname/*" &>/dev/null
}

warn_build_references() {
  : # I like __FILE__ and don't consider build references to be a problem
}
# vim:set ts=2 sw=2 et:
