# Maintainer: tarball <bootctl@gmail.com>

pkgname=weron
pkgver=0.2.7
pkgrel=1
pkgdesc='Overlay networks based on WebRTC'
url='https://github.com/pojntfx/weron'
arch=(i686 x86_64 aarch64 riscv64)
license=(AGPL-3.0-only)
makedepends=(go)
depends=(glibc)
optdepends=(
  'postgresql: for local PostgreSQL database'
  'redis: for local Redis instance'
)
install=weron.install
backup=(etc/weron/signaler)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        ethernet.env
        ip.env
        signaler.env
        weron-ethernet@.service
        weron-ip@.service
        weron-signaler.service)
sha256sums=('ead33632606f3141392b54f817dabca4c23b7886f8b55845b4f2dba9572a97f7'
            '967fd86292086ea7270addd614893a99220b8604f54d58015f7ba2718eb032ed'
            'fc7d39d2d277a8448d3bede8bbb5195c62f92149dfd7ef897a582ece627c4851'
            'e0f95aeb604cdaca71611c218e1a8eddbe6951b783b498e8cab3e2152eefc9c6'
            '028d75a488d637356cc79493e1c1b333a2021c2884cb32f4e16a3624136f242f'
            '0f90f473cac6c5c447b49fedfa23c72cff977afa88a8e7cd3d9f38e21a5e4b01'
            '583915ee1118c4078b808a282cec901e85a79ba792c2f66f57dbce46ad764622')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$pkgname-$pkgver"
  mkdir -p out
  go build -o out/weron ./cmd/weron

  for sh in bash fish zsh; do
    ./out/weron completion $sh >out/comp.$sh
  done
}

check() {
  cd "$pkgname-$pkgver"
  go test -parallel "$(nproc)" ./...
}

package() {
  install -dm750 "$pkgdir/etc/weron"
  install -Dm640 signaler.env "$pkgdir/etc/weron/signaler"
  install -Dm644 ethernet.env "$pkgdir/etc/weron/examples/ethernet"
  install -Dm644 ip.env "$pkgdir/etc/weron/examples/ip"

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" \
    weron-signaler.service \
    weron-ethernet@.service \
    weron-ip@.service

  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm755 out/weron -t "$pkgdir/usr/bin/"

  install -Dm644 out/comp.bash "$pkgdir/usr/share/bash-completion/completions/weron"
  install -Dm644 out/comp.fish "$pkgdir/usr/share/fish/vendor_completions.d/weron.fish"
  install -Dm644 out/comp.zsh "$pkgdir/usr/share/zsh/site-functions/_weron"
}
