# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=k0sctl
pkgver=0.32.2
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache-2.0')
makedepends=('go>=1.26')
provides=(k0sctl)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/k0sproject/k0sctl.git#commit=f4005b6b9b22f72ba700b5ee17e9852e5d691193")
sha256sums=('4ad07886ae6a64522da65e54eaa27ff0d65f7130f759ea3e51b1500bd1b313a6')

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

