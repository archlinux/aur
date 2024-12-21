# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: skydrome <skydrome at- protonmail dotcom>

pkgname=coredns-git
pkgver=1.12.0.r3.g177253340
pkgrel=1
pkgdesc="A DNS server that chains plugins"
arch=('i686' 'x86_64')
url="https://coredns.io/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("coredns=$pkgver")
conflicts=('coredns')
source=("git+https://github.com/coredns/coredns.git"
        "coredns-sysusers.conf"
        "coredns-tmpfiles.conf"
        "coredns.service")
sha256sums=('SKIP'
            'f4fd89dcb36f52466ebb1a2ae435dc960cdc828a071f3aaae1d83a39696bff30'
            '20052dded9a02e05013a602e597002ee2a003ecfab3309d30969c28207fc5b72'
            '8a5689eeba6c48945fec84dd0163fdf3d7118aa98ad511992501637f411b1a5c')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "coredns"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "coredns"

  go build \
    ./...
}

check() {
  cd "coredns"

  #go test \
  #  ./...
}

package() {
  cd "coredns"

  GOBIN="$pkgdir/usr/bin" \
    go install ./

  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 man/*.5 -t "$pkgdir/usr/share/man/man5"
  install -Dm644 man/*.7 -t "$pkgdir/usr/share/man/man7"

  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -Dm644 "$srcdir/coredns-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/coredns.conf"
  install -Dm644 "$srcdir/coredns.service" -t "$pkgdir/usr/lib/systemd/system"
}
