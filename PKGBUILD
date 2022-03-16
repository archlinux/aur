# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=xrandr-watch-git
pkgver=r23.56fc8c7
pkgrel=3
pkgdesc="xrandr event watcher"
arch=('x86_64')
url='https://github.com/pastleo/xrandr-watcher'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'make' 'npm')
provides=('xrandr-watch')
conflicts=('xrandr-watch')
source=(
	'git+https://github.com/pastleo/xrandr-watcher.git#branch=src'
	'default-handler-hint.sh'
	'xrandr-watcher.service'
)
md5sums=(
	'SKIP'
	'b9a8f7d7ef2127b0d88974869fd5b2c2'
	'd9029d0359429aa3c54acb7e02d111a1'
)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/xrandr-watcher"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/xrandr-watcher"
	make clean
	make

	cd "$srcdir"
	cp xrandr-watcher/example-handler.sh ./xrandr-watcher-handler-example
	cat default-handler-hint.sh >> ./xrandr-watcher-handler-example

}

package() {
	cd "$srcdir"
	install -Dm755 xrandr-watcher/xrandr-watcher "$pkgdir"/usr/bin/xrandr-watcher
	install -Dm755 xrandr-watcher-handler-example "$pkgdir"/usr/bin/xrandr-watcher-handler-example
	install -Dm644 xrandr-watcher.service "$pkgdir"/usr/lib/systemd/user/xrandr-watcher.service
}
