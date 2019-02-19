# Maintainer: Andrea Corsini <andrea.corsini@outlook.com>

pkgname=st-solarized-dark
_pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc="Simple terminal implementation for X with dark solarized color scheme"
arch=('i686' 'x86_64')
url="https://st.suckless.org/"
license=('MIT')
depends=('libxft')
makedepends=('git' 'libxext' 'ncurses')

provides=("$_pkgname")
conflicts=("$_pkgname")

# include config.h and any patches you want to have applied here
source=("https://dl.suckless.org/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "https://st.suckless.org/patches/solarized/st-no_bold_colors-20170623-b331da5.diff"
        "https://st.suckless.org/patches/solarized/st-solarized-dark-20180411-041912a.diff")

sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '71e1211189d9e11da93ee49388379c5f8469fcd3e1f48bb4d791ddaf161f5845'
            'b2d5e88a2616eafb82b2fefb63eecb0f9d71f839349ef40f9f69c1953444f88c')

prepare() {
    local file                
	cd "$_pkgname-$pkgver"
    for file in "${source[@]}"; do
		if [[ "$file" == "config.h" ]]; then
			# add config.h if present in source array
			# Note: this supersedes the above sed to config.def.h
			cp "$srcdir/$file" .
		elif [[ "$file" == *.diff || "$file" == *.patch ]]; then
			# add all patches present in source array
            patch -Np1 <"$srcdir/$(basename ${file})"
		fi
	done
}

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
