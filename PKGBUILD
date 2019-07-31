# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=beaker
pkgver=0.8.8
pkgrel=1
pkgdesc='Experimental peer-to-peer web browser'
arch=(i686 x86_64)
url=https://beakerbrowser.com
license=(MIT)
depends=(alsa-lib atk at-spi2-atk cairo gcc-libs gdk-pixbuf2 glibc gtk3 libcups libsodium libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nodejs nspr nss pango python)
makedepends=(npm git python2)
source=(beaker-$pkgver.tar.gz::https://github.com/beakerbrowser/beaker/archive/$pkgver.tar.gz
        beaker.desktop)
sha512sums=('6f18506344121eb83b15315aa28650732b90278e8bda1293a15117a198a79b2f3628b1e887cb3fa889a0ce1a2a123f605373047c4784adfe1d64c8696b45fbbe'
            '4b61e8a4830fdac99afe2a04885fdd7c64415e32bf0bcb990ad81a7928ff7185a09ef43e827a159410302a2aa536b96a90de9fe29236341882bd464492214cca')

build() {
  cd beaker-$pkgver
  npm i
  npm run rebuild
  npx electron-builder --dir
}

package() {
  install -Dm 644 beaker.desktop -t "$pkgdir"/usr/share/applications

  cd beaker-$pkgver

  mkdir "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/beaker
  ln -s /usr/lib/beaker/beaker-browser "$pkgdir"/usr/bin/beaker

  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/beaker.png
  done

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/beaker
}
