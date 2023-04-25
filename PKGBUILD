# Maintainer: emersion <contact@emersion.fr>
# Maintainer: swyter <swyterzone+aur@gmail.com>
pkgname=osxcross-git
_pkgname=${pkgname%-git}
_sdkname=MacOSX10.11.sdk # swy: choose your SDK version here
pkgver=0.15
pkgrel=1
pkgdesc="macOS cross-compiling toolchain for Linux, FreeBSD and NetBSD"
arch=('x86_64')
url="https://github.com/tpoechtrager/osxcross"
license=('MIT')
depends=('clang>=3.2')
makedepends=('patch' 'libxml2' 'bash')
optdepends=(
	'llvm: for Link Time Optimization support and ld64 -bitcode_bundle support'
	'uuid: for ld64 -random_uuid support'
	'xar: for ld64 -bitcode_bundle support'
)
provides=("$_pkgname" xar)
conflicts=("$_pkgname" xar apple-darwin-osxcross)
source=(
	'git+https://github.com/tpoechtrager/osxcross.git'
	"https://s3.dockerproject.org/darwin/v2/${_sdkname}.tar.xz"
)
md5sums=('SKIP' 'b0d81b95746c7e698c39c7df1e15ca7d')
noextract=("${_sdkname}.tar.xz")
options=('!strip')
install="$pkgname.install"

# https://github.com/tpoechtrager/cctools-port/issues/108
CXXFLAGS="$CXXFLAGS -U_GLIBCXX_ASSERTIONS -Wp,-U_GLIBCXX_ASSERTIONS"

prepare() {
	cd "$srcdir/$_pkgname"
	mv "../${_sdkname}.tar.xz" tarballs/
}

build() {
	cd "$srcdir/$_pkgname"

	# swy: put all the generated files in there
	export OSXCROSS_TARGET_DIR="$srcdir/usr/local/osx-ndk-x86"; mkdir -p "$OSXCROSS_TARGET_DIR"
	sed -i -s "s|export TARGET_DIR\=|export TARGET_DIR\='${OSXCROSS_TARGET_DIR}' #|" "./tools/tools.sh"

	# swy: use almost all available processor cores, for compiling speed. Leave a spare one.
	JOBS=$(( `nproc` - 1 )) UNATTENDED=yes OSX_VERSION_MIN=10.6  ./build.sh # OCDEBUG=1
}

package() {
	cd "$srcdir/$_pkgname"

	# swy: copy them over, as we can't seemingly use $pkgdir in build()
	mv "$srcdir/usr/" "$pkgdir/usr/"

	# swy: make sure the cross-compiled binaries can locate the .so dependencies stored aside in every
	#      case without having to set funky environment variables or patching every .elf's RUNPATH
	mkdir -p $pkgdir/etc/ld.so.conf.d/
	echo '/usr/local/osx-ndk-x86/lib' > $pkgdir/etc/ld.so.conf.d/osxcross.conf
}