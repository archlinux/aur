# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.8.2.r1.gd9966652c
_stablever=0.8.2
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (development version)"
arch=('x86_64')
url="http://free-doko.sourceforge.net/FreeDoko.html"
license=('GPL3' 'custom:InnoCard')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'texlive-langgerman' 'texlive-fontsrecommended' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "https://downloads.sourceforge.net/free-doko/FreeDoko_${_stablever}.Linux.zip"
        "freedoko-install-directories.patch")
noextract=("FreeDoko_${_stablever}.Linux.zip")
sha512sums=('SKIP'
            '1bb08ee7d8631b890fad2eeb0641c043582dc114cca10303d7af01c61e5db4cb336114683ae4e91f06c26c094eaac1da0f5717d1386e4a136c13455adf349b20'
            '602f53bfd4c4c49824400a36e4655dc6f6d5692b7277489f8e5f9f9d9d4d90eb086a4d142736e76edc2c8864430d8cbf5fa403bb25497b2c6a510a1979fe7650')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd FreeDoko
  patch -Np1 < ../freedoko-install-directories.patch

  # disable manual binary stripping
  sed -i '/$(MAKE) strip/d' src/Makefile

  # remove unneded InnoCard development files
  rm -r data/cardsets/InnoCard

  # extract InnoCard from binary release archive
  bsdtar -C data/cardsets --strip-components=2 \
    -xf ../FreeDoko_${_stablever}.Linux.zip FreeDoko_${_stablever}/cardsets/InnoCard
}

build() {
  cd FreeDoko
  make compile
  make documentation
}

package() {
  cd FreeDoko
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/share/freedoko/cardsets
  cp -r data/cardsets/InnoCard "$pkgdir"/usr/share/freedoko/cardsets

  install -Dm644 data/cardsets/InnoCard/*.{txt,pdf} \
    -t "$pkgdir"/usr/share/licenses/$pkgname/InnoCard
}
