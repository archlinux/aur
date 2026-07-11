# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.10.4
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-2.0-only AND GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2858e466c5fde7e3d06d878dd7fb695751375e11a112bd3d389f9db5a82ef3ffcc1e3431b213f4807aeb8f05fd4280c7ca2a0a56305b0e984eb9b70df4843735')

package() {
  cd "${srcdir}/xpadneo-${pkgver}"

  # Add modprobe and udev files
  make VERSION="v${pkgver}" PREFIX="${pkgdir}" ETC_PREFIX=/usr/lib \
    install

  # License applicability
  LICENSE_DIR="${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 -t "${LICENSE_DIR}" LICENSE.md LICENSES/*.txt

  # DKMS files
  TARGET_DIR="${pkgdir}/usr/src/hid-xpadneo-v${pkgver}"
  install -Dm0644 -t "${TARGET_DIR}" hid-xpadneo/{Makefile,dkms.conf}
  install -Dm0755 -t "${TARGET_DIR}" hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type d -exec install -d "${TARGET_DIR}/{}" \;
  find src/ -type f -not -name '.*' -exec install -T -m0644 '{}' "${TARGET_DIR}/{}" \;
}
