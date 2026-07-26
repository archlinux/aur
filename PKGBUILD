# Maintainer: Mr. Tao <tao@post.cz>
# SPDX-License-Identifier: Apache-2.0 OR MIT

pkgname=btrfs-headroom-git
pkgver=0.1.1.r1.g441eb4d
pkgrel=1
pkgdesc='Read-only Btrfs allocator headroom health check'
arch=('x86_64')
url='https://github.com/Mr-Tao/btrfs-headroom'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'systemd')
makedepends=('git' 'go' 'scdoc')
optdepends=(
  'jq: parse status for the optional desktop notifier'
  'libnotify: send optional desktop notifications'
)
provides=("btrfs-headroom=$pkgver")
conflicts=('btrfs-headroom')
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  if git describe --long --tags --abbrev=7 --match 'v[0-9]*' >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' |
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.1.r%s.g%s' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$pkgname"

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
  cd "$pkgname"

  export GOCACHE="$srcdir/go-build-cache"
  export GOMODCACHE="$srcdir/go-mod-cache"

  go test ./...
}

package() {
  cd "$pkgname"

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
