# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.9.8
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        '0001-drop-etc-files.patch')
b2sums=('1cddb91cdd4b055fda5c09112af5441da621c07b14f61a0094cbfffa9a7b746491bff6ea0858a28b1e91a204af2822d005a28ed3b1354b6a367a3eee0fc7250c'
        'fd04ac0f92d1ae0568462636390aadd6c4ad54dee01ea81d89e63ab486bb91ce56d7e90ca19952c037f27d9ef01ebd04f02db373096792134518879633014224')

prepare() {
  cd "xpadneo-${pkgver}"

  # Upstream uses dkms.post_install to create modprobe and udev files in
  # /etc. In Arch, it makes more sense to create these files in /usr/lib
  # and let pacman take care of them. Won't be needed on v0.10+
  patch -Np1 -i "${srcdir}/0001-drop-etc-files.patch"

  # Set the current version in DKMS config file.
  sed "s/@DO_NOT_CHANGE@/v${pkgver}/" hid-xpadneo/dkms.conf.in > hid-xpadneo/dkms.conf
}

package() {
  cd "xpadneo-${pkgver}"

  # Runtime requirements
  install -Dm0644 -t "${pkgdir}/usr/lib/modprobe.d" hid-xpadneo/etc-modprobe.d/*
  install -Dm0644 -t "${pkgdir}/usr/lib/udev/rules.d" hid-xpadneo/etc-udev-rules.d/*

  # DKMS files
  TARGET_DIR="${pkgdir}/usr/src/hid-xpadneo-v${pkgver}"
  install -Dm0644 -t "${TARGET_DIR}" hid-xpadneo/{Makefile,dkms.conf}
  install -Dm0755 -t "${TARGET_DIR}" hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type d -exec install -d "${TARGET_DIR}/{}" \;
  find src/ -type f -not -name '.*' -exec install -T -m0644 '{}' "${TARGET_DIR}/{}" \;
}
