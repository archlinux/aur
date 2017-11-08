# Maintainer: Piotr Balwierz <my_surname at Google's webmail>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Frédéric Mangano <fmang+aur mg0 fr>
pkgname=kanatest
pkgver=0.4.10
pkgrel=10
pkgdesc="A simple Hiragana and Katakana drill tool"
arch=('i686' 'x86_64')
url="http://www.clayo.org/kanatest/"
license=('GPL')
depends=('gtk2' 'libxml2')
optdepends=('ttf-freefont: for using FreeSerif or FreeSans fonts'
            'ttf-arphic-uming: for using AR PL ShanHeiSun Uni font'
            'ttf-arphic-ukai: for using AR PL ZenKai Uni font')
install='kanatest.install'
source=("git+https://git.code.sf.net/p/kanatest/code")
sha256sums=("SKIP")

pkgver()
{
	cd "${srcdir}/code"
	# git date and commit:
	#git log -1 --format='%cd.%h' --date=short | tr -d -
	grep AC_INIT configure.ac | cut -f 2 --delim=, | tr -d \ []
}

prepare()
{
  cd "${srcdir}/code"
  sed -i src/Makefile.am -e 's/GDK_PIXBUF_DISABLE_DEPRECATED/GDK_PIXBUF_ENABLE_DEPRECATED/g'
  sed -i src/Makefile.am -e 's/GDK_DISABLE_DEPRECATED/GDK_ENABLE_DEPRECATED/g'
}

build()
{
  cd "${srcdir}/code"
  export PLATFORM_CFLAGS+=" -DGDK_PIXBUF_ENABLE_DEPRECATED -DGDK_ENABLE_DEPRECATED -DGTK_ENABLE_DEPRECATED"
  sh autogen.sh || return 1
  #sed -i configure.ac -e 's/-Werror//'
  #sed -i -Werror-implicit-function-declaration
  ./configure --prefix=/usr || return 1
  make all || return 1
}

package()
{
  cd "${srcdir}/code"
  make DESTDIR="${pkgdir}" install || return 1
}
