# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=1.9.5.3
pkgrel=10
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://sourceforge.net/projects/g15daemon/"
license=('GPL')
depends=('libg15render>=1.2')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        g15daemon.service
        ${pkgname}-${pkgver}-uinput.patch
        ${pkgname}-${pkgver}-config-write.patch
        ${pkgname}-${pkgver}-recv-oob-answer.patch)
sha512sums=('3dfeee7e9c0db1014f20e4c489cd4f277a880dc9928d4a2d8ef7a1ceaadfc491f0ffaac8d2a38f07f883f96862d7441500be2415b326f1495c94f86ff467ae4b'
            '45867c1737cbca98c8a069b30b383404c39438d70179fbd53a91f09921205c9739826ea7868388216219a6b24e4dee6814714a6d162c10dfb4a663a4efa8145d'
            'be9e8edf9c17c0dfe1d72ec011a4bce97972cb66f05b5fa1fe0839fefd194e1ace40429bd054e7e670064074c0b017b0c33237f7c6964de821bcd119cdd83b4b'
            '7d6250bc5e8e2c9a0a045ef15d4a0d747e21f7da3cc577cb4ffc8dd8d0baa47a9005276475524c2ca8cca6bb9155549dcb781780d8c76cdec2926923b4bb22d9'
            '1adb4486e4275b83bb06c6a912cc020cdc56c7c86822ad35ded823fe768d6bed3248081a62c071fd8268a86cb7240610732f9a87c7eb787ce9734c448eec583d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}-uinput.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}-config-write.patch"
  patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}-recv-oob-answer.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}/g15daemon.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
}
