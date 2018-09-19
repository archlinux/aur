# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: naxuroqa <naxuroqa at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=toxcore
pkgname=toxcore-toktok-git
epoch=1
pkgver=0.2.7.4536
pkgrel=1
pkgdesc='Secure, configuration-free, P2P Skype replacement backend'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://tox.chat'
license=('GPL3')
depends=('libconfig' 'libsodium' 'libvpx' 'opus')
makedepends=('git' 'cmake' 'pkg-config')
conflicts=("toxcore")
provides=("toxcore")
install="$pkgname.install"
source=("$_pkgname::git+https://github.com/TokTok/c-toxcore.git"
        'toxcore.conf')
sha512sums=('SKIP'
            '71885e69f7b84955f6bdbf27b9e8196349cdd254b02b510433851bd218374d9c47aa7d3946dcc6a5cff6c8e705bc98d8a09de27039f60b8b088784cf8fa9d719')

pkgver() {
	cd $_pkgname
	echo "$(sed -n 's/AC_INIT(\[tox\], \[\(.*\)\])/\1/p' configure.ac).$(git rev-list --count HEAD)"
}

prepare() {
	cd $_pkgname
	sed -i "s|/usr/local|/usr|" other/bootstrap_daemon/tox-bootstrapd.service
}

build() {
	cd $_pkgname
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		.

	make $MAKEFLAGS
}

# check() {
#     cd $_pkgname
#     make test
# }

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/toxcore.conf" "$pkgdir/usr/lib/sysusers.d/toxcore.conf"
	install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.service "$pkgdir/usr/lib/systemd/system/tox-bootstrapd.service"
	install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.conf "$pkgdir/etc/tox-bootstrapd.conf"
}
