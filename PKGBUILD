# Maintainer: Scott Furry <scott.wl.furry@gmail.com>
pkgname=guayadeque-wx3
pkgver=0.3.7
pkgrel=1
pkgdesc='The Linux Media Player (updated to use wx3.0)'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'libgpod' 'taglib' 'wxgtk' 'gdk-pixbuf2')
conflicts=('guayadeque')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
			'gstreamer0.10-bad-plugins: Support for additional file formats'
			'gstreamer0.10-ugly-plugins: Support for additional file formats'
			'gvfs: Support for external devices')
source=("https://www.dropbox.com/s/kmlzvv1kd80wm7t/guayadeque-0.3.7.tar.bz2?dl=0"
		"diff_1894_pixbuf_link.diff"
		"diff_1894_verchg.diff"
		"diff_1894_wxsqlite3.diff"
		"diff_1894_wx30.diff")

md5sums=('d0fc2d50b22576139bee99026fb5d5e8'
         '8a5523d991f0c48fc1d11bb8d51e2503'
         'c090d5dbb45f4e586fd7ae1726d372a5'
         'e4d5a83d7a1ccd8bca73aa7afff3c62b'
         '8e8661f7274271b885caa8864b169035')

prepare() {
  cd guayadeque-${pkgver}

  patch -Np1 -i ../diff_1894_pixbuf_link.diff
  patch -Np1 -i ../diff_1894_verchg.diff
  patch -Np1 -i ../diff_1894_wxsqlite3.diff
  patch -Np1 -i ../diff_1894_wx30.diff
}

build() {
  cd guayadeque-${pkgver}
  mkdir buildlocal && cd buildlocal

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"
  make
}

package() {
  cd guayadeque-${pkgver}/buildlocal
  make DESTDIR="${pkgdir}" install
}

post_install() {
  update-desktop-database -q
}

post_upgrade(){
  post_install
}

post_remove(){
  post_install
}
