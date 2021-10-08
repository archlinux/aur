# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nisk1

# Uncomment any of below lines to build additional plugins:
#_build_vlc="yes"
#_build_moc="yes"
#_build_xmms="yes"

pkgname=asap
pkgver=4.0.0
pkgrel=2
pkgdesc="Another Slight Atari Player - library and players for 8-bit Atari music format"
url="http://asap.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=(glibc)
options=(staticlibs)
source=("http://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7612dc0251c13345bd17dbec46cdecd794a50cab5d4b7840471a6bed41933640')

if [[ "$_build_vlc" = "yes" ]]; then
  makedepends+=('vlc')
fi

if [[ "$_build_moc" = "yes" ]]; then
  makedepends+=('moc')
  source+=('http://ftp.daper.net/pub/soft/moc/stable/moc-2.5.2.tar.bz2')
  sha256sums+=('f3a68115602a4788b7cfa9bbe9397a9d5e24c68cb61a57695d1c2c3ecf49db08')
fi

if [[ "$_build_xmms" = "yes" ]]; then
  makedepends+=('xmms')
fi

build() {
	cd $srcdir/$pkgname-$pkgver/
	make

	if [[ "$_build_vlc" = "yes" ]]; then
		make asap-vlc
	fi

	if [[ "$_build_xmms" = "yes" ]]; then
		make asap-xmms
	fi

	if [[ "$_build_moc" = "yes" ]]; then
		cd $srcdir/moc-2.5.2
		./configure
		cd $srcdir/$pkgname-$pkgver/
		make asap-moc MOC_INCLUDE="$srcdir/moc-2.5.2/"
	fi
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	make DESTDIR="${pkgdir}" prefix="/usr" install-asapconv install

	if [[ "$_build_vlc" = "yes" ]]; then
		make DESTDIR="${pkgdir}" prefix="/usr" install-vlc
	fi

	if [[ "$_build_xmms" = "yes" ]]; then
		make DESTDIR="${pkgdir}" prefix="/usr" install-xmms
	fi

	if [[ "$_build_moc" = "yes" ]]; then
		make MOC_PLUGIN_DIR="${pkgdir}/usr/lib/moc/decoder_plugins" install-moc
	fi
}

