# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>

pkgname=endless-sky
pkgver=0.9.12
pkgrel=3
arch=('i686' 'x86_64')
url="https://endless-sky.github.io/"
depends=(openal libpng glew hicolor-icon-theme libjpeg-turbo sdl2 libmad)
makedepends=(scons)
optdepends=('endless-sky-high-dpi: high resolution graphics assets'
            'endless-sky-editor: map editor')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A sandbox-style space exploration and combat game"
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/endless-sky/archive/v${pkgver}.tar.gz"
        "0001-fix-Add-missing-string-include.patch")
sha512sums=('694d3c6f50f80e8b4ff79580fa9510fde26a846dd227736af96a3eda7810d68b2ae051a72c0e02fe88eae9d839e48933614aa172a9bed6653e03ad30feaddc05'
            '8fb0d5b63ef2034de30fd91b25da5ac63e908db4160b79c6ee5c2384b89b2ffb052779c02227590218a014e5da62d749b4372d26d75919848c499d8ed358dc2c')

# remove this in the next version, as the patch is backported from upstream
prepare() {
  cd "$pkgname-$pkgver"
  patch -sp1 < "$srcdir/0001-fix-Add-missing-string-include.patch"
}

build() {
  cd "$pkgname-$pkgver"
  scons -j "$(nproc)"
}


package() {
  cd "$pkgname-$pkgver"

  # binary
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
      "icons/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done

  # manpage
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" endless-sky.6

  # copyright
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" copyright
}

# vim:set ts=2 sw=2 et:
