# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.1.3
_codename=ohsohandy
pkgrel=2
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL3')
depends=('gtkspell3' 'webkit2gtk' 'discount' 'gtksourceview4' 'libarchive'
         'clutter' 'libgee' 'libhandy')
makedepends=('git' 'meson' 'vala')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/kmwallio/ThiefMD/archive/v$pkgver-$_codename.tar.gz")
_commit=48fe3ccf7f56f72af5e2948e8c367eeae0a80c48
source=("git+https://github.com/kmwallio/ThiefMD.git#commit=$_commit"
        'git+https://github.com/ThiefMD/ghost-vala.git'
        'git+https://github.com/TwiRp/ultheme-vala.git'
        'git+https://github.com/ThiefMD/writeas-vala.git'
        'git+https://github.com/ThiefMD/libwritegood-vala.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/ThiefMD"
	git describe --tags | sed "s/^v//;s/-$_codename//;s/-/+/g"
}

prepare() {
	cd "$srcdir/ThiefMD"
	git submodule init
	git config submodule.src/ghost.url $srcdir/ghost-vala
	git config submodule.src/ultheme.url $srcdir/ultheme-vala
	git config submodule.src/writeas.url $srcdir/writeas-vala
	git config submodule.src/writegood.url $srcdir/libwritegood-vala
	git submodule update
}

build() {
	arch-meson ThiefMD build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/com.github.kmwallio.thiefmd "$pkgdir/usr/bin/$pkgname"
}
