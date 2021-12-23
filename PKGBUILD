# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgbase=gtkhash
pkgname=(
  gtkhash
  gtkhash-caja 
  gtkhash-nautilus 
  gtkhash-nemo
  gtkhash-thunar
)
pkgver=1.4
pkgrel=4
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'dconf'
    'gtk3'
    'nettle'
)

makedepends=(
    'caja'
    'dconf'
    'gtk3'
    'intltool'
    'libnautilus-extension' 
    'librsvg'
    'nemo' 
    'nettle'
    'thunar'
    'xdg-utils'
)
source=("${url}/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4')

build() {
  cd gtkhash-$pkgver

  ./configure --prefix=/usr \ 
              --disable-schemas-compile \ 
              --enable-gtkhash \
              --enable-linux-crypto \ 
              --enable-nettle \
              --disable-blake2 \ 
              --with-gtk=3.0 \
              --enable-nemo \
              --enable-nautilus \ 
              --enable-thunar \
              --enable-caja \
  make
}

package_gtkhash() {
  make -C gtkhash-$pkgver DESTDIR="$pkgdir/" install
  # remove filemanager plugins
  rm -rf "$pkgdir"/usr/lib
}

package_gtkhash-caja() {
  pkgdesc+=' (Caja filemanager plugin)'
  depends=(
    'gtkhash'
    'caja'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},nautilus,nemo}
}

package_gtkhash-nautilus() {
  pkgdesc+=' (Nautilus filemanager plugin)'
  depends=(
    'gtkhash'
    'nautilus'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},caja,nemo}
}

package_gtkhash-nemo() {
  pkgdesc+=' (Nemo filemanager plugin)'
  depends=(
    'gtkhash'
    'nemo' 
  )

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},nautilus,caja}
}

package_gtkhash-thunar() {
  pkgdesc+=' (Thunar filemanager plugin)'
  depends=(
    'gtkhash'
    'thunar'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{nautilus,caja,nemo}
}
