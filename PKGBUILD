# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="asus-5606-fan-state"
pkgname="${_pkgname}"
pkgver=1.0.0
pkgrel=3
pkgdesc="Set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
makedepends=('cargo' 'pkg-config')
optdepends=('dbus: sending dbus signal')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('5f30d58e94fd77600d35e5f1aa4ab6b9e2817a713f7d9c70bf185049e0d122d1')
install="${_pkgname}.install"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	if pkg-config --exists dbus-1 2>/dev/null; then
		cargo build --frozen --release --all-features
	else
        echo "dbus-1 not found, building without dbus support"
		cargo build --frozen --release --no-default-features
	fi
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver"/target/release/fan_state "$pkgdir/usr/bin/fan_state"
    install -Dm644 "$srcdir/$_pkgname-$pkgver"/asus-fan-permissions.service "$pkgdir/usr/lib/systemd/system/asus-fan-permissions.service"
    install -Dm644 "$srcdir/$_pkgname-$pkgver"/README.md "$pkgdir/usr/share/doc/fan_state"
}
