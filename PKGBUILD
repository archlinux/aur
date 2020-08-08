# Maintainer: Trivernis <trivernis@protonmail.com>
# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=yuna
pkgver=1.4.18
pkgrel=2
pkgdesc='Anime player & list manager integrating AniList, Simkl, Crunchyroll, and Hidive'
arch=(x86_64)
url=https://yuna.moe
license=(AGPL3)
depends=('gtk3' 'libxss' 'nss')
makedepends=('nodejs-lts-erbium' 'yarn' 'node-gyp' 'python2')
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/BeeeQueue/yuna/archive/v$pkgver.tar.gz
        electron-builder.patch
        yuna.desktop)
sha512sums=('689a042c7fec1cc858b650e63805b89190617e0126f316e78b97366ffacc7dfe42ae5456b14af012e7d1f3336e8e5bd17008cf4bf8e7e7fc07f1237ba8f309a0'
            '893065948029906084e5a7f94982a666fc553b294d2a423dc1642d6c67b1755e1f6ac0304adf726ff26c6b1ce74fbb8fc76a8bd129527abb3d7529ca59ebf643'
            'c6979b40c36a5a2763f1b56256a15e550a776ab75d99e64fb7772d91497ade0fed575b137fcfb8bc58c9729ad6460c9c012f7ebd57d342a2de4ba11886732277')

prepare() {
  cd $pkgname-$pkgver

  # Tell Electron Builder to only target a directory build
  patch -Np0 < ../electron-builder.patch

  # Remove GIT_TAG const since this is an archive download
  # Remove Sentry source maps config since we don't have project info
  sed -r '6,13d;71,91d' -i vue.config.js
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
