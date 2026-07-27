# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
pkgver=0.10.4
pkgrel=1
url='https://github.com/atar-axis/xpadneo'
arch=(any)
license=('GPL-2.0-only AND GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2858e466c5fde7e3d06d878dd7fb695751375e11a112bd3d389f9db5a82ef3ffcc1e3431b213f4807aeb8f05fd4280c7ca2a0a56305b0e984eb9b70df4843735')

package() {
  cd "xpadneo-${pkgver}"

  # Add modprobe and udev files
  make PREFIX="${pkgdir}" ETC_PREFIX='/usr/lib' \
    install

  # License applicability
  LICENSE_DIR="${pkgdir}/usr/share/licenses/${pkgname}"
  install -vD -t "${LICENSE_DIR}/" -m644 LICENSE.md LICENSES/*.txt

  # DKMS files
  TARGET_DIR="${pkgdir}/usr/src/hid-xpadneo-v${pkgver}"
  install -vD -t "${TARGET_DIR}" -m644 hid-xpadneo/{Makefile,dkms.conf}
  install -vD -t "${TARGET_DIR}" -m755 hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type f -not -name '.*' -exec install -vD -m644 {} -T "${TARGET_DIR}/{}" \;
}
