# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.26
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/FreeDoko.html"
license=('GPL3' 'custom:InnoCard')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.Linux.zip"
        "freedoko-install-directories.patch")
noextract=("FreeDoko_$pkgver.Linux.zip")
sha512sums=('ca4c219e2885cc4cfce64bebce012cc7d5d6a5fdb40975fb5fd7309378ca6911a594c1ec83afd8c9e51e47990a83ca725b4e40b38f3a8659d0f99d40a613d6ea'
            '19b106cbcf1d73cd036209ac11a397e5a8a41021f98d65f1d3eee5a44b1ce414291412d881fafb97fbd8067f3586645074bd68f7904217a18c0fbdcb4ef6d428'
            '602f53bfd4c4c49824400a36e4655dc6f6d5692b7277489f8e5f9f9d9d4d90eb086a4d142736e76edc2c8864430d8cbf5fa403bb25497b2c6a510a1979fe7650')

prepare() {
  cd FreeDoko_$pkgver
  patch -Np1 < ../freedoko-install-directories.patch

  # disable manual binary stripping
  sed -i '/$(MAKE) strip/d' src/Makefile

  # extract InnoCard from binary release archive
  bsdtar -C data/cardsets --strip-components=2 \
    -xf ../FreeDoko_$pkgver.Linux.zip FreeDoko_$pkgver/cardsets/InnoCard
}

build() {
  cd FreeDoko_$pkgver
  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/share/freedoko/cardsets
  cp -r data/cardsets/InnoCard "$pkgdir"/usr/share/freedoko/cardsets

  install -Dm644 data/cardsets/InnoCard/*.{txt,pdf} \
    -t "$pkgdir"/usr/share/licenses/$pkgname/InnoCard
}
