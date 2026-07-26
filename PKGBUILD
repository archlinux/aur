# Maintainer: Mr. Tao <tao@post.cz>
# SPDX-License-Identifier: Apache-2.0 OR MIT

pkgname=btrfs-headroom
pkgver=0.1.1
pkgrel=1
pkgdesc='Read-only Btrfs allocator headroom health check'
arch=('x86_64')
url='https://github.com/Mr-Tao/btrfs-headroom'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'systemd')
makedepends=('go' 'scdoc')
optdepends=(
  'jq: parse status for the optional desktop notifier'
  'libnotify: send optional desktop notifications'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('67e1532f01e47e6d8fc3b2385846ffc36b1d591e361995b26f29d07a0c751eeb41f5ea7c0cc31dc2577dace07569f7051e574f6f8c330639d2f387f6ddcb2105')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="$srcdir/go-build-cache"
  export GOMODCACHE="$srcdir/go-mod-cache"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false'

  go build \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -o btrfs-headroom \
    ./cmd/btrfs-headroom

  make man
  mkdir -p build/completions
  ./btrfs-headroom completion bash >build/completions/btrfs-headroom.bash
  ./btrfs-headroom completion zsh >build/completions/_btrfs-headroom
  ./btrfs-headroom completion fish >build/completions/btrfs-headroom.fish
}

check() {
  cd "$pkgname-$pkgver"

  export GOCACHE="$srcdir/go-build-cache"
  export GOMODCACHE="$srcdir/go-mod-cache"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 btrfs-headroom \
    "$pkgdir/usr/bin/btrfs-headroom"
  install -Dm0644 build/man/btrfs-headroom.1 \
    "$pkgdir/usr/share/man/man1/btrfs-headroom.1"
  install -Dm0644 build/completions/btrfs-headroom.bash \
    "$pkgdir/usr/share/bash-completion/completions/btrfs-headroom"
  install -Dm0644 build/completions/_btrfs-headroom \
    "$pkgdir/usr/share/zsh/site-functions/_btrfs-headroom"
  install -Dm0644 build/completions/btrfs-headroom.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/btrfs-headroom.fish"

  install -Dm0644 contrib/systemd/system/btrfs-headroom.service \
    "$pkgdir/usr/lib/systemd/system/btrfs-headroom.service"
  install -Dm0644 contrib/systemd/system/btrfs-headroom.timer \
    "$pkgdir/usr/lib/systemd/system/btrfs-headroom.timer"
  install -Dm0644 contrib/sysusers/btrfs-headroom.conf \
    "$pkgdir/usr/lib/sysusers.d/btrfs-headroom.conf"

  install -Dm0755 contrib/systemd/user/btrfs-headroom-notify \
    "$pkgdir/usr/lib/btrfs-headroom/btrfs-headroom-notify"
  install -Dm0644 contrib/systemd/user/btrfs-headroom-notify.service \
    "$pkgdir/usr/lib/systemd/user/btrfs-headroom-notify.service"
  install -Dm0644 contrib/systemd/user/btrfs-headroom-notify.path \
    "$pkgdir/usr/lib/systemd/user/btrfs-headroom-notify.path"

  install -Dm0644 README.md CONTRIBUTING.md \
    -t "$pkgdir/usr/share/doc/btrfs-headroom"
  install -Dm0644 docs/policy.md docs/security.md \
    -t "$pkgdir/usr/share/doc/btrfs-headroom"
  install -Dm0644 contrib/systemd/README.md \
    "$pkgdir/usr/share/doc/btrfs-headroom/systemd.md"

  install -Dm0644 LICENSE LICENSE-APACHE LICENSE-MIT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
