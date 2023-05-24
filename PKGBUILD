# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=outils
pkgver=0.12
pkgrel=2
pkgdesc="A port of some non-standard OpenBSD tools to Linux"
arch=('x86_64')
url="https://github.com/leahneukirchen/outils"
license=('BSD')
depends=('glibc')
provides=('apply'
        'ou-cksum'
        'jot'
        'lam'
        'lndir'
        'md5'
        'rdate'
        'rs'
        'ts'
        'signify'
        'unvis'
        'vis'
        'what')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leahneukirchen/outils/archive/refs/tags/v${pkgver}.tar.gz"
        'LICENSE')
b2sums=('a329dd4e7fe666af561ca554e3f30b2188fab3c0ca6b4c201d7eb121785a2f5aca332fdd4e76896332cea84a2eca5a075836e34809fa6f459d5e72a1a3cbfa73'
        '3f242af7ea42dc13ba0a124da5861249b95195351fd181c86420c5e2580b8760f24574fe53062f7594071812958d1081e21fd3a7a78832a7a73eb441bead1231')

prepare(){
  rm "$pkgname-$pkgver"/LICENSE
  cp LICENSE "$pkgname-$pkgver"/
  cd "$pkgname-$pkgver"/
  # set proper LDFLAGS as recommended by Archlinux packging guidelines
  sed -i 's|-Wl,--as-needed|-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now|g' Makefile
  # calendar is also part of bsdmainutils. hence building same has to be disabled in the makefile
  sed -i '58d' Makefile
  sed -i '57d' Makefile
  sed -i '28d' Makefile
  sed -i 's/src\/usr\.bin\/calendar\/calendar//g' Makefile
  # cksum binary from package is in conflict with 'cksum' provided by 'coreutils'. Hence the former is renamed to ou-cksum
  sed -i 's/cksum/ou-cksum/g' Makefile
  sed -i 's/cksum/ou-cksum/g' src/bin/md5/Makefile
  mv src/bin/md5/cksum.1 src/bin/md5/ou-cksum.1
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  # remove man entry fro calendar as the same is not part of the package
  rm ${pkgdir}/usr/share/man/man1/calendar.1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
