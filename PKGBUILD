# Maintainer: Jacob Pfeiffer <jacob@pfeiffer.codes>
# Contributor: Tom Bebbington <tophattedcoder@gmail.com> 

pkgname=haxe-git
pkgver=git
pkgrel=1
pkgdesc="An open-source high-level multiplatform programming language and compiler that can produce applications and source code for many different platforms from a single code-base"
arch=('i686' 'x86_64')
url="https://github.com/HaxeFoundation/haxe"
license=('GPL2' 'MIT')
groups=('devel')
depends=('neko>=2.0.0')
makedepends=('git' 'ocaml' 'sed' 'zlib' 'pcre' 'neko>=2.0.0' 'help2man' 'camlp4')
provides=('haxe')
conflicts=('haxe')
options=('!strip' 'emptydirs' '!makeflags')
install=haxe.install
source=('haxe.sh' 
	"haxe::git+https://github.com/HaxeFoundation/haxe")
md5sums=('977476c8fc1dfc0acbb05bd22f9136b0'
         'SKIP')
_gitmod=haxe

pkgver() {
	cd "$SRCDEST"/haxe
	git rev-list HEAD --count
}

prepare() {
	cd $srcdir/$_gitmod
        msg "Initialising submodules"
        git submodule init
        msg "Updating submodules"
        git submodule update --init --recursive
  
        msg "Installing opam dependencies..."
	make opam_install
        msg2 "done."
}

build() {
	cd $srcdir/$_gitmod
	msg "Starting build..."
	
	#
	# BUILD HERE
	#
	msg "Cleaning up..."
	make clean > /dev/null
	msg2 "done."
	
	msg "Git commit # is ${pkgver}. Starting build..."
	msg "Building haxe..." && make || return 1
	msg2 "done."
#	msg "Generating Manual page..." && help2man haxe -v -version -h -help --no-discard-stderr -o ../haxe-manual || return 1
#	msg2 "done."
	_res=$?
	if [ $_res -eq 0 ]; then _msg="done."; else _msg="failed."; fi
	echo && msg2 $_msg
	return $_res
}

package() {
	cd $srcdir/$_gitmod
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	make INSTALL_DIR="$pkgdir/usr" install #env HAXE_STD_PATH=$srcdir/$_gitmod/std make INSTALL_DIR="$pkgdir/usr" install
	mkdir -p $pkgdir/etc/profile.d
	cp $srcdir/haxe.sh $pkgdir/etc/profile.d
	mkdir -p $pkgdir/usr/share/licenses/haxe-git
	cp $srcdir/$_gitmod/extra/LICENSE.txt $pkgdir/usr/share/licenses/haxe-git/LICENSE
#	mkdir -p $pkgdir/usr/share/man/man1
#	cp $srcdir/haxe-manual $pkgdir/usr/share/man/man1/haxe.1
}
