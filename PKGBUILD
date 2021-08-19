# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcraddrgen-git
pkgver=20201101
pkgrel=1
pkgdesc="Simple offline address generator for Decred."
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'go')
groups=('decred')
url="https://github.com/decred/dcraddrgen"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/decred/dcraddrgen)
sha256sums=('SKIP')
provides=('dcraddrgen')
conflicts=('dcraddrgen')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o . ./...
}

package() {
  cd ${pkgname%-git}
  install -Dm755 dcraddrgen "$pkgdir"/usr/bin/dcraddrgen
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/dcraddrgen"
}