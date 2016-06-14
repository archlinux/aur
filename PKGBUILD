# Maintainer: Zygmunt Krynicki <me at zygoon dot pl>
pkgname=snap-confine
pkgver=1.0.29
pkgrel=1
pkgdesc="The snap-confine program helps to launch snappy applications"
arch=('i686' 'x86_64')
url="git://github.com/snapcore/snap-confine"
license=('GPL3')
groups=()
depends=('glibc' 'bash')
makedepends=('indent' 'shellcheck')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/snapcore/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
    : # Nothing to do
}

build() {
	cd "$pkgname-$pkgver"
    autoreconf -i
    # Confinement is disabled because arch doesn't yet have all the supporting
    # kernel patches. Rootfs is core snap is enabled because that is the
    # preferred way to create runtime environment for snaps. Nvidia support is
    # enabled to support proprietary nvidia drivers.
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/snap-confine \
        --disable-confinement \
        --enable-rootfs-is-core-snap \
        --enable-nvidia-arch
    make
}

check() {
	cd "$pkgname-$pkgver"
    make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
    # Install license
    install -D -m 755 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
