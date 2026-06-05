# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=freedroid
_srcsufix="-sdl2-port"
pkgver=1.9.1
pkgrel=1
pkgdesc="a clone of the classic game 'Paradroid' on Commodore 64"
arch=('x86_64')
url="http://freedroid.sourceforge.net/"
license=('GPL')
depends=('glibc' 'sdl2_image' 'sdl2_mixer' 'sdl2_gfx')
source=( #https://downloads.sourceforge.net/sourceforge/freedroid/$pkgname-$pkgver.tar.gz
        "${pkgname}-${pkgver}.tgz::https://github.com/ReinhardPrix/FreedroidClassic/archive/refs/tags/${pkgname}-${pkgver}${_srcsufix}.tar.gz"
	freedroid.desktop
	paraicon.png)
sha256sums=('3422ab02ddb8940f1482d091aa30bd13a663f1ca209b5d8283a8ec2b89e80cce'
            'b76e84adc15e8d83722e91843db80bbb664b3e330e03561977de90a06d4d8baf'
            '29e9d5bc1a5833c10fc8b26fac1f4a64338d3a624e18d280abe1d29837202239')

prepare() {
  cd "${srcdir}/FreedroidClassic-${pkgname}-${pkgver}${_srcsufix}"
  export CFLAGS="${CFLAGS} -Wno-discarded-qualifiers"
  export CXXFLAGS="${CXXFLAGS} -Wno-discarded-qualifiers"
  autoreconf --install --verbose
  #mv configure.ac configure
  #chmod +x configure
}

build() {
  cd "${srcdir}/FreedroidClassic-${pkgname}-${pkgver}${_srcsufix}"
#  CFLAGS+=' -fcommon -std=c99' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
#  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/FreedroidClassic-${pkgname}-${pkgver}${_srcsufix}"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/paraicon.png "$pkgdir"/usr/share/icons/paraicon.png
  install -Dm0644 "$srcdir"/freedroid.desktop "$pkgdir"/usr/share/applications/freedroid.desktop

  rm -rf "$pkgdir"/usr/share/freedroid/mac-osx
  rm -rf "$pkgdir"/usr/share/freedroid/freedroid.6
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile -exec rm -f {} \;
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile.in -exec rm -f {} \;
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile.am -exec rm -f {} \;
}
