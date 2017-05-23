# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=dynamixel-sdk
pkgver=3.4.5
pkgrel=1
pkgdesc="SDK for communicating with Dynamixel motors (C and C++ bindings)"
url="https://github.com/ROBOTIS-GIT/DynamixelSDK"
arch=(x86_64 i386)
license=(BSD)

source=("https://github.com/ROBOTIS-GIT/DynamixelSDK/archive/${pkgver}.tar.gz")
sha512sums=('af546a7b970567cc5dc2966f184d25bd792607a871813708e457d9ce4c3853c6b492bf71a5d51d52b360e99999ba3238b78538543ca0d00f7ffa4dcc657fab06')

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
	make -C "$_cxxdir"
	make -C "$_cdir"
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
