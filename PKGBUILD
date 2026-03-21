# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=4.1.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices: daemon (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'libdrm'
	'gcc-libs'
	'glibc'
)
optdepends=(
	'nvidia-utils: NVIDIA GPU support'
	'liquidctl: liquidctl driver support'
	'lm_sensors: kernel hwmon driver support'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"coolercontrol-liqctld"
)
groups=(coolercontrol-bin)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  'd7bf359e6d1c76d0bbb126ad499b717d8a6b82aab8a97a04133de5ac9babd20e'
  '128ea179d9e1989b6c925fd2d1a2615b2a04536160fe8f58a86dcd0a093b0f71'
)

check() {
	chmod +x "./${_pkgname}_${pkgver}"
	"./${_pkgname}_${pkgver}" --version
}

package() {
	install -DTm755 "./${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

	cd "${srcdir}/${pkgname%d-bin}-$pkgver"

	# systemd service file
	install -Dm644 "packaging/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
