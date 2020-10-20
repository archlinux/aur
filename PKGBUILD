# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=croc-git
pkgver=8.5.2.r2.gf562400
pkgrel=1
pkgdesc="Easily and securely send things from one computer to another"
arch=('i686' 'x86_64')
url="https://schollz.com/blog/croc6/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('croc')
conflicts=('croc')
source=("git+https://github.com/schollz/croc.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "croc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "croc"

  go build \
    ./...
}

check() {
  cd "croc"

  go test \
    ./...
}

package() {
  cd "croc"

  install -Dm755 "croc" -t "$pkgdir/usr/bin"
  install -Dm644 "croc.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/croc"
}
