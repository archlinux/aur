# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=0.6.0.r4.g4ee2b3e
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://github.com/fairyglade/$_pkgname"
license=('custom:WTFPL')
depends=(pam)
makedepends=(git libxcb)
optdepends=('xorg-xauth: for X server sessions')
conflicts=(ly)
provides=(ly)
backup=(etc/"$_pkgname"/{config.ini,wsetup.sh,xsetup.sh})
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
    git submodule update --init --recursive
}

build() {
	make -C "$_pkgname"
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" NAME=ly-dm install installsystemd
    sed -i "s;/usr/bin/ly;/usr/bin/ly-dm;g" "$pkgdir/usr/lib/systemd/system/ly.service"
	install -D -m644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
