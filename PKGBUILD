# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=dynamixel-sdk
pkgver=3.7.0
pkgrel=1
pkgdesc="SDK for communicating with Dynamixel motors (C and C++ bindings)"
url="https://github.com/ROBOTIS-GIT/DynamixelSDK"
arch=(x86_64 i386)
license=(BSD)

source=("https://github.com/ROBOTIS-GIT/DynamixelSDK/archive/${pkgver}.tar.gz")
sha512sums=('8593d993b9485aba2516f1bbcc0ef01adde07f6d891451d8854a361a4dee9fee25cbb7ad44efeabae07a446472944d630b36c77e83a8aa7d8a5a22edc90e93d0')

_dir="DynamixelSDK-$pkgver"
if [[ $CARCH == i386 ]]; then
	_cxxdir="$_dir/c++/build/linux32"
	_cdir="$_dir/c/build/linux32"
	_libsuffix="x86"
else
	_cxxdir="$_dir/c++/build/linux64"
	_cdir="$_dir/c/build/linux64"
	_libsuffix="x64"
fi

build() {
	local _cflags="-fPIC -I../../include/dynamixel_sdk $CFLAGS"
	local _cxxflags="-fPIC -I../../include/dynamixel_sdk $CXXFLAGS"
	# At the time of writing, the Makefiles use CCFLAGS and CXFLAGS, not CFLAGS and CXXFLAGS...
	make -C "$_cxxdir" LDFLAGS="-shared $LDFLAGS" CCFLAGS="$_cflags" CXFLAGS="$_cxxflags"
	make -C "$_cdir"   LDFLAGS="-shared $LDFLAGS" CCFLAGS="$_cflags" CXFLAGS="$_cxxflags"
}

package() {
	# C++ library
	install -m755 -D "$srcdir/$_cxxdir/libdxl_${_libsuffix}_cpp.so" "$pkgdir/usr/lib/libdxl_${_libsuffix}_cpp.so.2.0.0"
	ln -s "libdxl_${_libsuffix}_cpp.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_cpp.so.2.0"
	ln -s "libdxl_${_libsuffix}_cpp.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_cpp.so.2"
	ln -s "libdxl_${_libsuffix}_cpp.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_cpp.so"

	# C library
	install -m755 -D "$srcdir/$_cdir/libdxl_${_libsuffix}_c.so"     "$pkgdir/usr/lib/libdxl_${_libsuffix}_c.so.2.0.0"
	ln -s "libdxl_${_libsuffix}_c.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_c.so.2.0"
	ln -s "libdxl_${_libsuffix}_c.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_c.so.2"
	ln -s "libdxl_${_libsuffix}_c.so.2.0.0" "$pkgdir/usr/lib/libdxl_${_libsuffix}_c.so"

	# Includes
	install -m755 -d "$pkgdir/usr/include"
	cp -r "$srcdir/$_cdir/../../include"   "$pkgdir/usr/include/dynamixel_sdk_c"
	cp -r "$srcdir/$_cxxdir/../../include" "$pkgdir/usr/include/dynamixel_sdk_cpp"

	# License
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_dir/LICENSE"
}
