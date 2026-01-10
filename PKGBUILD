# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold
pkgver=3.1.1
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
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/$pkgname-vendor.tar.gz"
)
sha256sums=(
  'eb3ae3d4ba8b260ba2650b8188ee7f525bd486901f8566c30517340ae462a9dc'
  '3d6d35e7833b839b9095ba70fdf5747b29999c48103fdb4095d17aabe917c3fa'
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
