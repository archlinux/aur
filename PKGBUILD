# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.22
pkgrel=2
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL3' 'custom:InnoCard')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.Linux.zip"
        "freedoko-install-directories.patch")
noextract=("FreeDoko_$pkgver.Linux.zip")
sha512sums=('c7e5a3d6b5589ea04634f1149c29375652fd83b0428f2898582fde222f65f9d5b1dd51e968ede48a5e6681a5f7ef95860b4fb8acf2f887a6fdbf9b2f4a432204'
            '61dd6111bc93cc960fae323bd5e02786373490d2da7417923533cf926006c9ceb6aaea939216583fa291403bdaa828f70372b5d45ef7bc06171a6091f9646d6c'
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

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 data/cardsets/InnoCard/*.{txt,pdf} \
    -t "$pkgdir"/usr/share/licenses/$pkgname/InnoCard
}
