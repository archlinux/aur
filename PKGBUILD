pkgname=go-cross-luajit
pkgver=2.1.0.beta1
pkgrel=2
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='http://luajit.org/'
license=('MIT')
depends=('gcc-libs' 'go-cross') 
makedepends=('git')
source=(git+http://luajit.org/git/luajit-2.0.git#branch=v2.1 luajit.patch luajit-64bit-custom-allocators.diff)
options=(staticlibs !strip)
sha256sums=('SKIP'
            '522b28febf6ea955e66cf859c8f39b76447e8faa49689e9ceac9fca217ea02f2'
	    '10831c38000d00d9b757a2b128a9316f640d7ee1a1b8213c8353df2d33860025')

build() { 
	unset LDFLAGS
	unset CFLAGS
	export MACOSX_DEPLOYMENT_TARGET=10.6
	cd luajit-2.0

	patch -p1 -i $srcdir/luajit.patch 
	patch -p1 -i $srcdir/luajit-64bit-custom-allocators.diff 

	make amalg CC="gcc -m32" CROSS=i686-w64-mingw32- TARGET_SYS=Windows BUILDMODE=static
	mkdir -p ../output/lib/windows-386
	cp src/libluajit.a -t ../output/lib/windows-386
	ln -sf libluajit.a ../output/lib/windows-386/liblua5.1.a
	ln -sf libluajit.a ../output/lib/windows-386/liblua.a
	make clean

	make amalg CC="gcc" CROSS=x86_64-w64-mingw32- TARGET_SYS=Windows BUILDMODE=static
	mkdir -p ../output/lib/windows-amd64
	cp src/libluajit.a -t ../output/lib/windows-amd64
	ln -sf libluajit.a ../output/lib/windows-amd64/liblua5.1.a
	ln -sf libluajit.a ../output/lib/windows-amd64/liblua.a
	make clean

	export PATH=/opt/go-cross/osx/bin:/opt/go-cross/ndk-x86/bin:/opt/go-cross/ndk-arm64/bin:/opt/go-cross/ndk-arm/bin:$PATH

	make amalg CC="clang -m32" CROSS=i386-apple-darwin14- TARGET_SYS=Darwin BUILDMODE=static
	mkdir -p ../output/lib/darwin-386
	cp src/libluajit.a -t ../output/lib/darwin-386
	ln -sf libluajit.a ../output/lib/darwin-386/liblua5.1.a
	ln -sf libluajit.a ../output/lib/darwin-386/liblua.a
	make clean

	make amalg CC="clang" CROSS=x86_64-apple-darwin14- TARGET_SYS=Darwin BUILDMODE=static
	mkdir -p ../output/lib/darwin-amd64
	cp src/libluajit.a -t ../output/lib/darwin-amd64
	ln -sf libluajit.a ../output/lib/darwin-amd64/liblua5.1.a
	ln -sf libluajit.a ../output/lib/darwin-amd64/liblua.a
	make clean

	make amalg HOST_CC="gcc -m32" CC="gcc -fPIC" CROSS=arm-linux-androideabi- TARGET_SYS=Linux BUILDMODE=static
	mkdir -p ../output/lib/android-arm
	cp src/libluajit.a -t ../output/lib/android-arm
	ln -sf libluajit.a ../output/lib/android-arm/liblua5.1.a
	ln -sf libluajit.a ../output/lib/android-arm/liblua.a
	make clean

	make amalg HOST_CC="gcc" CC="gcc -fPIC" CROSS=aarch64-linux-android- TARGET_SYS=Linux BUILDMODE=static
	mkdir -p ../output/lib/android-arm64
	cp src/libluajit.a -t ../output/lib/android-arm64
	ln -sf libluajit.a ../output/lib/android-arm64/liblua5.1.a
	ln -sf libluajit.a ../output/lib/android-arm64/liblua.a
	make clean

	make amalg HOST_CC="gcc -m32" CC="gcc -fPIC" CROSS=i686-linux-android- TARGET_SYS=Linux BUILDMODE=static
	mkdir -p ../output/lib/android-386
	cp src/libluajit.a -t ../output/lib/android-386
	ln -sf libluajit.a ../output/lib/android-386/liblua5.1.a
	ln -sf libluajit.a ../output/lib/android-386/liblua.a
	make clean

	make amalg CC="gcc -m32 -march=i686" BUILDMODE=static 
	mkdir -p ../output/lib/linux-386
	cp src/libluajit.a -t ../output/lib/linux-386
	ln -sf libluajit.a ../output/lib/linux-386/liblua5.1.a
	ln -sf libluajit.a ../output/lib/linux-386/liblua.a
	make clean

	make amalg BUILDMODE=static
	mkdir -p ../output/lib/linux-amd64
	cp src/libluajit.a -t ../output/lib/linux-amd64
	ln -sf libluajit.a ../output/lib/linux-amd64/liblua5.1.a
	ln -sf libluajit.a ../output/lib/linux-amd64/liblua.a
	mkdir -p dest
	make install DESTDIR=$(realpath ../dest)
	make clean

}

package() {
	cd luajit-2.0
	mkdir -p $pkgdir/opt/go-cross/{lib,include}/{android-386,linux-386,darwin-386,windows-386,linux-amd64,darwin-amd64,windows-amd64,android-arm,android-arm64}
	cp -r ../output/lib -t $pkgdir/opt/go-cross
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/android-386
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/linux-386
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/darwin-386
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/windows-386
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/linux-amd64
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/darwin-amd64
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/windows-amd64
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/android-arm
	cp -r ../dest/usr/local/include/luajit-2.1/* -t $pkgdir/opt/go-cross/include/android-arm64
}
