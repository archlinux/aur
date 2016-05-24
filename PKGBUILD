# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=monteverdi2
pkgver=3.2.0
pkgrel=1
pkgdesc="A remote sensing application based on Orfeo Toolbox"
arch=(x86_64)
url="http://www.orfeo-toolbox.org/otb/monteverdi.html"
license=('CeCILL')
groups=()
depends=('orfeo-toolbox' 'qwt5')
makedepends=()
optdepends=()
provides=(monteverdi2)
conflicts=()
replaces=()
backup=()
options=()
install=monteverdi2.install
changelog=
source=(${pkgname}::git://github.com/orfeotoolbox/Monteverdi2.git#branch=release-3.2 
)
noextract=()
md5sums=('SKIP')



build() {

  cd $srcdir
  msg "starting make..."
  if [ -d build ]; then
   rm -rf build
  fi
  mkdir build
  cd build


  cmake  ../$pkgname -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DITK_DIR=/usr/lib64/cmake/ITK-4.9 \
            -DOTB_DATA_ROOT=/usr/lib64/cmake/OTB-5.4 \
            -DOTB_DATA_USE_LARGEINPUT_ROOT=ON \
	  -DQWT_INCLUDE_DIR=/usr/include/qwt5 \
	  -DQWT_LIBRARY=/usr/lib64/libqwt5.so 
	  
		
  make
}

package() {

  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
  #fixing LD_LIBRARY_PATH issue
  echo "/usr/lib/otb" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
