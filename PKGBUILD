# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

_pkgname=vocal
pkgname=$_pkgname-git
pkgver=2.0.5beta.r16.gc1578ed
pkgrel=1
pkgdesc='Podcast Client for the Modern Desktop'
arch=('i686' 'x86_64')
url='http://www.vocalproject.net'
license=('GPL3')
depends=('libnotify' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite' 'clutter-gtk' 'clutter-gst' 'webkit2gtk')
makedepends=('git' 'vala' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git://github.com/vocalapp/vocal.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/$v//;s/-beta/beta/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  [[ -d build ]] || mkdir -p build

  # use newer version of webkit2gtk
  sed -i 's/webkit2gtk-3.0/webkit2gtk-4.0/g' CMakeLists.txt
}

build() {
  cd $_pkgname/build/

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install
}
