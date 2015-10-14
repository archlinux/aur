# Maintainer: Your Name <youremail@domain.com>
pkgname=ardoise-git
pkgver=0.4.0.0.r8.g03b1ab1
pkgrel=1
epoch=1
pkgdesc="Unlimited drawing surface for quick diagrams and notes"
arch=('i686' 'x86_64')
url="http://ardoise.leo-flaventin.com"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=(${pkgname%-VCS}'::git+https://github.com/hl037/ardoise.git'
        'git+https://github.com/hl037/ljsoncppp.git'
)

noextract=()
md5sums=('SKIP' 'SKIP')

prepare() {
  cd ${pkgname%-VCS}
  git submodule init
  git config submodule.json.url $srcdir/ljsoncppp
  git submodule update
}

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
   printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
   if test "$CARCH" == i686 ;
      then
      SPEC="linux-g++-32"
   else
      if test "$CARCH" == x86_64
      then
         SPEC="linux-g++-64"
      else
         echo "unknown architecture"
         exit 1
      fi
   fi

   BUILD="$srcdir/build"
   mkdir -p "$BUILD"
   cd "$BUILD"
   lrelease-qt5 "$srcdir/${pkgname%-VCS}/ardoise.pro"
   qmake-qt5 "$srcdir/${pkgname%-VCS}/ardoise.pro" -r -spec $SPEC
   make -w
}

package() {
   BUILD="$srcdir/build"
   cd "$BUILD"
   install -d "$pkgdir/usr/bin" || return 1
   install -Dm755 ardoise "$pkgdir/usr/bin" || return 1
	cd "$srcdir/${pkgname%-VCS}"
   install -d "$pkgdir/usr/share/icons" || return 1
   install -Dm755 erase.png "$pkgdir/usr/share/icons/ardoise.png" || return 1
   cd linux
   install -d "$pkgdir/usr/share/applications" || return 1
   install -Dm755 ardoise.desktop "$pkgdir/usr/share/applications" || return 1
}
