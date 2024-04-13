# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=k0sctl
pkgver=0.17.5
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache-2.0')
makedepends=('go>=1.21')
provides=(k0sctl)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/k0sproject/k0sctl.git#commit=cd5b8ef8e8969209376e9243a5c56c0606710bd8")
sha256sums=('ad12a9c1932870663dd3274fb8a99ef1f1e92674d742929acbf1a4d08b1ca08c')

build() {
  cd "k0sctl"
  local git_tag="$(git rev-parse --short=7 HEAD)"
  local definitions="-X 'github.com/k0sproject/k0sctl/version.Environment=production' -X 'github.com/carlmjohnson/versioninfo.Revision=${git_tag}' -X 'github.com/carlmjohnson/versioninfo.Version=${pkgver}-${pkgrel}'"

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

