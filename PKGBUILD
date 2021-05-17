pkgname=fluxgui-git
pkgver=v1.2.0.r16.gc80145d
pkgrel=1
pkgdesc='Better lighting for Linux. Open source GUI for xflux'
arch=(any)
url='https://github.com/xflux-gui/fluxgui'
license=(MIT)
# provides=(xflux-gui=$pkgver)
# conflicts=(xflux-gui)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=(
hicolor-icon-theme
python-pexpect
# python2-gconf
xflux
libindicator-gtk2
# python2-libappindicator
libappindicator-gtk3
python-xdg
)
makedepends=(git)
source=("git+$url.git")
md5sums=('SKIP')

pkgver(){
  cd ${pkgname%-git}
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
  cd ${pkgname%-git}
  python setup.py build
}
package(){
  cd ${pkgname%-git}
  python setup.py build
  python setup.py install --root="$pkgdir"
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
