# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=beaker-git
pkgver=0.8.10
pkgrel=1
pkgdesc='Experimental peer-to-peer web browser (git)'
arch=(i686 x86_64)
url=https://beakerbrowser.com
license=(MIT)
depends=(alsa-lib atk at-spi2-atk at-spi2-core cairo dbus desktop-file-utils gcc-libs gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libcups libsodium libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nodejs nspr nss pango python)
makedepends=(git npm python2)
provides=(beaker)
conflicts=(beaker beaker-browser-bin)
source=(git+https://github.com/beakerbrowser/beaker
        beaker.desktop)
sha512sums=('SKIP'
            '24210bb1900112d4b4ff37ed7e57055516b4134d277730bf78e69e7c30c2f2655fb21f5266719a60b3edd2dfea7c8ec9e0d56d71f9a9daf1b674f9108831df08')

pkgver() {
  cd beaker
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd beaker
  npm i
  npm run build
  npm run rebuild
  npx electron-builder --dir
}

package() {
  install -Dm 644 beaker.desktop -t "$pkgdir"/usr/share/applications

  cd beaker

  mkdir "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/beaker
  ln -s /usr/lib/beaker/beaker-browser "$pkgdir"/usr/bin/beaker

  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/beaker.png
  done

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/beaker
}
