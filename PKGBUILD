# Maintainer: Otakar Jasek <jasek dot ota at gmail dot com>

pkgname=python-pyneapple-git
_pkgname="${pkgname#python-%-git}"
pkgver=r88.00643fe
pkgrel=1
pkgdesc="Interactive literate coding notebook in GTK"
arch=(any)
url="https://github.com/darthoctopus/pyneapple"
license=('GPL')
depends=('python' 'python-gobject' 'jupyter-notebook' 'python-setproctitle' 'xdg-utils' 'webkit2gtk')
makedepends=('git' 'xdg-utils')
options=(!emptydirs)
source=($_pkgname::git+https://github.com/darthoctopus/pyneapple.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
  sed -i "s/Name=p/Name=P/g" extras/pyneapple.desktop
  sed -i "s/Exec=.*/Exec=pyneapple %U/g" extras/pyneapple.desktop
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-desktop-menu install --noupdate --novendor extras/pyneapple.desktop
  XDG_DATA_DIRS="$pkgdir/usr/share" xdg-icon-resource install --size 256 --novendor --noupdate extras/pyneapple.png
}
