# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=camotics-git
pkgver=r822.8d1c8fb
pkgrel=1
pkgdesc="Open-Source Simulation & Computer Aided Machining"
arch=('x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=(
  'v8-3.14'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'git'
  'scons'
  'python2-six'
  'qt5-tools'
  'cbang-git'
)
provides=('camotics')
conflicts=('camotics')
source=(
  "${pkgname%-*}::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-*}"
  sed -i '24 i env.Append(LINKFLAGS = os.environ.get("LDFLAGS"))' SConstruct
}

build() {
  cd "${pkgname%-*}"
  CBANG_HOME=/opt/cbang scons
}

package() {
  cd "${pkgname%-*}"
  CBANG_HOME=/opt/cbang scons install install_prefix="$pkgdir/usr"
  
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
