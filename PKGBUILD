# Contributor: Sickhate
# Contributor: KittyKatt <kittykatt AT silverirc.com>
# Contributor: UnCO <undercooled AT lavabit com>
pkgname='pekwm-git'
_pkgname='pekwm'
pkgver=20140418.933
pkgrel=1
pkgdesc="A small, fast, functional, and flexible window manager - GIT Version"
url="http://pekwm.org/"
arch=('i686' 'x86_64')
depends=('libjpeg' 'libpng' 'libxft' 'libxinerama' 'libxpm' 'libxrandr' 'gcc-libs')
makedepends=('git')
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname-svn" "$_pkgname")
source=("$_pkgname::git+http://projects.pekdon.net/git/pekwm.git"
        'harbour-no-border.patch')
md5sums=('SKIP'
         '74c74a53743dab90e605eb73e0579528')

pkgver() {
  cd "$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "${srcdir}/$_pkgname"
  sed -i 's/libpng12/libpng/g' configure.ac
  ./autogen.sh
  # Default settings:
  #    --enable-shape --enable-menus \
  #    --disable-pcre --disable-debug  \
  #    --enable-xft --enable-image-xpm --enable-image-jpeg \
  #    --enable-image-png --enable-xrandr
  ./configure --prefix=/usr --sysconfdir=/etc
  # Harbour without border
  patch -p1 -i "$srcdir"/harbour-no-border.patch
  make
}

package() {
  cd "${srcdir}/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
