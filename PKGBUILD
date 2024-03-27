# Maintainer: Ralph Torres <mail@ralphptorr.es>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=pmount
pkgver=0.9.23
pkgrel=14
pkgdesc='mount removable devices as normal user'
arch=(i686 x86_64 armv7h)
url=https://salsa.debian.org/debian/pmount
license=(GPL2)
_pkgvermin=7
_pkgver=$pkgver-$_pkgvermin
_pkgname=$pkgname-debian-$_pkgver

provides=($pkgname)
conflicts=($pkgname)
depends=('sysfsutils>=2.0.0-1' util-linux)
makedepends=('intltool>=0.21')
backup=(etc/pmount.allow)
source=(
    $url/-/archive/debian/$_pkgver/$_pkgname.tar.gz
    0001-fix-debug-segfault.patch
    0002-support-exfat.patch
)
sha256sums=(
    259d5994e4580ea4c0171c1534e5111c503a605d62e1a2d4d4bbd5018f99d727
    e19eda4987b41f1b76281b980b56239b386539938d70e5b4a40b286bff789b93
    6c90da5d992deea70334acaf6781df9d538887bd3d1b62e36a9449e0708006c0
)

prepare() {
    cd $srcdir/$pkgname-$pkgver
    patch -p1 < $srcdir/0001-Fix-a-careless-segfault-in-debug-mode.patch
    patch -p1 < $srcdir/pmount.exfat.patch
}

build() {
    # commented out to prevent
    # "Error in `/usr/bin/ld': corrupted double-linked list: 0x09e43ce8"
    #export CFLAGS="${CFLAGS} -fPIE -pie"
    #export CXXFLAGS="${CXXFLAGS} -fPIE -pie"

    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr --disable-hal \
        --with-cryptsetup-prog=/usr/bin/cryptsetup
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
    install -Dm644 $srcdir/pmount-bash-completion \
        $pkgdir/usr/share/bash-completion/completions/pmount
    mkdir -p $pkgdir/media
}
