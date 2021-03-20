# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.1.8
_codename=languages
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL3')
depends=('gtkspell3' 'webkit2gtk' 'discount' 'gtksourceview4' 'libarchive'
         'clutter' 'libgee' 'libhandy')
makedepends=('git' 'meson' 'vala')
_commit=413cf1e3a1d9dfb98dcf096a83842b20a9055212
source=("git+https://github.com/kmwallio/ThiefMD.git#commit=$_commit"
        'git+https://github.com/ThiefMD/ghost-vala.git'
        'git+https://github.com/TwiRp/ultheme-vala.git'
        'git+https://github.com/ThiefMD/wordpress-vala.git'
        'git+https://github.com/ThiefMD/writeas-vala.git'
        'git+https://github.com/ThiefMD/libwritegood-vala.git')
sha256sums=('SKIP'
            'SKIP'
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
	for _submodule in ghost-vala ultheme-vala wordpress-vala writeas-vala libwritegood-vala; do
		git config submodule.src/${_submodule}.url $srcdir/${_submodule}
	done
	git submodule update
}

build() {
	arch-meson ThiefMD build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s "/usr/bin/com.github.kmwallio.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
