# Maintainer: Pierce Thompson <pierce at insprill dot net>
# Contributor: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-git
pkgver=3.1.1.r217.g221dfd7
pkgrel=2
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
	"${pkgname%-git}"
)
conflicts=(
	"${pkgname%-git}"
	"coolercontrol-liqctld"
)
# lto is handled by cargo and can conflict with makepkg settings
options=(
	!lto
)
source=(
	"git+https://gitlab.com/coolercontrol/coolercontrol.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "${pkgname%d-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%d-git}"
	make build-daemon
}

check() {
	cd "${srcdir}/${pkgname%d-git}/${pkgname%-git}/target/release"
	./coolercontrold --version
}

package() {
	cd "${srcdir}/${pkgname%d-git}/${pkgname%-git}"
	install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"

	cd "${srcdir}/${pkgname%d-git}"
	# systemd service files
	install -Dm644 "packaging/systemd/${pkgname%-git}.service" -t "$pkgdir/usr/lib/systemd/system/"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
