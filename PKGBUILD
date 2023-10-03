# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7kaa
pkgver=2.15.6
pkgrel=1
pkgdesc='Seven Kingdoms: Ancient Adversaries is a real-time strategy (RTS) computer game developed by Trevor Chan'
url='http://7kfans.com/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('openal' 'desktop-file-utils' 'enet' 'gcc-libs' 'sdl2')
optdepends=('7kaa-music: for ingame music')
conflicts=('7kaa-data')
provides=('7kaa-data')
source=(https://downloads.sourceforge.net/project/skfans/7KAA%20${pkgver}/${pkgname}-${pkgver}.tar.gz
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.ico")
b2sums=('7ef2926df74f230208c438223d963362b96327c5a8dd002ec32a7af6c2c3ae910f8cbffd2f974b0a0b178b479bc798c8be9a70e99fda93797519f041c9e18aec'
        '207d4e5f6c41e0f8441009c0405fc1f4c2d2e6115ec8f002f77c38adb9e92b43a663beaf4bfbb2cd947a15c03c24c11b3a294a4b97db7ab55f1622a75d7123ac'
        'a36c65a74f057eae344f5b93614bc61dc90830902cf723b04e0765a6201a5d012b43a1be952e5d2c03dd01673f0f626c2494f0275a6246b4a1f1a7fb299ebdcf'
        '98bed86cc322ed4c58bb17b16872414de18d3f3f1d4bf995ddff86a5588b13f28779e9d95dd369f622fac4d762a2d28a6052d102686a35b3035df0e31f1c146f')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  # install data files
  install -dm755 "${pkgdir}/opt/7kaa/"
  cd "${srcdir}/$pkgname-$pkgver/data/"
  cp -r {ENCYC,ENCYC2,IMAGE,RESOURCE,SCENARI2,SCENARIO,SOUND,SPRITE,TUTORIAL} "${pkgdir}/opt/7kaa/"

  # fix permissions
  cd "${pkgdir}/opt/7kaa/"
  find . -type d -exec chmod 755 {} \;

  # copy readme
  install -D -m644 "${srcdir}/$pkgname-$pkgver/README" "${pkgdir}/usr/share/doc/7kaa/README"

  # main file
  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  # bash script
  install -D -m755 "$srcdir/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # desktop entry
  install -D -m644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
}

# vim:set ts=2 sw=2 et:
