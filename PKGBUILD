# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7kaa
pkgver=2.14.4
pkgrel=4
pkgdesc='Seven Kingdoms: Ancient Adversaries is a real-time strategy (RTS) computer game developed by Trevor Chan'
url='http://7kfans.com/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('openal' 'sdl_net' 'gcc-libs' '7kaa-music')
conflicts=('7kaa-data')
provides=('7kaa-data')
source=("http://downloads.sourceforge.net/project/skfans/7KAA%20${pkgver}/${pkgname}-source-${pkgver}.tar.bz2"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.ico"
	"http://downloads.sourceforge.net/project/skfans/Seven%20Kingdoms%20AA%20Data%20Files/$pkgname-data-2.13.tar.bz2")
md5sums=('777124571564bf46990ef2d2d96afbbb'
         '8d0634b0962ad621a7608378d7172e02'
         '3fd08eeb86036fa9b18b91a91c62cb99'
         '996b0cdc8e4448ee456603c6640bb19b'
	 'd7580a683fabcea98b5898dff252dcf2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  # install data files
  install -dm755 "${pkgdir}/opt/7kaa/"
  cd "${srcdir}/$pkgname-$pkgver/data/"
  #cp -r {encyc,encyc2,image,resource,scenari2,scenario,sound,sprite,tutorial} "${pkgdir}/opt/7kaa/"
  cp -r {image,resource,scenari2,scenario,sound,sprite,tutorial} "${pkgdir}/opt/7kaa/"
  
  # install encyc files from the data package
  cd "${srcdir}/7kaa/"
  cp -r {encyc,encyc2} "${pkgdir}/opt/7kaa/"

  # fix permissions
  cd "${pkgdir}/opt/7kaa/"
  find . -type d -exec chmod 755 {} \;

  # copy readme
  install -D -m644 "${srcdir}/$pkgname-$pkgver/README" "${pkgdir}/usr/share/doc/7kaa/README"

  # main file
  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/src/client/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  # bash script
  install -D -m755 "$srcdir/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # desktop entry
  install -D -m644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
}

# vim:set ts=2 sw=2 et:
