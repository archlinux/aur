# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpad-git
pkgver=r296.1d8d9f6
pkgrel=1
pkgdesc="A small linux framebuffer virtual terminal."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/fbpad.git"
license=('ISC')
makedepends=('git' 'ft2tf' 'ttf-dejavu')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname}.install
source=("$pkgname::git+git://repo.or.cz/fbpad.git"
	'conf.h' 'fbpad-256.info')
noextract=()
md5sums=('SKIP'
         '27b6253c85f2febfa3cf13fe973f4544'
         '185b9d6ec1c539213226a3e2509c7ccd')
sha1sums=('SKIP'
          'dc4a15129d0e13cdd3994fc81da3c470383a6079'
          'dbb816fe37faf0acb4e1a916d7493787c2b647fc')
sha256sums=('SKIP'
            '2df7b23d2cbcb907d0a895541f5f3d3d5e0d5f4ec652a2b13b0da693a9762af0'
            'fb8ae049aa7d41fb285cbf7aa4487b28014273ebcfceefb4d58fb07018312e9c')

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	## Custom config.h
	cp $srcdir/conf.h conf.h
}

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	cd $srcdir/$pkgname
	install -Dm755 ../$pkgname/fbpad $pkgdir/usr/bin/fbpad
	install -Dm644 ../$pkgname/README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	## Compile terminfo
	mkdir -p $pkgdir/usr/share/terminfo
	tic -x -o $pkgdir/usr/share/terminfo $srcdir/fbpad-256.info

	## Setup fonts
	if [ -x /usr/bin/fbpad-mkfn ]; then FT2TF="fbpad-mkfn -h20 -w10"; SZ="17h120v100b0a1"; else FT2TF=ft2tf; SZ=6; fi
	$FT2TF /usr/share/fonts/TTF/DejaVuSansMono.ttf:$SZ > $srcdir/font-r.tf
	$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Oblique.ttf:$SZ > $srcdir/font-i.tf
	$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Bold.ttf:$SZ > $srcdir/font-b.tf

	## Install fonts
	install -Dm644 ../font-r.tf $pkgdir/usr/share/${pkgname%-*}/font-r.tf
	install -Dm644 ../font-i.tf $pkgdir/usr/share/${pkgname%-*}/font-i.tf
	install -Dm644 ../font-b.tf $pkgdir/usr/share/${pkgname%-*}/font-b.tf
}
