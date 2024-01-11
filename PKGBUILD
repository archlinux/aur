# Maintainer: Doclic <doclic@tutanota.com>

pkgname=vtex2-git
pkgver=0.1.r96.1231f86
pkgrel=1
pkgdesc="A VTF conversion and creation tool"
arch=(i686 x86_64 aarch64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('glibc' 'gcc-libs' 'qt6-base')
makedepends=('cmake' 'git')
provides=(vtex2)
conflicts=(vtex2)
source=("git+https://github.com/StrataSource/vtex2.git"
       "vtflib::git+https://github.com/StrataSource/VTFLib.git"
       "fmtlib::git+https://github.com/fmtlib/fmt.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/vtex2"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/vtex2"
   git submodule init
   for submodule in {vtflib,fmtlib};
   do
       git config submodule.external/$submodule.url "$srcdir/$submodule"
   done
   git -c protocol.file.allow=always submodule update
}

build() {
   cd "$srcdir"
   cmake -B build \
   -S vtex2 \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DBUILD_GUI=1
   
   cmake --build build
}

package() {
   cd "$srcdir"
   DESTDIR="$pkgdir" cmake --install build
   install -Dm644 "$srcdir/vtex2/LICENSE" "$pkgdir/usr/share/licenses/vtex2-git/LICENSE"
}
