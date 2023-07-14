# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=mozregression-gui
pkgver=5.5.0
pkgrel=1
pkgdesc='Regression range finder for Firefox'
arch=('any')
license=(MPL)
url="https://github.com/mozilla/mozregression"
conflicts=("mozregression-gui-bin")
depends=('libxcb' 'libxkbcommon-x11' 'libglvnd' 'gtk3' 'python')
makedepends=('python-pip' 'python-virtualenv' 'git')
options=('!strip')
source=("git+https://github.com/mozilla/mozregression.git#tag=$pkgver"
        "mozregression-gui.desktop")
sha256sums=('SKIP'
            '0b51e2692ef75addd98365185ff05524426ca1735f43d6b1cafa0e71d71481cb')

build() {
  cd mozregression || exit
  python -m venv env
  source env/bin/activate
  PIP_CONFIG_FILE=/dev/null pip install --isolated --ignore-installed --no-deps -r requirements/requirements-3.11-Linux.txt
  PIP_CONFIG_FILE=/dev/null pip install --isolated -e .
  python gui/build.py bundle
}

package() {
  cd mozregression || exit
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt/mozregression-gui}
  cp -r ./gui/dist/* "${pkgdir}"/opt/
  ln -s "/opt/${pkgname}/${pkgname}" \
        "$pkgdir/usr/bin/${pkgname}"
  install -m644 "${srcdir}"/mozregression-gui.desktop "${pkgdir}"/usr/share/applications/
  install -m644 ./gui/icons/app_icon.png "${pkgdir}"/usr/share/pixmaps/mozregression-gui.png
}
