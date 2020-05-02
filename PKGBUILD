# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>

pkgname=endless-sky
pkgver=0.9.12
pkgrel=1
arch=('i686' 'x86_64')
url="http://endless-sky.github.io/"
depends=(openal libpng glew hicolor-icon-theme libjpeg-turbo sdl2 libmad)
makedepends=(scons)
optdepends=('endless-sky-high-dpi: high resolution graphics assets'
            'endless-sky-editor: map editor')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A space exploration and combat game similar to Escape Velocity"
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/endless-sky/archive/v${pkgver}.tar.gz")
sha512sums=('694d3c6f50f80e8b4ff79580fa9510fde26a846dd227736af96a3eda7810d68b2ae051a72c0e02fe88eae9d839e48933614aa172a9bed6653e03ad30feaddc05')

build() {
  cd $pkgname-$pkgver
  # remove -jnproc for reproducible builds
  scons -j "$(nproc)"
}


package() {
  cd $pkgname-$pkgver

  # Install executable
  install -Dm755 -t "${pkgdir}/usr/bin" endless-sky

  # resources
  install -Dm644 credits.txt "${pkgdir}/usr/share/games/${pkgname}/credits.txt"
  install -Dm644 keys.txt "${pkgdir}/usr/share/games/${pkgname}/keys.txt"
  cp -rf data images sounds "${pkgdir}/usr/share/games/${pkgname}/"

  # .desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" endless-sky.desktop

  # icons
  for res in 16 22 24 32 48 128 256 512; do
    install -Dm644 \
      "${srcdir}/${pkgname}-${pkgver}/icons/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done

  # manpage
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" endless-sky.6

  # copyright
  install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
