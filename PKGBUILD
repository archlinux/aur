# Maintainer: emersion <contact@emersion.fr>
# Maintainer: swyter <swyterzone+aur@gmail.com>
pkgname=osxcross-git
_pkgname=${pkgname%-git}
pkgver=0.15
pkgrel=1
pkgdesc="OS X cross toolchain for Linux, FreeBSD and NetBSD"
arch=('x86_64')
url="https://github.com/tpoechtrager/osxcross"
license=('MIT')
depends=()
makedepends=('clang>=3.2' 'patch' 'libxml2' 'bash')
optdepends=(
	'llvm: for Link Time Optimization support and ld64 -bitcode_bundle support'
	'uuid: for ld64 -random_uuid support'
	'xar: for ld64 -bitcode_bundle support'
)
provides=("$_pkgname" "xar")
conflicts=("$_pkgname" "xar")
source=('git+https://github.com/tpoechtrager/osxcross.git' 'https://s3.dockerproject.org/darwin/v2/MacOSX10.11.sdk.tar.xz')
md5sums=('SKIP' 'b0d81b95746c7e698c39c7df1e15ca7d')
noextract=('MacOSX10.11.sdk.tar.xz')
options=('!strip')
install="$pkgname.install"

prepare() {
	cd "$srcdir/$_pkgname"
	mv ../MacOSX10.11.sdk.tar.xz tarballs/
}

build() {
	# swy: use almost all available processor cores, for compiling speed. Leave a spare one.
	cd "$srcdir/$_pkgname"
	JOBS=$(( `nproc` - 1 )) UNATTENDED=yes OSX_VERSION_MIN=10.6  ./build.sh # OCDEBUG=1
}

package() {
	cd "$srcdir/$_pkgname"

	# swy: put all the generated files in there
	mkdir -p $pkgdir/usr/local
	mv target $pkgdir/usr/local/osx-ndk-x86

	# swy: make sure the cross-compiled binaries can locate the .so dependencies stored aside in every
	#      case without having to set funky environment variables or patching the .elf RUNPATH
	mkdir -p $pkgdir/etc/ld.so.conf.d/
	echo '/usr/local/osx-ndk-x86/lib' > $pkgdir/etc/ld.so.conf.d/osxcross.conf
}