# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=k0sctl
pkgver=0.27.1
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache-2.0')
makedepends=('go>=1.22')
provides=(k0sctl)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/k0sproject/k0sctl.git#commit=c7ee91b2f1a36c447590993cbb133028882271df")
sha256sums=('fb41069ff0930fb99017989953197689b6578b571527aacf65cf7667c9cb6ffd')

build() {
  cd "k0sctl"
  local git_tag="$(git rev-parse --short=7 HEAD)"
  local definitions="-X 'github.com/k0sproject/k0sctl/version.Environment=production' -X 'github.com/carlmjohnson/versioninfo.Revision=${git_tag}' -X 'github.com/carlmjohnson/versioninfo.Version=${pkgver}'"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "${definitions} -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o k0sctl \
    main.go
}

package() {
  local bin="$pkgdir/usr/bin/k0sctl"
  install -D -m755 "$srcdir/k0sctl/k0sctl" "$bin"
  "$bin" completion --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k0sctl"
  "$bin" completion --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k0sctl"
  "$bin" completion --shell fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k0sctl.fish"
}

