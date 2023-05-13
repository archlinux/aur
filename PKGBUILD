# Maintainer: 
# Contributor: librebob <librebob at protonmail dot com>
pkgname=athenaeum-git
_app_id=com.gitlab.librebob.Athenaeum
pkgver=2.3.2.r0.gb0cd237
pkgrel=1
pkgdesc="A libre replacement for Steam"
arch=('any')
url="https://gitlab.com/librebob/athenaeum"
license=('GPL3')
depends=('flatpak' 'python-dateutil' 'python-numpy' 'python-pyqt5'
         'python-setuptools' 'qt5-graphicaleffects' 'qt5-quickcontrols2'
         'qt5-svg' 'xdg-utils')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm'
             'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/librebob/athenaeum.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  for i in 16 32 48 64 96 128 256 512; do
    install -Dm644 "${pkgname%-git}/resources/icons/hicolor/${i}x${i}/$_app_id.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  install -Dm644 "${pkgname%-git}/resources/$_app_id.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "${pkgname%-git}/resources/$_app_id.appdata.xml" -t \
    "$pkgdir/usr/share/appdata/"
}
