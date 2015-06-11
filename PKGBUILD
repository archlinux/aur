# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>
pkgname=haxe-git
pkgver=11145
pkgrel=1
pkgdesc="An open-source high-level multiplatform programming language and compiler that can produce applications and source code for many different platforms from a single code-base"
arch=('i686' 'x86_64')
url="https://github.com/HaxeFoundation/haxe"
license=('GPL2' 'MIT')
groups=('devel')
depends=('neko>=2.0.0')
makedepends=('git' 'ocaml' 'sed' 'zlib' 'neko>=2.0.0' 'help2man')
provides=('haxe')
conflicts=('haxe')
options=('!strip' 'emptydirs' '!makeflags')
install=haxe.install
source=('haxe.sh' "haxe::git+https://github.com/HaxeFoundation/haxe")
md5sums=('2744426baf31e3602473bcb8397947e3'
         'SKIP')
_gitmod=haxe

pkgver() {
	cd "$SRCDEST"/haxe
	git rev-list HEAD --count
}

build() {
	cd $srcdir/$_gitmod
	msg "Initialising submodules"
	git submodule init
	msg "Updating submodules"
	git submodule update
	msg "Starting build..."
	
	#
	# BUILD HERE
	#
	msg "Cleaning up..."
	make clean > /dev/null
	msg2 "done."
	
	msg "Git commit # is ${pkgver}. Starting build..."
	sed --in-place=.orig -e "s/\\(Haxe Compiler %d\.%d\.%d\\) -/\\1 [Git commit $pkgver] -/" main.ml 
	msg "Building haxe..." && make || return 1
	msg2 "done."
	msg "Building tools..." && make tools || return 1
	msg2 "done."
	msg "Generating Manual page..." && help2man haxe -v -version -h -help --no-discard-stderr -o ../haxe-manual || return 1
	msg2 "done."
	_res=$?
	if [ $_res -eq 0 ]; then _msg="done."; else _msg="failed."; fi
	echo && msg2 $_msg
	return $_res
}

package() {
	cd $srcdir/$_gitmod
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	env HAXE_STD_PATH=$srcdir/$_gitmod/std make INSTALL_DIR="$pkgdir/usr" install install_tools
	mkdir -p $pkgdir/etc/profile.d
	cp $srcdir/haxe.sh $pkgdir/etc/profile.d
	mkdir -p $pkgdir/usr/share/licenses/haxe-git
	cp $srcdir/$_gitmod/extra/LICENSE.txt $pkgdir/usr/share/licenses/haxe-git/LICENSE
	mkdir -p $pkgdir/usr/share/man/man1
	cp $srcdir/haxe-manual $pkgdir/usr/share/man/man1/haxe.1
  install --mode=755 "$srcdir/$_gitmod"/haxe "$pkgdir"/usr/bin/
}
