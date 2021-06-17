# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.2.3
_codename=draftcheck
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL3')
depends=('gtkspell3' 'webkit2gtk' 'discount' 'gtksourceview4' 'libarchive'
         'clutter' 'libgee' 'libhandy' 'link-grammar')
makedepends=('git' 'meson' 'vala')
_commit=5fc261ad2b68478ff11880c5134c9c3fca797c56
source=("git+https://github.com/kmwallio/ThiefMD.git#commit=$_commit"
        'git+https://github.com/ThiefMD/custom-gtksourceview-languages.git'
        'git+https://github.com/ThiefMD/BiBtex-vala.git'
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
	for _submodule in BiBtex-vala ghost-vala ultheme-vala wordpress-vala writeas-vala libwritegood-vala; do
		git config submodule.src/${_submodule}.url $srcdir/${_submodule}
	done

	git submodule init data/language-specs
	git config submodule.custom-gtksourceview-languages.url $srcdir/custom-gtksourceview-languages
	git submodule update
}

build() {
	arch-meson ThiefMD build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s "/usr/bin/com.github.kmwallio.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
