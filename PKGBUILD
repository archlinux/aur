# Maintainer: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)
# Contributor: Ruben De Smet <me at rubdos dot be>

pkgname=rofi-wayland-git
_gitname=rofi
pkgver=1.3.1.r384.g3a29d3ec
pkgrel=3
pkgdesc="Abandoned code base, try the fork \`rofi-lbonn-wayland-git\`"
arch=('i686' 'x86_64')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=(freetype2 libxdg-basedir pango xcb-util-xrm)
optdepends=('sway: use as application runner'
            'wlc-wall-injector: injects wall wayland protocol in wlc based compositors'
            'orbment: use as application runner')
makedepends=('git' 'wayland' 'libxkbcommon' 'xcb-util-wm')
provides=('rofi')
conflicts=('rofi')
source=("git+https://github.com/DaveDavenport/rofi#branch=wip/wayland")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init

  # By default, installs pkg-config file in /usr/local/share/pkgconfig
  # instead of /usr/share/pkgconfig.
  export PKG_CONFIG_PATH=/usr/share/pkgconfig:/usr/local/share/pkgconfig
  autoreconf --install

  # Default compiler = clang, which can be a problem if using hardening-wrapper
  CC=gcc ./configure --prefix=/usr --with-display-backend=wayland
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rofi-wayland-git/COPYING"
  install -dm755 "$pkgdir/usr/share/doc/rofi/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}
