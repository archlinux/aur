# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=k0sctl
pkgver=0.28.0
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache-2.0')
makedepends=('go>=1.22')
provides=(k0sctl)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/k0sproject/k0sctl.git#commit=bad9a8d3e83de317c65638681c7a895f1af81614")
sha256sums=('676425fe164746c289688410eb6fb2b355712d9a018f3001ebe37961545a1a67')

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

