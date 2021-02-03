# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Sam A. Horvath-Hunt <hello at samhh dot com>

_pkgauthor=ambientsound
_upstream_pkgname=pms
pkgname=pms-git
pkgver=0.42.r835.gcae1f02
pkgrel=2
pkgdesc='Practical Music Search is an interactive Vim-like console client for the Music Player Daemon.'
arch=('x86_64')
makedepends=(
  'go'
  'git'
)
license=('MIT')
url="https://github.com/$_pkgauthor/$_upstream_pkgname"
source=("$_upstream_pkgname::git+https://github.com/$_pkgauthor/$_upstream_pkgname.git")
sha256sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/gopath"
}

pkgver() {
  cd "$_upstream_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_upstream_pkgname"
  sed -i 's|go install -ldflags="-X main.buildVersion=${VERSION}"|CGO_ENABLED=0 go install -ldflags="-X main.buildVersion=${VERSION}"|' Makefile
  make install
}

package() {
  install -Dm755 "$GOPATH/bin/$_upstream_pkgname" "$pkgdir/usr/bin/$_upstream_pkgname"
  install -Dm644 "$_upstream_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_upstream_pkgname/LICENSE"
}
