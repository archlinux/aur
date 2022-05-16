# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com> 
# Contributor: Rick Chen <stuffcorpse@archlinux.us>

pkgname=tokyocabinet
pkgver=1.4.48
pkgrel=3
pkgdesc='A modern implementation of DBM'
arch=('i686' 'x86_64')
url='https://fallabs.com/tokyocabinet/'
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig')
depends=('zlib' 'bzip2')
source=("https://gitlab.com/patlefort/tokyocabinet/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('7ac6676532be461a55b91eefa832b36e7118fca01b377d0ed3cad81580d3460d')

_srcdir="$pkgname-v$pkgver"

prepare() {
	cd "$_srcdir"
	
	# get rid of references to $HOME
	sed -i 's|LDENV = .*|LDENV = |' Makefile.in
	sed -i 's|$HOME|/usr|' configure
}

build() {
	cd "$_srcdir"
	./configure --prefix=/usr --libexecdir="/usr/lib/$pkgname" --enable-off64 --enable-fastest
	make
}

# disable checks if needed (can take ~5mins to run check)
check() {
	cd "$_srcdir"
	make -k check
}

package() {
	cd "$_srcdir"
	make DESTDIR="$pkgdir/" install
}
