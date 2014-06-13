# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgbase=gtkhash-git
pkgname=(gtkhash-git gtkhash-nemo-git gtkhash-nautilus-git gtkhash-thunar-git)
pkgver=0.7.0.r4.ga01ad64
pkgrel=1
pkgdesc='A GTK+ utility for computing message digests or checksums (development version).'
arch=('i686' 'x86_64')
url='http://gtkhash.sourceforge.net/'
license=('GPL')
makedepends=('intltool' 'git' 'nemo' 'libnautilus-extension' 'thunar') # ← remove FMs here!
depends=('dconf' 'nettle' 'gtk3')
conflicts=('gtkhash')
provides=('gtkhash')
source=(gtkhash::"git+https://github.com/tristanheaven/gtkhash.git"
        "gtkhash.desktop")
sha256sums=('SKIP'
            'f0312086093f0dd5ce0cfd6c9312abd42b57401960c39c19377372c154a32388')

pkgver() {
  cd gtkhash

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd gtkhash

  ./autogen.sh
  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle --with-gtk=3.0 \
              --enable-nemo --enable-nautilus --enable-thunar # ← remove FMs here!
  make
}

package_gtkhash-git() {
  install=gtkhash.install

  make -C gtkhash DESTDIR="$pkgdir/" install
  # install desktop entry
  install -Dm644 gtkhash.desktop "$pkgdir"/usr/share/applications/gtkhash.desktop
  # remove filemanager plugins
  rm -rf "$pkgdir"/usr/lib
}

package_gtkhash-nemo-git() {
  pkgdesc+=' - Nemo filemanager plugin'
  depends=('gtkhash-git' 'nemo')

  make -C gtkhash/src/nemo DESTDIR="$pkgdir/" install
}

package_gtkhash-nautilus-git() {
  pkgdesc+=' - Nautilus filemanager plugin'
  depends=('gtkhash-git' 'nautilus')

  make -C gtkhash/src/nautilus DESTDIR="$pkgdir/" install
}

package_gtkhash-thunar-git() {
  pkgdesc+=' - Thunar filemanager plugin'
  depends=('gtkhash-git' 'thunar')

  make -C gtkhash/src/thunar DESTDIR="$pkgdir/" install
}
