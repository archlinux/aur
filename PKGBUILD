# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=5.0.0
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
  'c854342cedf1e484ad68e59a235006f7dc570a2c79a2741c4b7cd3b0fee1ae8e'
  'ebdc2e5aa4d4e380d71d10c3e3d22de3f93f3b49ef78255f3183a1d734801ffe'
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
