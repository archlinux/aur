# Contributor: Lorenzo Tomei <tomeil@tiscali.it>
# Contributor: lestb <b.lester011+arch at gmail dot com>
 
pkgname=j7
pkgver=7.01b
pkgrel=14
pkgdesc="J is a modern, high-level, general-purpose, high-performance programming language"
arch=(i686 x86_64)
url="http://www.jsoftware.com"
license=('GPL3')
depends=('ncurses' 'gtksourceview2' 'wget' 'pcre')
optdepends=('expat' 'fftw' 'gtksourceview3')
makedepends=('sed')
source=(http://www.jsoftware.com/download/j701_b_source.tar.gz http://www.databaserossoverde.it/jsoftware/j701_env_20130722.tar.gz)
md5sums=(2ef8f28c383665258588300587263294 30a58ccb7fd24f63ea16211f721ab587)
 
prepare() {
cd "${srcdir}"/jgplsrc
sed -i 's@readline=0@readline=1@' bin/jconfig
sed -i 's@LIBREADLINE=""@LIBREADLINE="/usr/lib/libreadline.so"@' bin/jconfig
sed -i 's@-W1,soname,libj.so@-Wl,-soname,libj.so@' bin/jconfig
if [ "${CARCH}" = x86_64 ]; then
sed -i 's@bits=32@bits=64@' bin/jconfig
fi
}
 
build() {
cd "${srcdir}"/jgplsrc
bin/build_jconsole
bin/build_libj
bin/build_defs
}
 
package() {
cd "${srcdir}"
mkdir -p "${pkgdir}"/usr/lib/j7/
cp -a jgplsrc/j/* "${pkgdir}"/usr/lib/j7/
cp -a jenv/* "${pkgdir}"/
echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > ${pkgdir}/usr/lib/j7/bin/installer.txt
rm -r "${pkgdir}"/usr/lib/j7/addons/data
chown -R nobody:nobody "${pkgdir}"/srv/j
} 
