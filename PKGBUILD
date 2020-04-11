# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_pkgname=sentry-native
pkgname=sentry-native-git
pkgdesc="Sentry SDK for C, C++ and native applications."
pkgver=0.2.3.r1.gf9f2521
pkgrel=1
arch=('x86_64')
url="http://sentry.io/"
license=('MIT')
source=("git+https://github.com/getsentry/sentry-native.git"
	"breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git"
	"crashpad::git+https://github.com/getsentry/crashpad.git"
	"libunwindstack-ndk::git+https://github.com/getsentry/libunwindstack-ndk"
	"lss::git+https://chromium.googlesource.com/linux-syscall-support"
	)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
makedepends=('cmake' 'curl' 'git')
provides=( 'sentry-native' )

pkgver()
{
	cd "$srcdir/$_pkgname"
	( set -o pipefail
	 git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare()
{
	cd "$srcdir/$_pkgname"
	git submodule init
	for submodule in $(git submodule | awk '{print $2}'); do
		cd "$submodule"
		git config "submodule.$submodule.url" "$srcdir/${submodule##*/}"
		git submodule update
		cd -
	done
}

build()
{
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make ${MAKEFLAGS}
}

package()
{
	cd "$srcdir/${_pkgname}"
	make -C build DESTDIR="$pkgdir" install
}
