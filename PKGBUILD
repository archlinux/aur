# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mldonkey
_pkgver=3.1.7-2
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc='A multi-network P2P client'
arch=(x86_64)
url='http://mldonkey.sourceforge.net/'
license=(GPL2)
depends=(file gd hicolor-icon-theme miniupnpc libnatpmp libminiupnpc.so)
makedepends=(gtk2 librsvg ocaml-num camlp4 lablgtk2)
optdepends=('librsvg: GUI support'
            'gtk2: GUI support')
backup=(etc/conf.d/mldonkey)
source=("https://github.com/ygrek/mldonkey/releases/download/release-${pkgver//./-}/mldonkey-${_pkgver}.tar.bz2"
        "https://raw.githubusercontent.com/gentoo/gentoo/master/net-p2p/mldonkey/files/cpp17-byte-namespace.patch"
        "https://github.com/ygrek/mldonkey/commit/a153f0f7a4826d86d51d4bacedc0330b70fcbc34.patch"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/mldonkey-fix-build.patch"
        mldonkey.conf
        mldonkey.service
        mldonkey.tmpfiles
        mldonkey.sysusers)
sha256sums=('b926e7aa3de4b4525af73c88f1724d576b4add56ef070f025941dd51cb24a794'
            'eef21187cecc6f1052ff6e0d988093a6fed8b4745ecb257b9e127c23c60cb27d'
            '9c8f54159e2bf5e390f574a015a79b88a87a2117f5bb732741296948a2fb0b8b'
            '333c3b0ad43b6d6f1786cdd780d4b66fadc638d192875df4422724176201ffdf'
            'f1d9401cefd591662d49011c53fdb2788755a6f745a963e46d8037b990edeb6a'
            '778cebe8edcffd63db3594054c2daa62ce571644a96ad235b8c95470b55c0415'
            '9c78fbfbba4f8286e2c2299e4da6f76d0f34f33fde26964922707c34fb75157b'
            '24d7ef8f6af93a8d87a82842b0ed796e35ce2f88d81734d9275eede8f4e10fba')

# {,.asc}
# FAILED (the public key A34C49DD3DB8B78DFAEBE0FA6346B945708D5A0C is not trusted)

prepare() {
  cd "mldonkey-${_pkgver}"
  patch -Np1 -i ../cpp17-byte-namespace.patch
  patch -Np1 -i ../a153f0f7a4826d86d51d4bacedc0330b70fcbc34.patch
  patch -Np1 -i ../mldonkey-fix-build.patch
}

build() {
  cd "mldonkey-${_pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-gui=newgui2 \
    --enable-upnp-natpmp \
    --enable-batch

  make depend
  make
  make utils
}

package() {
  cd "mldonkey-${_pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 packages/rpm/mldonkey-icon-16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/mldonkey.png
  install -Dm644 distrib/mldonkey.desktop "$pkgdir"/usr/share/applications/mldonkey.desktop

  install -Dm644 "$srcdir"/mldonkey.conf "$pkgdir"/etc/conf.d/mldonkey
  install -Dm644 "$srcdir"/mldonkey.service "$pkgdir"/usr/lib/systemd/system/mldonkey.service
  install -Dm644 "$srcdir"/mldonkey.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/mldonkey.conf
  install -Dm644 "$srcdir"/mldonkey.sysusers "$pkgdir"/usr/lib/sysusers.d/mldonkey.conf
}
