# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=google-breakpad-fixed
pkgver=r2197.6b0c5b7e
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
options=('staticlibs' '!strip')
conflicts=('google-breakpad-git')
provides=('google-breakpad')
source=(
	'git+https://chromium.googlesource.com/breakpad/breakpad'
	'git+https://chromium.googlesource.com/linux-syscall-support'
)
# noextract=("lss-${_lssver}.tar.gz")
sha256sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	ln -sfT "$srcdir/linux-syscall-support" "breakpad/src/third_party/lss"
	cd "$srcdir/breakpad"
}

pkgver() {
	cd "$srcdir/breakpad"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	echo "Configuring"
	autoreconf
	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
	echo "Building"
	make
}

package() {
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
