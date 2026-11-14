# Maintainer: azerty
# Owner: ycftbwc

pkgname=gecit-unofficial
pkgver=0.2.1.r22.gcc66cdd
pkgrel=1
pkgdesc="DPI bypass tool using eBPF and fake TLS ClientHello injection"
arch=('x86_64' 'aarch64')
url="https://github.com/ycftbwc/gecit-unofficial"
license=('GPL-3.0-only')
depends=('systemd')
makedepends=('go>=1.26.1' 'git' 'clang' 'llvm' 'libbpf' 'make')
provides=('gecit')
conflicts=('gecit')
install="${pkgname}.install"
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.2.1.r%s.g%s" \
      "$(git rev-list --count 8e05f38..HEAD 2>/dev/null || git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$pkgname"

  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-modcacherw"

  go mod download
  go install -mod=readonly github.com/boratanrikulu/gobee/cmd/gobee
}

build() {
  cd "$pkgname"

  # makepkg scrubs the environment. We must explicitly export GOROOT
  # so the gobee AST parser can find standard libraries like 'unsafe'.
  export GOROOT="$(go env GOROOT)"
  export GOPATH="${srcdir}/gopath"
  export PATH="${srcdir}/gopath/bin:$PATH"
  export CGO_ENABLED=0
  export GOPROXY=off
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  # Use the Makefile targets for the specific architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    make gecit-linux-amd64 VERSION="$pkgver" CLANG="clang -ffile-prefix-map=${srcdir}=."
  elif [[ "$CARCH" == "aarch64" ]]; then
    make gecit-linux-arm64 VERSION="$pkgver" CLANG="clang -ffile-prefix-map=${srcdir}=."
  fi
}

package() {
  cd "$pkgname"

  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "bin/gecit-linux-amd64" "$pkgdir/usr/bin/gecit"
  elif [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 "bin/gecit-linux-arm64" "$pkgdir/usr/bin/gecit"
  fi

  install -Dm644 "packaging/linux/gecit.service" "$pkgdir/usr/lib/systemd/system/gecit.service"
  if ! grep -q '^ExecStopPost=' "$pkgdir/usr/lib/systemd/system/gecit.service"; then
    sed -i '/^ExecStart=/a ExecStopPost=-/usr/bin/gecit cleanup' "$pkgdir/usr/lib/systemd/system/gecit.service"
  fi

  # Install the LICENSE file
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
