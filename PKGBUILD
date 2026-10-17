# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=5.1.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices: daemon (official, binary release)"
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
  'e292ed8d55dfa8b014165ec233200660917d8ab8dcf090877e37222122bb2077'
  '739e0be15de99830515d973bf3fdfc7f339f694cf1cc934540336d3883373b65'
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
