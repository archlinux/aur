# Maintainer: xiretza <xiretza+aur@gmail.com>
_pkgname=openelp
pkgname=$_pkgname-git
pkgver=0.8.0.r8.g48f77d1
pkgrel=1
pkgdesc="An open source EchoLink proxy for Linux and Windows"
arch=(i686 x86_64 armv7h)
url="https://github.com/cottsay/openelp"
license=('BSD')
depends=(pcre2 openssl)
makedepends=(git cmake doxygen)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=()
backup=(etc/ELProxy.conf)
source=("$_pkgname::git+${url}"
        "$_pkgname.service"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles")
sha256sums=('SKIP'
            '65bc8b1958a8eabdc4550e7601e171223ee78b89de8499a1aec65b6c2a73c429'
            'fb6aaac6ce857159d6646376951f67414a24c6eb45e19473e4b6ea1947b7c1d7'
            '298c89d12fa8a8ce171dd88da2e66859442b31c6b419d0e124b1883d9f80eaa6')

pkgver() {
	cd "$srcdir/${_pkgname}"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSCONF_INSTALL_DIR=/etc
	make -C build
}

check() {
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	chmod 0640 "$pkgdir/etc/ELProxy.conf"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$_pkgname/LICENSE"
	install -Dt "$pkgdir/usr/lib/systemd/system/" "$_pkgname.service"
	install -D "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -D "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
