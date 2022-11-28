# Maintainer: Jose Maria Garcia <josemaria.alkala@gmail.com>
_name="coolprop"
pkgname="$_name"-git
pkgver=6.4.2dev
pkgrel=2
# epoch=
pkgdesc="CoolProp shared library and headers; the open-source thermodynamic and transport properties database"
arch=('x86_64')
url="https://github.com/CoolProp/CoolProp"
license=('MIT')
# groups=()
# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("$_name::git+${url}.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

prepare() {
	cd "$_name"
  mkdir build
  git submodule update --init --recursive
}

build() {
	cd "$_name"
  cd build
  cmake .. -DCOOLPROP_RELEASE=ON -DCOOLPROP_SHARED_LIBRARY=ON  #-DCOOLPROP_DEBUG=ON -DCMAKE_CXX_FLAGS_DEBUG='-g -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC'
	#autoreconf -i
	#./configure --prefix=/usr
	#make -s
  cmake --build .
}

check() {
	cd "$_name"
	#make -k check
}

# package() {
# 	cd "$pkgname-$pkgver"
# 	make DESTDIR="$pkgdir/" install
# }
package() {
  cd "$_name"

  install -Dm755 build/libCoolProp.so.6.4.2dev ${pkgdir}/usr/lib/libCoolProp.so.6.4.2dev

  # headers
  install -d ${pkgdir}/usr/include/CoolProp/fmt  # Create the folder
  install -Dm644 include/*.h ${pkgdir}/usr/include/CoolProp
  #sed -i 's/\"fmt\/format.h\"/\<fmt\/format.h\>/' ${pkgdir}/usr/include/CoolProp/*.h
  #sed -i 's/\"fmt\/printf.h\"/\<fmt\/printf.h\>/' ${pkgdir}/usr/include/CoolProp/*.h
  install -Dm644 externals/fmtlib/fmt/*.h ${pkgdir}/usr/include/CoolProp/fmt
  install -Dm644 externals/fmtlib/fmt/*.cc ${pkgdir}/usr/include/CoolProp/fmt


  cd ${pkgdir}/usr/lib/
  ln -s libCoolProp.so.6.4.2dev libCoolProp.so.6
  ln -s libCoolProp.so.6.4.2dev libCoolProp.so  
}