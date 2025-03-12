# Maintainer: Ralph Torres <mail@ralphptorr.es>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=pmount
pkgver=0.9.23
pkgrel=17
pkgdesc='mount removable devices as normal user'
arch=(i686 x86_64 armv7h)
url=https://salsa.debian.org/debian/pmount
license=(GPL2)
_pkgvermin=7
_pkgver=$pkgver-$_pkgvermin
_pkgname=$pkgname-debian-$_pkgver

depends=('sysfsutils>=2.0.0-1' util-linux)
makedepends=('intltool>=0.21')
backup=(etc/pmount.allow)
source=(
    $url/-/archive/debian/$_pkgver/$_pkgname.tar.gz
    0001-fix-debug-segfault.patch
    0002-support-exfat.patch
    0003-fix-luks-fail.patch
)
sha256sums=(
    259d5994e4580ea4c0171c1534e5111c503a605d62e1a2d4d4bbd5018f99d727
    e19eda4987b41f1b76281b980b56239b386539938d70e5b4a40b286bff789b93
    6c90da5d992deea70334acaf6781df9d538887bd3d1b62e36a9449e0708006c0
    67a6a773ff063df11b2bed1637e4046de63b226909f237705c45bef8ee398a2f
)

prepare() {
    cd "$srcdir"/$_pkgname
    patch -p1 < $srcdir/0001-fix-debug-segfault.patch
    patch -p1 < $srcdir/0002-support-exfat.patch
    patch -p1 < $srcdir/0003-fix-luks-fail.patch
}

build() {
    # commented out to prevent
    # "Error in `/usr/bin/ld': corrupted double-linked list: 0x09e43ce8"
    #export CFLAGS="${CFLAGS} -fPIE -pie"
    #export CXXFLAGS="${CXXFLAGS} -fPIE -pie"

    cd "$srcdir"/$_pkgname
    ./configure --prefix=/usr --disable-hal \
        --with-cryptsetup-prog=/usr/bin/cryptsetup
    make
}

package() {
    cd "$srcdir"/$_pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        debian/changelog debian/NEWS
    install -Dm644 -t "$pkgdir"/usr/share/bash-completion/completions \
        debian/completion/$pkgname
    install -d "$pkgdir"/media
}
