# Maintainer: X0rg

_gitname=darling
pkgbase=$_gitname-git
pkgname=('darling-git' 'darling-mach-dkms-git')
pkgver=r1861.099fdc03
pkgrel=1
pkgdesc="A Darwin/OS X emulation layer for Linux"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
install=$pkgname.install
groups=('darling-git')
depends=('xz' 'fuse' 'libxml2' 'icu' 'openssl' 'bzip2' 'zlib' 'libsystemd'
	'wget' 'curl' 'sqlite' 'ruby' 'sed' 'libarchive' 'file' 'python' 'gawk' 'libunwind') # namcap complains about them
depends_x86_64=('lib32-clang' 'lib32-bzip2' 'lib32-systemd' 'lib32-libxslt')
makedepends=('git' 'cmake' 'clang' 'bison' 'flex' 'binutils>=2.28')
makedepends_x86_64=('gcc-multilib')
source=('git+https://github.com/darlinghq/darling.git'
	'dkms.conf')
md5sums=('SKIP'
         '2a499e6cc4a31323d82a56a2c6ccab0d')
options=('!buildflags')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	msg2 "Initialize git submodules..."
	sed -i 's|url = ../|url = https://github.com/darlinghq/|g' .gitmodules
	git submodule update --init --recursive

	#msg2 "Forbid libexec use..."
	#sed -i 's|${CMAKE_INSTALL_PREFIX}/libexec/darling|${CMAKE_INSTALL_PREFIX}/share/darling/prefix|g' src/darling-config.h.in
	#find . -name CMakeLists.txt -exec sed -i 's|libexec/darling|${CMAKE_INSTALL_PREFIX}/share/darling/prefix|g' {} \;

	msg2 "Make build directory..."
	mkdir -pv "build"
}

build() {
	cd "$srcdir/$_gitname/build"
	msg2 "Run 'cmake'..."
	cmake .. -DCMAKE_TOOLCHAIN_FILE=../Toolchain.cmake -DCMAKE_INSTALL_PREFIX=/usr
	msg2 "Run 'make'..."
	make
	msg2 "Run 'make lkm'..."
	make lkm
}

package_darling-git() {
	depends=('darling-mach-dkms-git')
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir" install
	install -Dvm755 "$srcdir/$_gitname/src/setup-ld-so.sh" "$pkgdir/usr/bin/darling-setup-ld-so"
}

package_darling-mach-dkms-git() {
	depends=('dkms')
	optdepends=('linux-headers: build modules against the Arch kernel'
	            'linux-lts-headers: build modules against the LTS kernel'
	            'linux-zen-headers: build modules against the ZEN kernel'
	            'linux-grsec-headers: build modules against the GRSEC kernel')
	_srcdest="$pkgdir/usr/src/darling-mach-$pkgver"

	msg2 "Install module sources for DKMS..."
	install -dm755 $(dirname "$_srcdest")
	cp -r "$srcdir/$_gitname/src/lkm"       "$_srcdest"
	cp -r "$srcdir/$_gitname/build/src/lkm" "$_srcdest/migdir"

	msg2 "Set configuration for DKMS..."
	install -Dm644 "$srcdir/dkms.conf"      "$_srcdest"
	sed -i "s|@PKGVER@|$pkgver|g"           "$_srcdest/dkms.conf"
	sed -i "s|@SRCDEST@|$_srcdest|g"        "$_srcdest/dkms.conf"
}
