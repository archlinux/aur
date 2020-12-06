# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=beaker
pkgver=1.0.0
pkgrel=1
pkgdesc='Experimental peer-to-peer web browser'
arch=(i686 x86_64)
url=https://beakerbrowser.com
license=(MIT)
depends=(alsa-lib atk at-spi2-atk cairo gcc-libs gdk-pixbuf2 glibc gtk3 libcups libsodium libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nodejs nspr nss pango python)
makedepends=(npm git python2)
source=(beaker-$pkgver.tar.gz::https://github.com/beakerbrowser/beaker/archive/$pkgver.tar.gz
        beaker.desktop)
sha512sums=('780504e1e03c2bbbda7d3da1653a2fc675295510aac664deca00f6ba391e5f709adeecb1f35535a9a1118abeb0b7a3944f1606c8264141519bf9c67e43c4aa5b'
            '24210bb1900112d4b4ff37ed7e57055516b4134d277730bf78e69e7c30c2f2655fb21f5266719a60b3edd2dfea7c8ec9e0d56d71f9a9daf1b674f9108831df08')

build() {
  cd beaker-$pkgver/scripts
  npm i
  npm run build
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
