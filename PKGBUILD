# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=tcc-ziyao
pkgver=0.9.27+e86aae4f
pkgrel=1
pkgdesc="Tiny C Compiler,with mob branch and patches applied by ziyao"
arch=('x86_64')
url="https://bellard.org/tcc/"
license=('LGPL')
depends=('glibc')
provides=("tcc")
conflicts=("tcc")

_url="https://repo.or.cz/tinycc.git"
_commit=e86aae4f6dbdc44994d582758f496c7493cbc183

source=("${pkgname}-${pkgver}::git+${_url}#commit=${_commit}" 
	"empty_archive.patch" 
	"linker_option_entry.patch" 
	"mxcsr.patch")
	
md5sums=('SKIP' 
	 '2914d156ae387f5245040923a96a4d53' 
	 '45c326136a54ef47db8488f71a10e71b' 
	 '1eb77e112370d613526641f663a44214')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ${srcdir}/empty_archive.patch
  patch -p1 < ${srcdir}/linker_option_entry.patch
  patch -p1 < ${srcdir}/mxcsr.patch
}

build() {
  cd ${pkgname}-${pkgver}
  unset CFLAGS
  unset LDFLAGS
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" docdir="$pkgdir"/usr/share/doc/tcc install
}
