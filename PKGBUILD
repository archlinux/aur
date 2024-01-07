# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-skindesigner'
pkgver=1.2.22
pkgrel=2
_vdrapi=2.6.5
pkgdesc="Highly customizable native true color skin for the Video Disc Recorder"
url="https://gitlab.com/kamel5/skindesigner"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('git' 'librsvg' 'ttf-opensans' 'unzip' "vdr-api=${_vdrapi}" 'wget')
optdepends=('vdr-scraper2vdr: To display scraped images in various EPG views (requires epgd)'
            'vdr-tvscraper: To display scraped images in various EPG views')
conflicts=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
replaces=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/kamel5/skindesigner/-/archive/$pkgver/skindesigner-$pkgver.tar.bz2"
        "$pkgname-libxml2_12.patch::https://gitlab.com/kamel5/skindesigner/-/commit/71b3e514c6c7f8eb76751ce04f1e3dd8f3037b25.patch"
        '99-skindesigner.conf'
        "50-$_plugname.conf")
install="$pkgname.install"
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('b37d2c5b9b9aa4bc3e12ce6cfe653bf6b218f1a44f948126849b12aa622d0ccf'
            'c9a7d1e65fc558fda9d8107fafebcb06ec6bc18566f5ddc867d26c1a88cb7c7f'
            '25c1359cb6c61c3e7ebd6738fce6c21fa21f62ea4f274a522c30015210c3f4e5'
            'dcd2381d49d79bbfbf9cd2a7bdd5ec24c1fc2c00b4e8e58b68c9afc874f6650e')

prepare() {
  cd "${srcdir}/$_plugname-$pkgver"
#  sed -i 's/libskindesigner/..\/libskindesigner/' extensions/pluginmanager.h
  patch -p1 -i "$srcdir/$pkgname-libxml2_12.patch"
}

build() {
  cd "${srcdir}/$_plugname-$pkgver"
#  export DEFINES="-D__STL_CONFIG_H"
  make
}

package() {
  cd "${srcdir}/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install

  mkdir -p "$pkgdir/var/lib/vdr/plugins/skindesigner/"
  ln -s /usr/share/vdr/plugins/skindesigner/dtd "$pkgdir/var/lib/vdr/plugins/skindesigner/dtd"

  install -Dm644 "$srcdir/99-skindesigner.conf" "$pkgdir/etc/fonts/conf.avail/99-skindesigner.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  cd "$pkgdir/usr/lib/vdr/plugins/skindesigner/scripts"
  mv temperatures.default temperatures
  rm README temperatures.*

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
