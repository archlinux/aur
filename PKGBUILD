# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=beaker
pkgver=0.8.8
pkgrel=2
pkgdesc='Experimental peer-to-peer web browser'
arch=(i686 x86_64)
url=https://beakerbrowser.com
license=(MIT)
depends=(alsa-lib atk at-spi2-atk cairo gcc-libs gdk-pixbuf2 glibc gtk3 libcups libsodium libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nodejs nspr nss pango python)
makedepends=(npm git python2)
source=(beaker-$pkgver.tar.gz::https://github.com/beakerbrowser/beaker/archive/$pkgver.tar.gz
        beaker.desktop)
sha512sums=('6f18506344121eb83b15315aa28650732b90278e8bda1293a15117a198a79b2f3628b1e887cb3fa889a0ce1a2a123f605373047c4784adfe1d64c8696b45fbbe'
            '24210bb1900112d4b4ff37ed7e57055516b4134d277730bf78e69e7c30c2f2655fb21f5266719a60b3edd2dfea7c8ec9e0d56d71f9a9daf1b674f9108831df08')

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
