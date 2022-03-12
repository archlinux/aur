# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=camotics-git
pkgver=r952.ac722dd
pkgrel=1
pkgdesc="3-axis NC machining simulation software"
arch=('x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=(
  'v8-r'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'git'
  'scons'
  'python-six'
  'qt5-tools'
  'cbang-git'
)
provides=('camotics')
conflicts=('camotics')
_commit="master"
source=(
  "${pkgname%-*}::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git#commit=$_commit"
  "0001_config_qt.patch"
)
sha256sums=('SKIP'
            '0612d74ac26a00c21dd924bb92c2cc94f53168702cb870625d0711904556f487')

pkgver() {
	cd "${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-*}"
	patch -p1 -i "../0001_config_qt.patch"
}

build() {
  cd "${pkgname%-*}"
  mkdir -p build
  CBANG_HOME=/opt/cbang scons cxxstd="c++14" linkflags=$LDFLAGS
}

package() {
  cd "${pkgname%-*}"
  CBANG_HOME=/opt/cbang scons install cxxstd="c++14" install_prefix="$pkgdir/usr" linkflags=$LDFLAGS
  
  install -d "$pkgdir/usr/share/${pkgname%-*}"/tpl_lib
  cp -a tpl_lib/ "$pkgdir/usr/share/${pkgname%-*}"
  install -Dm644 -t "$pkgdir"/usr/share/applications CAMotics.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps images/camotics.png
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-*}" README.md CHANGELOG.md COPYING LICENSE

  # install examples and machines
  install -d "$pkgdir/usr/share/doc/${pkgname%-*}"/{examples,machines}
  cp -a {examples/,machines/} "$pkgdir/usr/share/doc/${pkgname%-*}"
}

# vim:set ts=2 sw=2 et:
