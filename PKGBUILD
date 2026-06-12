# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ccrtp
pkgver=2.1.2
pkgrel=5
pkgdesc="An implementation of RTP, the real-time transport protocol from the IETF"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.gnu.org/software/ccrtp/"
license=('GPL-2.0-only' 'custom')
depends=('ucommon>=6.2.2' 'libgcrypt')
optdepends=("texinfo: handle and view info files")
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        'fix-build-against-openssl-3.x.patch')
sha256sums=('f035ca0e1b5d37b78e358f07a25b05c5cdaf2c85c4b31cf29f6be17f288a349e'
            'SKIP'
            'e1488762bd489141c560bbde1961ce75271361a1e98457a1a08d50d04ebea407')
validpgpkeys=('5CF995AAD5CC1E4079F76C38B1732A9CB37C87BA')

prepare() {
    cd ${pkgname}-${pkgver}
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
  
    install -Dm644 COPYING.addendum "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
