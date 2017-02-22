# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=mimic
pkgver=1.2.0
pkgrel=1
pkgdesc="Text-to-speech voice synthesis from the Mycroft project."
arch=(x86_64 i686)
url="https://mimic.mycroft.ai/"
license=('custom')
groups=()
depends=(alsa-lib)
makedepends=('git' 'libtool' 'autoconf' 'automake')
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MycroftAI/mimic/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('6bd2a4e2349a8491542b2fd7739c67b8')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

build() {
	# mimic does not support building with BUILDDIR set
	# (yaourt does this)
	unset BUILDDIR

	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr

	#make
	# Temporary workaround for https://github.com/MycroftAI/mimic/issues/95
	make CFLAGS='-D_DEFAULT_SOURCE -O2'
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
