# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_android_arch=arm64-v8a
_pkg_arch=aarch64
_android_arch=arch-arm64
_android_toolchain=$_pkg_arch-linux-android
_android_platform=22 # https://developer.android.com/about/dashboards/
_android_platform_dir=android-$_android_platform/$_android_arch
_pkgname=openssl
_ver=1.1.1a
_pref=/opt/android-libs/$_pkg_arch

# export Android configuration
export ANDROID_MINIMUM_PLATFORM=$_android_platform
export ANDROID_NDK_ROOT=${ANDROID_NDK_ROOT:-/opt/android-ndk}
export ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT:-/opt/android-sdk}
export ANDROID_EABI=$_android_toolchain-4.9
export ANDROID_ARCH=$_android_arch

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
sha256sums=('fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41'
            'SKIP'
            '0938c8d68110768db4f350a7ec641070686904f2fe7ba630ac94399d7dc8cc5e')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

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
