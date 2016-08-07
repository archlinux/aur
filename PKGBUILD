# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=joyce
pkgrel=1
pkgver=2.2.9
pkgdesc="Emulates the Amstrad PCW on Unix"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/Joyce/index.html"
license=('LGPL')
depends=('libpng'
         'libxml2'
         'sdl')
source=("http://www.seasip.info/Unix/Joyce/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "type_cast_fix.patch")
sha256sums=('99fd200052c9ec1445fc1f4802c6276e1adecb3d714f469c6403fe78bb931a40'
            'ac4f54be832ff4c3bf434f36c0b28298742b20e4b6051db0a66e57ba636c5a98'
            '8826963da9770c7fec014a477210febcc51cd7c72106b8a69bf45b59221fef0f')

build() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/type_cast_fix.patch"
  ./configure --prefix=/usr --enable-shared
  make -j $(cat /proc/cpuinfo | grep processor | wc -l)
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
