# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=j8-git
pkgver=1.4.1
pkgrel=1
pkgdesc='J is a modern, high-level, general-purpose, high-performance programming language'
arch=('i686' 'x86_64')
url='http://www.jsoftware.com'
license=('GPL3'  'LGPL')
depends=('ncurses' 'qt5-tools' 'qt5-websockets' 'qt5-webengine' 'wget' 'pcre')
source=('http://www.jsoftware.com/download/j701_b_source.tar.gz' 'http://www.jsoftware.com/gitlist/qtide.git/zipball/master' 'http://www.databaserossoverde.it/jsoftware/j804_env_20150404.tar.gz')
md5sums=('2ef8f28c383665258588300587263294' 'SKIP' 'b5f5d8ab0650f03b7dc32e6505080c9b')
if [ "${CARCH}" = x86_64 ]; then
_xarch=x86_64
else
_xarch=x86
fi

pkgver() {
_version=$(sed -n -e 2p "${srcdir}"/lib/lib.pro)
echo ${_version:10}
}

prepare() {
cd "${srcdir}"/jgplsrc
sed -i 's@readline=0@readline=1@' bin/jconfig
sed -i 's@LIBREADLINE=""@LIBREADLINE="/usr/lib/libreadline.so"@' bin/jconfig
sed -i 's@-W1,soname,libj.so@-Wl,-soname,libj.so@' bin/jconfig
sed -i 's@#define SY_ALIGN.*@#define SY_ALIGN 1@' js.h
if [ "${CARCH}" = x86_64 ]; then
sed -i 's@bits=32@bits=64@' bin/jconfig
fi
}

build() {
cd "${srcdir}"/jgplsrc
bin/build_jconsole
bin/build_libj
bin/build_defs
cd "${srcdir}"/lib
qmake && make
cd "${srcdir}"/main
qmake && make
}

package() {
cd "${srcdir}"
cp -a jenv/* "${pkgdir}"/
cp -a jgplsrc/j/bin/jconsole "${pkgdir}"/usr/lib/j8/bin/
cp -a jgplsrc/j/bin/libj.so "${pkgdir}"/usr/lib/j8/bin/
cp -a jgplsrc/j/system/defs "${pkgdir}"/usr/lib/j8/system/
cp -a bin/linux-"${_xarch}"/release/*  "${pkgdir}"/usr/lib/j8/bin/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j8/bin/installer.txt
chown -R nobody:nobody "${pkgdir}"/srv/j8
} 
