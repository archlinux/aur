# Maintainer: Michał Kopeć <michal@nozomi.space>
# Contributor: Michał Kopeć <michal@nozomi.space>

_pkgname=xone
pkgname=xone-dkms
pkgver=0.2
pkgrel=1
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
arch=('x86_64')
url='https://github.com/medusalix/xone'
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('xone-dkms')
provides=('xone-dkms')
source=("git+https://github.com/medusalix/xone.git#tag=v${pkgver}"
		"http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab")
sha256sums=('SKIP'
		    '65736a84ff4036645b8f8ec602bed91ab6353019c9cb3233decab9feec0f6f04')

package() {
  cd "${srcdir}/${_pkgname}"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  echo "* Blacklisting xpad module..."
  install -D -m 644 install/modprobe.conf "${pkgdir}/usr/lib/modprobe.d/xone-blacklist.conf"

  echo "* Extracting dongle firmware..."
  echo "* The firmware for the wireless dongle is subject to Microsoft's Terms of Use:"
  echo "* https://www.microsoft.com/en-us/legal/terms-of-use"
  install -D -m 644 "${srcdir}/FW_ACC_00U.bin" "${pkgdir}/usr/lib/firmware/xow_dongle.bin"
}

