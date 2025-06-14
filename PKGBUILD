# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.10.0
_commit=a16acb03e7be191d47ebfbc8ca1d5223422dac3e
pkgrel=0.1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        '0001-drop-etc-files.patch')
b2sums=('0e2b1ebd17c63b5592ed40f32b2b48fed15d71214e799bc1495308f6e21ad7f6f64ea6e3eab77e7e2883e0dc2f1eea9fa532f3ebe300e999e50d328df70995ed'
        'fd04ac0f92d1ae0568462636390aadd6c4ad54dee01ea81d89e63ab486bb91ce56d7e90ca19952c037f27d9ef01ebd04f02db373096792134518879633014224')

prepare() {
  cd "xpadneo-${_commit}"

  # Upstream uses dkms.post_install to create modprobe and udev files in
  # /etc. In Arch, it makes more sense to create these files in /usr/lib
  # and let pacman take care of them. Won't be needed on v0.10+
  patch -Np1 -i "${srcdir}/0001-drop-etc-files.patch"
}

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
