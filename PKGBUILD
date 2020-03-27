# Maintainer: Trivernis <trivernis@gmail.com>

pkgname=yuna
pkgver=1.4.13
pkgrel=1
pkgdesc='Anime player integating AniList, Crunchyroll, and Hidive'
arch=(x86_64)
url=https://yuna.moe
license=(AGPL3)
depends=('gtk3' 'libxss' 'nss')

makedepends=('nodejs-lts-erbium' 'yarn' 'node-gyp' 'python2')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/BeeeQueue/yuna/archive/v$pkgver.tar.gz
        electron-builder.patch
        yuna.desktop)
sha512sums=('bc7c37c073ea1b030601dc01b80aacdbaea4f9fb91394f3bf5f4dc8b8547c84de37bbee8afcee02b62dd91d0067bc838f0ae0282e27c8cdea15089d145aaac22'
            '893065948029906084e5a7f94982a666fc553b294d2a423dc1642d6c67b1755e1f6ac0304adf726ff26c6b1ce74fbb8fc76a8bd129527abb3d7529ca59ebf643'
            '1853e9eac6b6a3b0734711d0803135902f118168603c795543de3296928293773d2be7a2aef05b045b737305d6cb50273e01843544de53d9caf06d0b4dc3e982')

prepare() {
  cd $pkgname-$pkgver

  # Tell Electron Builder to only target a directory build
  patch -Np0 < ../electron-builder.patch

  # Remove GIT_TAG const since this is an archive download
  # Remove Sentry source maps config since we don't have project info
  sed -r '6,10d;70,90d' -i vue.config.js
}

build() {
  cd $pkgname-$pkgver
  yarn
  yarn get-schema
  yarn build
}

package() {
  cd yuna-$pkgver

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a dist_electron/linux-unpacked "$pkgdir"/usr/lib/yuna
  ln -s /usr/lib/yuna/yuna "$pkgdir"/usr/bin

  install -Dm 644 ../yuna.desktop -t "$pkgdir"/usr/share/applications
  for i in 64 128 256 512; do
    install -Dm 644 public/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/yuna.png
  done
}
