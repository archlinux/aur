# Maintainer: Vincenzo Fehring <vinfehring@gmail.com>
pkgname=linuxwave
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux facial recognition authentication system with PAM integration"
arch=('x86_64')
url=https://github.com/vinisadev/linux-wave
license=('MIT')
depends=()
makedeps=('go')
optdepends=(
  'opencv: Face detection support (future)'
  'tensorflow: Face recognition engine (future)'
  'bluez: Bluetooth proximity detection (future)'
  'gtk3: Enrollment GUI with GTK (future)'
  'qt5-base: Enrollement GUI with Qt (future)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinisadev/linux-wave/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Set Go build flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS-"${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build all binaries
  make build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  # Run tests
  go test ./cmd/... ./internal/... ./pkg/... -v || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binaries
    install -Dm755 bin/linuxwave-service "$pkgdir/usr/bin/linuxwave-service"
    install -Dm755 bin/linuxwave-pam "$pkgdir/usr/bin/linuxwave-pam"
    install -Dm755 bin/linuxwave-cli "$pkgdir/usr/bin/linuxwave-cli"
    install -Dm755 bin/linuxwave-enroll "$pkgdir/usr/bin/linuxwave-enroll"

    # Install systemd service files (when available)
    if [ -d systemd ] && [ -n "$(ls -A systemd/*.service 2>/dev/null)" ]; then
        install -Dm644 systemd/*.service -t "$pkgdir/usr/lib/systemd/system/"
    fi

    # Install configuration templates (when available)
    if [ -d config ] && [ -n "$(ls -A config/*.yaml 2>/dev/null)" ]; then
        install -Dm644 config/*.yaml -t "$pkgdir/etc/linuxwave/"
    fi

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license (update when license file is added)
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}