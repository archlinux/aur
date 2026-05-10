# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold
pkgver=4.3.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices. This package contains the CoolerControl service daemon."
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'libdrm'
	'gcc-libs'
	'glibc'
)
makedepends=(
	'rust'
	'cargo'
	'protobuf'
)
optdepends=(
	'nvidia-utils: NVIDIA GPU support'
	'liquidctl: liquidctl driver support'
	'lm_sensors: kernel hwmon driver support'
)
provides=(
	"$pkgname"
)
conflicts=(
	"$pkgname"
	"coolercontrol-liqctld"
)
# lto is handled by cargo and can conflict with makepkg settings
options=(
	!lto
)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/$pkgname-vendor-$pkgver.tar.gz"
)
sha256sums=(
  '024281e0d02dee913f83f5bca23b5fad15fd8a2943895e7a3ea7ac29d63275d5'
  'd4c601a9e6612ab95e87db1131cbf2ef5cdf67c72ef889e88d083f69c2cd8426'
)

build() {
	# cd "${srcdir}/${pkgname%d}-$pkgver/coolercontrol-ui"
	# npm ci
	# npm run build
	# cp -r dist/* "${srcdir}/${pkgname%d}-$pkgver/$pkgname/resources/app/"
	cd "${srcdir}/${pkgname%d}-$pkgver/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked
}

check() {
	cd "${srcdir}/${pkgname%d}-$pkgver/$pkgname/target/release"
	./coolercontrold --version
}

package() {
	cd "${srcdir}/${pkgname%d}-$pkgver/$pkgname"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

	cd "${srcdir}/${pkgname%d}-$pkgver"
	# systemd service files
	install -Dm644 "packaging/systemd/${pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
