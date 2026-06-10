# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=zapzap-git
_pkgname=com.rtosta.zapzap
pkgver=6.5.1.r0.gb9cfa79
pkgrel=1
pkgdesc="WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine"
arch=('x86_64')
url="https://github.com/rafatosta/${pkgname%-git}"
license=('GPL3')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel' 'desktop-file-utils')
optdepends=(
	'hunspell: spell check'
	)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'com.rtosta.zapzap.nogpu.desktop')
b2sums=('SKIP'
        '35b0bad1219847bfc5a346e4d5006888d25dbeeef6c87c0c644d4b5db411a4137c3473d173409122802f5986ccbbd342e7180c487bf065f772c4773c4da7efea')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 "$srcdir"/com.rtosta.zapzap.nogpu.desktop "$pkgdir"/usr/share/applications/
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
