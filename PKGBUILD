# Maintainer: Tim Jester-Pfadt <t.jp<at>gmx.de>

pkgname=limba-git
pkgver=280.c75853a
pkgrel=9
pkgdesc="Limba is a new project which allows 3rd-party software installations on Linux"
arch=('i686' 'x86_64')
url="https://github.com/ximion/limba"
license=('GPLv2' 'LGPL2.1')
depends=('glib2' 'gobject-introspection' 'appstream' 'polkit' 'libarchive' 'gpgme' 'docbook-xsl' 'xmlto' 'curl' 'libutil-linux' 'intltool')
makedepends=('git' 'cmake')
source=('git+https://github.com/ximion/limba.git'
         'sources.list')
sha256sums=('SKIP'
            '38a9c1d7592f27a19f8815b69365f9f70ca719f7ea3455c10eec9e24801a6570')

build() {
  cd ${srcdir}/limba
  if [ -d build ]; then
  	cd build
  	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  	make
  else
	mkdir build && cd build
  	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  	make
  fi
}

package() {
  cd "${srcdir}"/limba
  cd build 
  make DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}"/sources.list "${pkgdir}"/etc/limba/sources.list
  chmod 700 "${pkgdir}"/usr/share/polkit-1/rules.d/
}

pkgver() {
  cd "$srcdir"/limba
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
