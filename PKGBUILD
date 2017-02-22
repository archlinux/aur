# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=mimic-git
pkgver=1.2.0.r0.eb4613e
pkgrel=1
pkgdesc="Text-to-speech voice synthesis from the Mycroft project."
arch=(x86_64 i686)
url="https://mimic.mycroft.ai/"
license=('custom')
groups=()
depends=(alsa-lib)
makedepends=('git' 'libtool' 'autoconf' 'automake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('mimic::git+https://github.com/MycroftAI/mimic.git#branch=master')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# mimic does not support building with BUILDDIR set
	# (yaourt does this)
	unset BUILDDIR

	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr

	#make
	# Temporary workaround for https://github.com/MycroftAI/mimic/issues/95
	make CFLAGS='-D_DEFAULT_SOURCE -O2'
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
