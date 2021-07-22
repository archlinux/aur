# Maintainer: Michał Kopeć <michal@nozomi.space>
# Contributor: Michał Kopeć <michal@nozomi.space>

_pkgname=xone
pkgname=xone-dkms
pkgver=0.1
pkgrel=2
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
arch=('x86_64')
url='https://github.com/medusalix/xone'
license=('GPL2')
depends=('dkms')
conflicts=('xone-dkms')
provides=('xone-dkms')
source=("git+https://github.com/medusalix/xone.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  echo "* Blacklisting xpad module..."
  install -D -m 644 modprobe.conf "${pkgdir}/etc/modprobe.d/xone-blacklist.conf"
}

