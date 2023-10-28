# Maintainer: Denilson Sá <denilsonsa@gmail.com>

pkgname=xevil-git
pkgver=r28.9ca8505
pkgrel=1
pkgdesc="Side-view, single or network-multiplayer, fast-action, kill-everything, game."
# Note: building this package on ARM is untested, but it should work due to https://github.com/lvella/xevil/pull/2
#arch=('x86_64' 'armv7h' 'aarch64')
arch=('x86_64')
url="https://www.xevil.com/"
license=('GPL2')

# Notes about the `depends`
#
# `xevil` requires the `9x15` font available at the X server. The font itself
# is provided by `xorg-fonts-misc` package, but X won't be able to read it
# until it gets listed on `/usr/share/fonts/misc/fonts.dir` (i.e. index of font
# files in that directory).
#
# The package `xorg-mkfontscale` installs a hook to automatically keep that
# index file up-to-date: /usr/share/libalpm/hooks/xorg-mkfontscale.hook
# However, it is also possible to install X fonts without having the hook
# installed, as that package is not a dependency of the fonts packages.
# In such (relatively common) case, the fonts will be on the filesystem, but
# the X server wouldn't know about them.
#
# To simplify and streamline the end-user experience, I'm adding
# `xorg-mkfontdir` package (provided by `xorg-mkfontscale`) as a dependency of
# `xevil-git`. It's not a direct dependency, but it is required before the
# fonts are made available to the X server. The end-user will just need to
# either restart the computer, or log out and log in, or run `xset fp rehash`.
#
depends=('libx11' 'libxpm' 'xorg-fonts-misc' 'xorg-mkfontdir')

makedepends=('git')
source=('git+https://github.com/lvella/xevil.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 x11/REDHAT_LINUX/xevil "$pkgdir/usr/bin/xevil"
	install -Dm755 x11/REDHAT_LINUX/serverping "$pkgdir/usr/bin/xevil-serverping"
	mkdir -p "$pkgdir/usr/share/doc/${pkgname%-git}"
	install -Dm644 instructions/* "$pkgdir/usr/share/doc/${pkgname%-git}/"
	install -Dm644 compiling.html readme.txt "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
