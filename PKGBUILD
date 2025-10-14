# Contributor: holos
# Contributor: Michael Witten <mfwitten>
# Contributor: Vladimir Gorbunov <zaza>
# Contributor: Earnest
# Contributor: Attila Toth <menta>
# Contributor: Flu
# Contributor: menta <attila dot toth at ch dot bme dot hu>
# Contributor: hero <erdetb at web dot de>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=llpp-git
pkgver=35.r37.gd9ad4e4
pkgrel=1
pkgdesc='A graphical PDF viewer which aims to superficially resemble less(1).'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/llpp.git'
license=('custom')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
depends=('mupdf' 'freetype2' 'jbig2dec' 'openjpeg2'
	'libgl' 'libjpeg-turbo' 'glu' 'desktop-file-utils')
makedepends=('git' 'libmupdf' 'mupdf>=1.25' 'ocaml>=5.3.0' 'asciidoc' 'xmlto')
source=("$pkgname::git+git://repo.or.cz/llpp.git")
sha256sums=('SKIP')
# Dictionary lookup: http://repo.or.cz/llpp.git/commit/29916e0cadcdf0ee3136fc3b4655b3c8b0d01a7b
optdepends=(
	'xsel: text selection'
	'xclip: text selection'
	'sdcv: dictionary lookup'
	'rofi: dictionary lookup'
	'adobe-source-code-pro-fonts: recommended font for dictionary lookup presentation (any font can be used)'
	'wget: llppac fetch remote urls (preferred)'
	'curl: llppac fetch remote urls (alternative)'
	'file: llppac automatic file type recognition'
	'xz: llppac xz archives'
	'gzip: llppac gzip archives'
	'bzip2: llppac bzip2 archives'
	'zip: llppac png and jpeg conversion'
	'djvulibre: llppac djvu conversion'
	'ghostscript: llppac postscript, dvi, and djvu conversion'
	'unoconv: llppac office document conversion'
	'antiword: llppac .doc conversion (alternative)'
	'inkscape: llppac svg conversion (preferred)'
	'librsvg: llppac svg conversion (alternative)'
	'imagemagick: llppac image conversion'
	'pango: llppac font conversion'
	'pandoc: llppac text conversion'
	'texlive-core: llppac dvi conversion'
)
options=('!strip')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$srcdir/$pkgname"
	# /usr/lib/libharfbuzz.so.0: error adding symbols: DSO missing from command line
	sed -i -e 's@-lmupdf@-lmupdf -lharfbuzz@' build.bash
	# E.g.: variable ‘rootmediabox’ might be clobbered by ‘longjmp’ or ‘vfork’
	sed -i -e 's/ -Werror//g' build.bash
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build && sh misc/getmupdf.sh build/mupdf
	./build.bash build
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 build/llpp $pkgdir/usr/bin/llpp
	#install -D -m644 misc/llpp.desktop $pkgdir/usr/share/applications/llpp.desktop
	install -D -m644 README $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE

	# helper scripts
	cd misc/
	for i in cutrel llpp.inotify llppac; do
		install -D -m755 $i $pkgdir/usr/bin/$i
	done

	# custom key bindings: https://wiki.archlinux.org/index.php/Llpp#Custom_key_bindings
	install -D -m644 keys.txt "$pkgdir/usr/share/${pkgname%-*}/keys.txt"

	# shell completion
	cd completions/
	install -D -m644 zsh/_llpp "$pkgdir/usr/share/zsh/site-functions/_llpp"
	install -D -m644 zsh/_llppac "$pkgdir/usr/share/zsh/site-functions/_llppac"
}
