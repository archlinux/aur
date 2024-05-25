# dlundqvist package maintainer: Fazzi <faaris.ansari@proton.me>
# Maintainer: Michał Kopeć <michal@nozomi.space>
# Contributor: Michał Kopeć <michal@nozomi.space>

_pkgname=xone
pkgname=xone-dlundqvist-dkms-git
pkgver=0.3.r84.gc7b24b7
pkgrel=1
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers - dlundqvist fork'
arch=('x86_64')
url='https://github.com/dlundqvist/xone'
license=('GPL2')
depends=('dkms'
		 'xone-dongle-firmware')
makedepends=('git')
conflicts=('xone-dkms'
		   'xow')
provides=('xone-dkms')
source=("git+https://github.com/dlundqvist/xone.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  echo "* Blacklisting xpad module..."
  install -D -m 644 install/modprobe.conf "${pkgdir}/etc/modprobe.d/xone-blacklist.conf"
}

