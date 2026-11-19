# Maintainer: Fgaoxing <Fgaoxing0206@163.com>
# AUR: build aether from the upstream git HEAD. Static nolibc binary; no runtime deps.
pkgname=aether-rescue-git
pkgver=1.0.0.r17.gb5a046d
pkgrel=1
pkgdesc="Initramfs rescue shell toolbox: PID 1 init flow + BusyBox-style rescue applets (pure C, static nolibc)"
arch=('x86_64')
url="https://github.com/Fgaoxing/Aether"
license=('MIT')
options=('!buildflags' '!debug')
makedepends=('git' 'cmake')
depends=()
provides=('aether')
conflicts=('aether-rescue-bin')
install=aether-rescue-git.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$srcdir/$pkgname" -B "$srcdir/build" -DUSE_HOST_LIBC=OFF -DCMAKE_BUILD_TYPE=Release
	cmake --build "$srcdir/build" -j"$(nproc)"
}

package() {
	install -Dm755 "$srcdir/build/aether" "$pkgdir/usr/bin/aether"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# mkinitcpio install hooks: 打包到 /usr/lib/initcpio/install（用户覆盖放 /etc/initcpio/install）
	local hook
	for hook in "$srcdir/$pkgname"/initramfs/hooks/install/*; do
		install -Dm755 "$hook" "$pkgdir/usr/lib/initcpio/install/$(basename "$hook")"
	done
}
