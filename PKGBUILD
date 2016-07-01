# Maintainer: Zygmunt Krynicki <me at zygoon dot pl>
pkgname=snap-confine
pkgver=1.0.34
pkgrel=2
pkgdesc="Confinement system for snap applications"
arch=('i686' 'x86_64')
url="git://github.com/snapcore/snap-confine"
license=('GPL3')
groups=()
depends=('glibc' 'bash')
makedepends=('indent' 'shellcheck' 'python-docutils' 'libseccomp' 'systemd')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/snapcore/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('28e2264289fcc7e8a63d74940c0f057f')

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
        --disable-apparmor \
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
