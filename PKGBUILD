# Maintainer: Ralph Torres <mail@ralphptorr.es>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=pmount
pkgver=0.9.23_11
pkgrel=1
pkgdesc='mount removable devices as normal user'
arch=(i686 x86_64 armv7h)
url=https://salsa.debian.org/debian/pmount
license=('GPL-3.0-or-later')
_debver=${pkgver/_/-}
_pkgname=$pkgname-debian-$_debver

depends=('sysfsutils>=2.0.0-1' util-linux)
makedepends=('intltool>=0.21')
backup=(etc/pmount.allow)
source=(
    $_pkgname.tar.gz::$url/-/archive/debian/$_debver/$_pkgname.tar.gz
    0001-fix-debug-segfault.patch
)
sha256sums=('b41ab80692cc026556983e6a302abcca4e31cf0c388b27842f41e3e3f538897d'
            'e19eda4987b41f1b76281b980b56239b386539938d70e5b4a40b286bff789b93')

latestver() {
    git ls-remote --tags "$url.git" 'refs/tags/debian/*' |
        sed -nE 's#.*refs/tags/debian/([0-9]+(\.[0-9]+)*)-([0-9]+)(\^\{\})?$#\1_\3#p' |
        sort -Vu |
        tail -1
}

prepare() {
    cd "$srcdir"/$_pkgname
    patch -p1 < $srcdir/0001-fix-debug-segfault.patch

    local debian_patch
    for debian_patch in \
        04-fix-implicit-function-declaration.patch \
        05-exfat-support.patch \
        06-C99-implicit-function-declaration-fixes.patch \
        07-Add-probing-for-Btrfs.patch \
        08-Support-btlkOpen-alongside-of-luksOpen.patch \
        09-Probe-for-f2fs.patch; do
        patch -Np1 < "debian/patches/${debian_patch}"
    done
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
