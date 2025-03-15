# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=statsd-c-client-git
pkgver=r36.ef6f82f
pkgrel=1
pkgdesc="A trivial statsd client in C"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/romanbsd/statsd-c-client"
license=('MIT')
depends=()
makedepends=('git' 'make')
conflicts=(statsd-c-client)
provides=(statsd-c-client "libstatsdclient.so")
source=("$pkgname"::"git+https://github.com/romanbsd/statsd-c-client.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "$srcdir/$pkgname"

	#TODO:lacks FULL RELRO, check LDFLAGS.
    #TODO lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.

	LOCAL_DIR=/usr \
	    make lib
}

package() {
	cd "$srcdir/$pkgname"

    install -Dm 0644 statsd-client.h "$pkgdir"/usr/include/statsd/statsd-client.h

	for lib in libstatsdclient.so.*; do
        install -Dm 0755 $lib "$pkgdir"/usr/lib/$lib
        ln -sf /usr/lib/$lib "$pkgdir/usr/lib/libstatsdclient.so"
    done
}
