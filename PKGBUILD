# Maintainer: libele <libele@disroot.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=vi
pkgver=070224
pkgrel=9
epoch=1
pkgdesc="The original ex/vi text editor"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://ex-vi.sourceforge.net/"
license=('BSD-4-Clause-UC AND Caldera-no-preamble')
depends=('ncurses')
optdepends=('s-nail: used by the preserve command for notification')
provides=('vi')
conflicts=('ex-vi-compat' 'heirloom-ex-vi')
source=(https://sources.archlinux.org/other/$pkgname/ex-$pkgver.tar.xz{,.sig}
        fix-tubesize-short-overflow.patch
        navkeys.patch
        format-security.patch
        linenum.patch
        preserve-dir.patch)
sha256sums=('c3e52dd44edd1f6bf0b52207f717c56149dc50aac0d131fff3851d589727f52f'
            'SKIP'
            '42167fabebe30a13d594346b1d254db82090ba41742a9f35b8895d37092053f0'
            '0e9e2d381f1d8cb86daae68462b3849825b003c08007725c0db9939d3d5bf58d'
            'ec50373ab48a9b327c5d02b10406bc3d04310d692de6c17098a59b1afeb08e03'
            '4539f46cd839475c168a9c463f041354463e90e810b973a10c499c2727b008e7'
            'f0ef9ed2ccea98bf47b08dd3faa2abb911b4e6c0579f5294e9d0e8742282ff65')
validpgpkeys=('86CFFCA918CF3AF47147588051E8B148A9999C34')  # Evangelos Foutras <evangelos@foutras.com>

prepare() {
  # Extract specific license files.
  sed -n '1,36p' ex-$pkgver/LICENSE > BSD-4-Clause-UC.txt
  sed -n '39,69p' ex-$pkgver/LICENSE > Caldera-no-preamble.txt

  cd ex-$pkgver

  patch -Np1 -i ../fix-tubesize-short-overflow.patch
  patch -Np1 -i ../navkeys.patch

  # https://bugs.archlinux.org/task/76121
  patch -Np1 -i ../format-security.patch

  # https://bugs.archlinux.org/task/70770
  patch -Np1 -i ../linenum.patch

  # https://bugs.archlinux.org/task/20653
  patch -Np1 -i ../preserve-dir.patch
}

build() {
  cd ex-$pkgver

  export CFLAGS=-std=gnu90
  make PREFIX=/usr LIBEXECDIR=/usr/lib/ex PRESERVEDIR=/var/lib/ex \
    TERMLIB=ncurses FEATURES="-DCHDIR -DFASTTAG -DUCVISUAL -DMB -DBIT8"
}

package() {
  cd ex-$pkgver

  make PREFIX=/usr LIBEXECDIR=/usr/lib/ex PRESERVEDIR=/var/lib/ex \
    INSTALL=/usr/bin/install DESTDIR="$pkgdir" install
  install -vDm 644 ../*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
