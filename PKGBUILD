# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=4.3.0
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
  '6e66b6198048ea4af7546a0690e8bbe677742487f65ae2969b72732539232830'
  '024281e0d02dee913f83f5bca23b5fad15fd8a2943895e7a3ea7ac29d63275d5'
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
