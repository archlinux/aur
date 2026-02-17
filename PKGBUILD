# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7kaa
pkgver=2.15.7
pkgrel=4
pkgdesc='Seven Kingdoms: Ancient Adversaries is a real-time strategy (RTS) computer game developed by Trevor Chan'
url='http://7kfans.com/'
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('openal' 'desktop-file-utils' 'enet' 'libgcc' 'libstdc++' 'sdl2')
optdepends=('7kaa-music: for ingame music')
conflicts=('7kaa-data')
provides=('7kaa-data')
source=(https://downloads.sourceforge.net/project/skfans/7KAA%20${pkgver}/${pkgname}-${pkgver}.tar.gz
        0001_fix-strictness.patch
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.ico")
b2sums=('d71594ed46086e2c5b2c38da7e5dd2ff9eb7c0b89abcd62c7dee295530ab6609923303d2b6df42b479b8628bd80b35c149ffd20f3000685ead25b6cd7a6304ce'
        'c706dcca2d55089767d54143dace52b95bb22d8da5648ca1d4ba145d0d54c0c6fe7c8057322a8ddf7517b06dd21c18020b4f854de9b768d24251e10616635a19'
        '207d4e5f6c41e0f8441009c0405fc1f4c2d2e6115ec8f002f77c38adb9e92b43a663beaf4bfbb2cd947a15c03c24c11b3a294a4b97db7ab55f1622a75d7123ac'
        'a36c65a74f057eae344f5b93614bc61dc90830902cf723b04e0765a6201a5d012b43a1be952e5d2c03dd01673f0f626c2494f0275a6246b4a1f1a7fb299ebdcf'
        '98bed86cc322ed4c58bb17b16872414de18d3f3f1d4bf995ddff86a5588b13f28779e9d95dd369f622fac4d762a2d28a6052d102686a35b3035df0e31f1c146f')


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}"/0001_fix-strictness.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  # Add a flag to avoid a desync between versions compiled by GCC14+ and those before
  CXXFLAGS+=" -fexcess-precision=fast"
  ./configure
  make
}

package() {
  # install data files
  install -dm755 "${pkgdir}/opt/7kaa/"
  cd "$pkgname-$pkgver/data/"
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
