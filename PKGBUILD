# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.10.0
_commit=fc1b13afc8dbaf85fc8ea8dadac460cee1ebda06
pkgrel=0.2
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('21b9e043ef727a8a52999d40a4ded213dd692717aadb8da0bebbc6893b10ffa005ae277cee6e9337e915ae0fa0510e086372a5b41829dd23cde7fb4ad02cde62')

package() {
  cd "xpadneo-${_commit}"

  # Add modprobe and udev files
  make VERSION="v${pkgver}" PREFIX="${pkgdir}" ETC_PREFIX=/usr/lib \
    install

  # DKMS files
  TARGET_DIR="${pkgdir}/usr/src/hid-xpadneo-v${pkgver}"
  install -Dm0644 -t "${TARGET_DIR}" hid-xpadneo/{Makefile,dkms.conf}
  install -Dm0755 -t "${TARGET_DIR}" hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type d -exec install -d "${TARGET_DIR}/{}" \;
  find src/ -type f -not -name '.*' -exec install -T -m0644 '{}' "${TARGET_DIR}/{}" \;
}
