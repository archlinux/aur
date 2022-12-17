# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpad-git
pkgver=r315.e9e9cb0
pkgrel=2
pkgdesc="A small linux framebuffer virtual terminal."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/fbpad.git"
license=('ISC')
makedepends=('git' 'fbpad-mkfn' 'ttf-dejavu')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname}.install
source=("$pkgname::git+git://repo.or.cz/fbpad.git"
	'conf.h' 'fbpad-256.info')
noextract=()
md5sums=('SKIP'
         'eb4f82a8aebf615b673669253511663b'
         '185b9d6ec1c539213226a3e2509c7ccd')
sha1sums=('SKIP'
          '021e9087ab62362b640424695f0b21db0c1bac1f'
          'dbb816fe37faf0acb4e1a916d7493787c2b647fc')
sha256sums=('SKIP'
            'deb59b3405c3b24842d77b824d0dac157cf5675e6fc4c876711e2b2fbc710ad6'
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

	## Compile terminfo
	mkdir -p $pkgdir/usr/share/terminfo
	tic -x -o $pkgdir/usr/share/terminfo $srcdir/fbpad-256.info

	## Setup fonts
	if [ -x /usr/bin/fbpad-mkfn-ft ]; then
		FT2TF="fbpad-mkfn-ft -h17 -w11"
		SZ="12h120v100b0a1"
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono.ttf:$SZ > $srcdir/font-r.tf
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Oblique.ttf:$SZ > $srcdir/font-i.tf
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Bold.ttf:$SZ > $srcdir/font-b.tf
	else
		FT2TF="fbpad-mkfn-stb -h20 -w10"
		SZ="17h120v100b0a1"
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono.ttf:$SZ > $srcdir/font-r.tf
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Oblique.ttf:$SZ > $srcdir/font-i.tf
		$FT2TF /usr/share/fonts/TTF/DejaVuSansMono-Bold.ttf:$SZ > $srcdir/font-b.tf
	fi

	## Install fonts
	install -Dm644 ../font-r.tf $pkgdir/usr/share/${pkgname%-*}/font-r.tf
	install -Dm644 ../font-i.tf $pkgdir/usr/share/${pkgname%-*}/font-i.tf
	install -Dm644 ../font-b.tf $pkgdir/usr/share/${pkgname%-*}/font-b.tf
}
