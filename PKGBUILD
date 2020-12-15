# Maintainer: Will Foran <will.foran+aur@gmail.com>
pkgname=r-tech1-git
pkgver=r1603.df3f5f8e
pkgrel=2
pkgdesc="low level libraries C++ wrappers for game development"
arch=('x86_64')
url="https://github.com/kazzmir/r-tech1"
license=('BSD')
groups=()
depends=('freetype2' 'allegro')
makedepends=('git' 'scons' 'python2-scons')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('r-tech1::git+https://github.com/kazzmir/r-tech1.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
   # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


build() {
	cd "$srcdir/${pkgname%-git}"
   # include freetype2
   sed -i -e "24 s:$:\nenv.Append(CPPPATH = ['/usr/include/freetype2']):" SConscript

   export CPPPATH="$CPPPATH:/usr/include/freetype2"
   python2 $(which scons)
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
   export PREFIX=$pkgdir/
   python2 $(which scons) install
   mkdir $pkgdir/usr/
   mv $pkgdir/lib $pkgdir/usr/
}
