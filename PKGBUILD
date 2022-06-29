# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: collector1871
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=abe
pkgver=1.1
pkgrel=14
pkgdesc='Scrolling, platform-jumping, key-collecting, ancient pyramid exploring game'
arch=('i686' 'x86_64' 'aarch64')
url='https://sourceforge.net/projects/abe/'
license=('GPL')
depends=('sdl_mixer' 'sdl' 'glibc')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.patch
        ${pkgname}_sprintf.patch
        ${pkgname}.desktop)

sha256sums=('dfc4ea74c04c92175abc5c9d65cfa6aad218209854d87d87758878e303b677f7'
        'f20869295b84b2222650d50419389f490a5b0067157cc84cd0e1f4fae19e7d35'
        '5fb33034844e3ed9f150b2be5cbb48e26a9b7122a62ea6539113f2d1f159c325'
        'c02a097a427123e1b4047a5442492d87febace08a0264e535188de3ea62c68cf')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_sprintf.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/images
  cp -r images/ maps/ sounds/ "${pkgdir}"/usr/share/${pkgname}/
  cd "${pkgdir}"/usr/share/${pkgname}/images
  tar -xf "${srcdir}"/${pkgname}-${pkgver}/images/images.tar abe.bmp
  chown root:root abe.bmp
}

# vim:set ts=2 sw=2 et:
