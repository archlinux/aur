# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=3.0.0
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
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"coolercontrol-liqctld"
)
groups=(coolercontrol-bin)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
	"https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '0b24050c317984bc17abd4ff048959187d1a0de662f413d275a58f3ca76db6d6'
  '7fbdcba1f7aee7c28367aecf55043db9368a5181790df19fdc3c55c7ca7565c9'
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
