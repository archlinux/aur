# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgbase=gtkhash
pkgname=(gtkhash gtkhash-nemo gtkhash-nautilus gtkhash-thunar)
pkgver=0.7.0
pkgrel=3
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')
makedepends=('intltool' 'nemo' 'libnautilus-extension' 'thunar') # ← remove FMs here!
depends=('dconf' 'nettle' 'gtk3')
source=("http://downloads.sourceforge.net/gtkhash/gtkhash-$pkgver.tar.xz"
        "gtkhash.desktop")
sha256sums=('161d4f27f2d412c8cb3f566ca3aa8144942bbf836c18bcb1e5f79451e6f5dfdd'
            'f0312086093f0dd5ce0cfd6c9312abd42b57401960c39c19377372c154a32388')

build() {
  cd gtkhash-$pkgver

  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle --with-gtk=3.0 \
              --enable-nemo --enable-nautilus --enable-thunar # ← remove FMs here!
  make
}

package_gtkhash() {
  install=gtkhash.install

  make -C gtkhash-$pkgver DESTDIR="$pkgdir/" install
  # install desktop entry
  install -Dm644 gtkhash.desktop "$pkgdir"/usr/share/applications/gtkhash.desktop
  # remove filemanager plugins
  rm -rf "$pkgdir"/usr/lib
}

package_gtkhash-nemo() {
  pkgdesc+=' (Nemo filemanager plugin)'
  depends=('gtkhash' 'nemo')

  make -C gtkhash-$pkgver/src/nemo DESTDIR="$pkgdir/" install
}

package_gtkhash-nautilus() {
  pkgdesc+=' (Nautilus filemanager plugin)'
  depends=('gtkhash' 'nautilus')

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
}

package_gtkhash-thunar() {
  pkgdesc+=' (Thunar filemanager plugin)'
  depends=('gtkhash' 'thunar')

  make -C gtkhash-$pkgver/src/thunar DESTDIR="$pkgdir/" install
}
