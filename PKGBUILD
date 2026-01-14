# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="asus-5606-fan-state"
pkgname="${_pkgname}-git"
pkgver=r38.7801ae9
pkgrel=1
pkgdesc="Script to set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
makedepends=('cargo' 'git' 'pkg-config')
optdepends=('dbus: sending dbus signal')
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_pkgname}" || exit
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	if pkg-config --exists dbus-1 2>/dev/null; then
		cargo build --frozen --release --all-features
	else
		cargo build --frozen --release --no-default-features
	fi
}

package() {
    install -Dm755 "$srcdir/$_pkgname"/target/release/fan_state "$pkgdir/usr/bin/fan_state"
    install -Dm644 "$srcdir/$_pkgname"/asus-fan-permissions.service "$pkgdir/usr/lib/systemd/system/asus-fan-permissions.service"
    install -Dm644 "$srcdir/$_pkgname"/README.md "$pkgdir/usr/share/doc/fan_state"
}
