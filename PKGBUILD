# $Id$
# Maintainer: Martchus <martchus@gmx.net>

# export Android configuration
export ANDROID_MINIMUM_PLATFORM=21 # https://developer.android.com/about/dashboards/
export ANDROID_NDK_ROOT=${ANDROID_NDK_ROOT:-/opt/android-ndk}
export ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT:-/opt/android-sdk}
export ANDROID_EABI=aarch64-linux-android-4.9
export ANDROID_ARCH=arch-arm64

_android_arch=arm64-v8a
_pkgname=openssl
_ver=1.1.0h
_pref=/opt/android-$_pkgname/$_android_arch

pkgname=android-$_pkgname-$_android_arch
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_android_arch)"
arch=('any')
url='https://www.openssl.org'
license=('custom:BSD')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('perl' 'android-sdk' 'android-ndk')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz.asc"
        'setenv-android.sh')
sha256sums=('5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517'
            'SKIP'
            '618eba24998f973487b9ebc556dd48d6828932f51f69ae75cb9da6c65c92b00a')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

build() {
	cd "$srcdir/$_pkgname-$_ver"
	source "$srcdir/setenv-android.sh"

	./Configure \
		--prefix="$_pref" \
		--openssldir="$_pref" \
		-isystem"$ANDROID_NDK_ROOT/sysroot/usr/include" \
		-isystem"$ANDROID_NDK_ROOT/sysroot/usr/include/${_ANDROID_EABI%-*}" \
		shared \
		android
	
	# ensure the libraries are not versioned (setting CALC_VERSIONS doesn't work for some reason)
        sed -i -e 's/\.\$(SHLIB_MAJOR)\.\$(SHLIB_MINOR)//g' Makefile

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
