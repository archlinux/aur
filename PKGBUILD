# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.10.3.1
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-2.0-only AND GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('af94c61ebc5b47030c31625ba8ea9896fc1f92ba275bcd1e0d2bcf432b7a91f6e21ce5b36d1983e2cc0cdcdb41ec040a706e2e7536b3e2139f096819d117e0e0')

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
