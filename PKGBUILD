pkgname=memreserver-git
pkgver=480253e5
pkgrel=1
pkgdesc="Workaround for AMGPU's inability to use swap for VRAM eviction when suspending"
arch=('x86_64')
url="https://git.dolansoft.org/lorenz/memreserver"
license=('GPL')
groups=()
depends=('libdrm')
makedepends=('git' 'meson' 'ninja') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("memreserver")
conflicts=("memreserver")
source=("memreserver::git+https://git.dolansoft.org/lorenz/memreserver")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson setup builddir
	meson compile -C builddir
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir/" meson install -C builddir
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    install -D -m644 "memreserver.service" "$pkgdir/usr/lib/systemd/system/"
}
