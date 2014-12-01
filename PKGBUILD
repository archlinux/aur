# Maintainer : Keshav Amburay <(the ddoott ridikulusddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Robert Orzanna <orschiro@googlemail.com>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.0.170.gc3c7c87
pkgrel=1
pkgdesc="A C++ rewrite of tablet note-taking software Xournal - GTK3 branch"
arch=('x86_64' 'i686')
url="https://github.com/xournalpp/xournalpp"
license=('GPL3')
makedepends=('git')
depends=('gtk3' 'openjpeg2' 'libgnomecanvas>=2.30.1' 'ghostscript' 'shared-mime-info' 'poppler-glib>=0.14.0' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=("${_pkgname}" "${_pkgname}-gtk3" 'xournal-gtk3' 'xournal')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-gtk3=${pkgver}" 'xournal-gtk3' 'xournal')
options=('!strip' 'zipman' 'docs' '!emptydirs')
install="${_pkgname}.install"

source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git#branch=gtk3"
        'xournalpp_fix_libopenjpeg.patch')

sha1sums=('SKIP'
          'e6a219270d550200331389c8010641c8902e8e84')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	echo "$(git describe --tags)" | sed -e 's|glib-||g' -e 's|-|.|g' -e 's|^v||g'
}

prepare() {
	
	rm -rf "${srcdir}/${_pkgname}_build/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}_build"
	
	cd "${srcdir}/${_pkgname}_build/"
	
	git clean -x -d -f
	echo
	
	msg "Apply libopenjpeg fixes"
	## https://github.com/xournalpp/xournalpp/wiki/Arch-20131101
	patch -Np1 -i "${srcdir}/xournalpp_fix_libopenjpeg.patch"
	echo
	
}

build() {
	
	cd "${srcdir}/${_pkgname}_build/"
	
	libtoolize
	autoreconf
	echo
	
	./configure --prefix=/usr --enable-mathtex --enable-libopenjpeg
	echo
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_pkgname}_build/"
	make DESTDIR="${pkgdir}" install desktop-install
	
}
