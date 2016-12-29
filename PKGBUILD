# Maintainer: fpqc <harry.gindi@live.com>
# Uncomment both patches to enable solarized dark color scheme

pkgname=st-git-tic
_pkgname=st
pkgver=0.7.17.gc63a87c
pkgrel=1
pkgdesc='Simple terminal emulator for X with terminfo'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
epoch=1
# include config.h and any patches you want to have applied here
source=('git://git.suckless.org/st'
#	'http://st.suckless.org/patches/st-no_bold_colors-20160727-308bfbf.diff'
#	'http://st.suckless.org/patches/st-solarized-dark-20160727-308bfbf.diff'
	)
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
	git describe --tags |sed 's/-/./g'
}

prepare() {
	local file
	cd "${_pkgname}"

	# Rename the terminfo files to our custom ones
	sed -e '/| \|use=/s/st/st-git/' -i st.info
	
	# Set the default terminfo to our custom one
	sed -e 's/st-256color/st-git-256color/' -i config.def.h
	
	#Manually compile our own terminfo
	mkdir -p  "terminfo"
	tic -sx "st.info" -o "terminfo"
	
	#Remove the makefile's defective terminfo compilation
	sed '/@tic/d' -i Makefile

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
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/terminfo/s"
	install -Dm644 terminfo/s/* "${pkgdir}/usr/share/terminfo/s"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
