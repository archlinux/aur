# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_pkg_arch=armv7a-eabi
_android_arch=armeabi-v7a
_android_toolchain=arm-linux-androideabi
_android_platform=21 # https://developer.android.com/about/dashboards/
_android_platform_arch=arch-arm
_android_platform_dir=android-$_android_platform/${_android_platform_arch}
_pkgname=openssl
_ver=1.1.1c
_pref=/opt/android-libs/$_pkg_arch

# export Android configuration
export ANDROID_MINIMUM_PLATFORM=$_android_platform
export ANDROID_NDK_ROOT=${ANDROID_NDK_ROOT:-/opt/android-ndk}
export ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT:-/opt/android-sdk}
export ANDROID_EABI=llvm
export ANDROID_ARCH=${_android_platform_arch}

pkgname=android-$_pkg_arch-$_pkgname
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_pkg_arch)"
arch=('any')
url='https://www.openssl.org'
license=('custom:BSD')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('android-sdk' 'android-ndk')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz.asc"
        'setenv-android.sh')
sha256sums=('f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90'
            'SKIP'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

build() {
	cd "$srcdir/$_pkgname-$_ver"

	# don't use -mandroid flag (Clang as provided by the NDK does not like it)
	sed -i -e 's/-mandroid//' Configurations/15-android.conf

	source "$srcdir/setenv-android.sh"

	./Configure \
		--prefix="$_pref" \
		--openssldir="$_pref" \
		--gcc-toolchain=$ANDROID_NDK_ROOT/toolchains/$_android_toolchain-4.9/prebuilt/linux-x86_64 \
		--sysroot=$ANDROID_NDK_ROOT/platforms/$_android_platform_dir/usr \
		-isystem"$ANDROID_NDK_ROOT/sysroot/usr/include" \
		-isystem"$ANDROID_NDK_ROOT/sysroot/usr/include/${_ANDROID_EABI%-*}" \
		-Wl,--no-allow-shlib-undefined \
		-Wl,--no-undefined \
		no-stdio \
		no-ui \
		threads \
		shared \
		android-${ANDROID_ARCH##arch-}

	# ensure the libraries are not versioned (setting CALC_VERSIONS doesn't work for some reason)
	sed -i -e 's/\.\$(SHLIB_MAJOR)\.\$(SHLIB_MINOR)//g' Makefile
	sed -i -e 's/\.\$(SHLIB_VERSION_NUMBER)//g' Makefile

	# get rid of debug printing so the library doesn't depend on stdio (no-stdio and no-ui are not entirely sufficient)
	sed -i -e 's/\#define TEST_ENG_OPENSSL_RC4_P_INIT//' crypto/engine/eng_openssl.c

	# build only libraries
	make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" build_libs	
}

package() {
	cd "$srcdir/$_pkgname-$_ver"
	source "$srcdir/setenv-android.sh"

	# install header files, libraries and license
	for lib in libcrypto.{a,so} libssl.{a,so}; do
		install -D -m0644 $lib "$pkgdir/$_pref/lib/$lib"
	done
	mkdir -p "$pkgdir/$_pref/include"
	cp -r include/openssl "$pkgdir/$_pref/include"
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# strip binaries
	local strip_path=$ANDROID_TOOLCHAIN/${CROSS_COMPILE}strip
	find "$pkgdir" -name 'lib*.so' -type f -exec "$strip_path" --strip-unneeded {} \;
	find "$pkgdir" -name 'lib*.a' -type f -exec "$strip_path" -g {} \;
}
