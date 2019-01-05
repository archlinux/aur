# Maintainer: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=endless-sky
pkgver=0.9.8
pkgrel=2
arch=('i686' 'x86_64')
url="http://endless-sky.github.io/"
depends=(openal libpng glew hicolor-icon-theme libjpeg-turbo sdl2 libmad)
makedepends=(scons)
optdepends=('endless-sky-high-dpi: high resolution graphics assets'
            'endless-sky-editor: map editor')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A space exploration and combat game similar to Escape Velocity"
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/endless-sky/archive/v${pkgver}.tar.gz")
sha512sums=('521026cb70372fd380b14a1a1d296f86015e5999dc233f4d9c05d958092e1f3982d2f12e913a435d5827fb45945bd4b60bbae293c2c90685024cdae96e352078')

build() {
  cd $pkgname-$pkgver
  scons
}


package() {
  cd $pkgname-$pkgver

  # Install executable
  install -Dm755 -t "${pkgdir}/usr/bin" endless-sky

  # resources
  ## They explicitly want this path. Although one could workaround with '-r' param
  install --directory "${pkgdir}/usr/share/games/${pkgname}"
  cp -rf data images sounds "${pkgdir}/usr/share/games/${pkgname}/"
  install -Dm644 credits.txt "${pkgdir}/usr/share/games/${pkgname}/credits.txt"
  install -Dm644 keys.txt "${pkgdir}/usr/share/games/${pkgname}/keys.txt"

  # .desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" endless-sky.desktop

  # icons
  for res in 16 22 24 32 48 256; do
    install -Dm644 \
      "${srcdir}/${pkgname}-${pkgver}/icons/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done

  # mac icon directory has additional icons [128+512px]
  for res in 128 512; do
    install -Dm644 \
      "${srcdir}/${pkgname}-${pkgver}/icons/endless-sky.iconset/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done

  # manpage
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" endless-sky.6

  # copyright
  install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
