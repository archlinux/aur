# Maintainer: Mr. Tao <tao@post.cz>
# SPDX-License-Identifier: Apache-2.0 OR MIT

pkgname=libinput-curve-git
pkgver=0.1.0.r0.g8093b59
pkgrel=1
pkgdesc='Plan, apply, and persist custom libinput curves under Xorg'
arch=('x86_64')
url='https://github.com/Mr-Tao/libinput-curve'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'xf86-input-libinput' 'xorg-xinput')
makedepends=('git' 'go' 'scdoc')
optdepends=('systemd: optional X11-session watcher')
provides=("libinput-curve=$pkgver")
conflicts=('libinput-curve')
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  if git describe --long --tags --abbrev=7 --match 'v[0-9]*' >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' |
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' \
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
  export GO111MODULE=on
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false'

  go build \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -o libinput-curve \
    ./cmd/libinput-curve

  make man
  mkdir -p build/completions
  ./libinput-curve completion bash >build/completions/libinput-curve.bash
  ./libinput-curve completion zsh >build/completions/_libinput-curve
  ./libinput-curve completion fish >build/completions/libinput-curve.fish
}

check() {
  cd "$pkgname"

  export GOCACHE="$srcdir/go-build-cache"
  export GOMODCACHE="$srcdir/go-mod-cache"
  export GO111MODULE=on

  go test ./...
}

package() {
  cd "$pkgname"

  install -Dm0755 libinput-curve \
    "$pkgdir/usr/bin/libinput-curve"
  install -Dm0644 build/man/libinput-curve.1 \
    "$pkgdir/usr/share/man/man1/libinput-curve.1"
  install -Dm0644 build/completions/libinput-curve.bash \
    "$pkgdir/usr/share/bash-completion/completions/libinput-curve"
  install -Dm0644 build/completions/_libinput-curve \
    "$pkgdir/usr/share/zsh/site-functions/_libinput-curve"
  install -Dm0644 build/completions/libinput-curve.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/libinput-curve.fish"
  install -Dm0644 contrib/systemd/libinput-curve-watch.service \
    "$pkgdir/usr/lib/systemd/user/libinput-curve-watch.service"
  install -Dm0644 examples/windows-epp-reference.json \
    "$pkgdir/usr/share/doc/libinput-curve/examples/windows-epp-reference.json"
  install -Dm0644 README.md CONTRIBUTING.md docs/*.md \
    -t "$pkgdir/usr/share/doc/libinput-curve"
  install -Dm0644 contrib/systemd/README.md \
    "$pkgdir/usr/share/doc/libinput-curve/systemd.md"
  install -Dm0644 LICENSE LICENSE-APACHE LICENSE-MIT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
