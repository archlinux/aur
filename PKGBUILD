# Maintainer: X0rg

_kernel=$(pacman -Qqo /usr/lib/modules/`uname -r` | grep linux | grep -v headers)
_gitname=darling
pkgname=$_gitname-git
pkgver=1134.9f8521e
pkgrel=16
pkgdesc="A Darwin/OS X emulation layer for Linux"
arch=('i686' 'x86_64')
url="http://www.darlinghq.org"
license=('GPL3')
depends=('xz' 'fuse' 'libxml2' 'icu' 'openssl' 'lbzip2' 'zlib' 'libunwind' 'curl' 'systemd' 'libffi' 'bzip2' 'libxslt')
depends_x86_64=('lib32-systemd' 'lib32-libffi' 'lib32-bzip2' 'lib32-libxslt')
makedepends=('git' 'clang' 'bison' 'flex' "$_kernel-headers")
install=$pkgname.install
source=('git+https://github.com/darlinghq/darling.git'
	'git+https://github.com/darlinghq/darling-appkit.git'
	'git+https://github.com/darlinghq/darling-adv_cmds.git'
	'git+https://github.com/darlinghq/darling-awk.git'
	'git+https://github.com/darlinghq/darling-bash.git'
	'git+https://github.com/darlinghq/darling-bzip2.git'
	'git+https://github.com/darlinghq/darling-cfnetwork.git'
	'git+https://github.com/darlinghq/darling-compiler-rt.git'
	'git+https://github.com/darlinghq/darling-corefoundation.git'
	'git+https://github.com/darlinghq/darling-curl.git'
	'git+https://github.com/darlinghq/darling-dmg.git'
	'git+https://github.com/darlinghq/darling-file_cmds.git'
	'git+https://github.com/darlinghq/darling-foundation.git'
	'git+https://github.com/darlinghq/darling-grep.git'
	'git+https://github.com/darlinghq/darling-icu.git'
	'git+https://github.com/darlinghq/darling-installer.git'
	'git+https://github.com/darlinghq/darling-less.git'
	'git+https://github.com/darlinghq/darling-libcxx.git'
	'git+https://github.com/darlinghq/darling-libcxxabi.git'
	'git+https://github.com/darlinghq/darling-libdispatch.git'
	'git+https://github.com/darlinghq/darling-libkqueue.git'
	'git+https://github.com/darlinghq/darling-liblzma.git'
	'git+https://github.com/darlinghq/darling-libobjc2.git'
	'git+https://github.com/darlinghq/darling-libxml2.git'
	'git+https://github.com/darlinghq/darling-libxslt.git'
	'git+https://github.com/darlinghq/darling-nano.git'
	'git+https://github.com/darlinghq/darling-openssl.git'
	'git+https://github.com/darlinghq/darling-pcre.git'
	'git+https://github.com/darlinghq/darling-shell_cmds.git'
	'git+https://github.com/darlinghq/darling-text_cmds.git'
	'git+https://github.com/darlinghq/darling-zip.git'
	'git+https://github.com/darlinghq/darling-zlib.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$srcdir/$_gitname"

	msg2 "Initialize git submodules..."
	git submodule init
	for submodule in $(grep submodule ".gitmodules" | awk -F '"' '{ print $2 }'); do
		path=$(git config --list | grep $submodule | head -n1)
		git config submodule.$submodule.url "$srcdir/$(basename $path .git)"
		git submodule update $submodule
	done

	msg2 "Make build directories..."
	mkdir -pv "build/i386"

	if [[ $CARCH == "x86_64" ]]; then
		mkdir -pv "build/x86-64"
		sed -i 's/lib64/lib/' Toolchain-x86_64.cmake
	else
		sed -i 's/lib32/lib/' Toolchain-x86.cmake
	fi
}

build() {
	cd "$srcdir/$_gitname/build/i386"

	msg2 "Run 'cmake' for 32-bit build..."
	LDFLAGS="${LDFLAGS//,--as-needed}" cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86.cmake -DCMAKE_INSTALL_PREFIX=/usr

	msg2 "Run 'make' for 32-bit build..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		cd "$srcdir/$_gitname/build/x86-64"

		msg2 "Run 'cmake' for 64-bit build..."
		LDFLAGS="${LDFLAGS//,--as-needed}" cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86_64.cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug

		msg2 "Run 'make' for 64-bit build..."
		make
	fi

	cd "$srcdir/$_gitname/src/lkm"
	msg2 "Build Linux kernel module..."
	make
}

package() {
	cd "$srcdir/$_gitname/build/i386"
	msg2 "Install 32-bit build..."
	make DESTDIR="$pkgdir" install

	if [[ $CARCH == "x86_64" ]]; then
		cd "$srcdir/$_gitname/build/x86-64"
		msg2 "Install 64-bit build..."
		make DESTDIR="$pkgdir" install
	fi

	cd "$srcdir/$_gitname/src/lkm"
	msg2 "Install Linux kernel module..."
	make INSTALL_MOD_PATH="$pkgdir/usr" install
}
