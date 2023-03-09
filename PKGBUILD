# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Antoine Viallon <antoine+aur@lesviallon.fr>

pkgname=mfoc-hardnested-git
pkgver=0.10.9.r162.2c25bf0
pkgrel=1
pkgdesc="A fork of mfoc integrating hardnested code from the proxmark"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc-hardnested"
license=('GPL2')
depends=('libnfc>=1.7.0' 'xz')
makedepends=('git')
provides=('mfoc')
conflicts=('mfoc' 'mfoc-git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
	cd "$pkgname"
	printf "%s.r%s.%s" "$(grep AC_INIT configure.ac | sed 's/.*\[\([0-9.]\+\)\].*/\1/')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	git describe --tags | sed 's/^mfoc-//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
	cd "$pkgname"
	autoreconf -vis
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="${pkgdir}" install
}
