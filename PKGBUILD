# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgbase=gtkhash
pkgname=(gtkhash gtkhash-nemo gtkhash-nautilus gtkhash-thunar gtkhash-caja)
pkgver=1.0
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')
makedepends=('intltool' 'librsvg' 'nemo' 'libnautilus-extension' 'thunar' 'caja-gtk3') # ← remove FMs here!
depends=('dconf' 'nettle' 'gtk3')
source=("http://downloads.sourceforge.net/gtkhash/gtkhash-$pkgver.tar.xz")
sha256sums=('ae1faac88a745953bba583c91173d08f8aab8153c30418b10ed43496ea561e45')

build() {
  cd gtkhash-$pkgver

  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle --with-gtk=3.0 \
              --enable-nemo --enable-nautilus --enable-thunar --enable-caja # ← remove FMs here!
  make
}

package_gtkhash() {
  make -C gtkhash-$pkgver DESTDIR="$pkgdir/" install

  # remove filemanager plugins
  rm -rf "$pkgdir"/usr/lib
}

package_gtkhash-nemo() {
  pkgdesc+=' (Nemo filemanager plugin)'
  depends=('gtkhash' 'nemo')

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-2,nautilus,caja}
}

package_gtkhash-nautilus() {
  pkgdesc+=' (Nautilus filemanager plugin)'
  depends=('gtkhash' 'nautilus')

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-2,caja,nemo}
}

package_gtkhash-thunar() {
  pkgdesc+=' (Thunar filemanager plugin)'
  depends=('gtkhash' 'thunar')

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{nautilus,caja,nemo}
}

package_gtkhash-caja() {
  pkgdesc+=' (Caja filemanager plugin)'
  depends=('gtkhash' 'caja-gtk3')

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-2,nautilus,nemo}
}
