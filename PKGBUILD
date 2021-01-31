# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>
pkgname=vdr-channelscan
pkgver=1.1.4
_vdrapi=2.4.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Channel scanner for VDR"
url='https://bitbucket.org/ua0lnj/channelscan'
license=("GPL2")
depends=('bzip2' "vdr-api=${_vdrapi}" 'zlib')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/ua0lnj/channelscan/get/$pkgver.tar.bz2"
        "$pkgname-fix_Makefile.patch"
        "$pkgname-fix_min_max.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('941e8e5f2d534a3299bccdc46c88daea35c2cec6bf510d2b541736c32fe1640f'
            '91a01e9e93c778f7545f9622c06b10bd2bb04585d7d9e34995cb3a4a9d520896'
            '752007321f8413e5608738863962807f4d767983844af684e4b6e240fe2c7139')

prepare() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"

  patch -p1 -i "$srcdir/$pkgname-fix_Makefile.patch"
  patch -p1 -i "$srcdir/$pkgname-fix_min_max.patch"
}

build() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"
  make
}

package() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"
  make DESTDIR="${pkgdir}" install

  mkdir -p ${pkgdir}/var/lib/vdr/plugins/${_plugname}
  cp -r ./transponders/. ${pkgdir}/var/lib/vdr/plugins/${_plugname}/
  chown -R 666:666 "$pkgdir/var/lib/vdr"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
