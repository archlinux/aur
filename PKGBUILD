# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=libzypp
pkgver=17.10.1
pkgrel=1
pkgdesc="Package, Patch, Pattern, and Product Management"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp"
license=('GPL')
depends=('libsolv' 'openssl' 'curl' 'libsystemd')
makedepends=('git' 'cmake' 'boost' 'dejagnu' 'graphviz'
             'libxml2' 'expat' 'gnupg' 'rpm-org' 'libproxy'
	     'asciidoc')
provides=('libzypp')
source=("https://github.com/openSUSE/libzypp/archive/${pkgver}.tar.gz")
md5sums=('3f9bee95c62b82fcf68a009ed9716a90')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SKIP_RPATH=1 \
    -D DISABLE_AUTODOCS=1 \
    -D DISABLE_LIBPROXY=0 \
    .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # cmake fix (see GH#28)
  mkdir -p $pkgdir/usr/lib/cmake/Zypp
  mv $pkgdir/usr/share/cmake/Modules/FindZypp.cmake $pkgdir/usr/lib/cmake/Zypp/ZyppConfig.cmake
  mv $pkgdir/usr/share/cmake/Modules/ZyppCommon.cmake $pkgdir/usr/lib/cmake/Zypp/ZyppCommon.cmake
  
  # hacky lib64 symlink fix
  mv $pkgdir/usr/lib64/* $pkgdir/usr/lib/
  rmdir $pkgdir/usr/lib64
}
