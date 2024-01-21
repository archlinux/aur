# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-qt
_app_id=net.davidotek.pupgui2
pkgver=2.9.1
pkgrel=1
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
arch=('any')
url="https://davidotek.github.io/protonup-qt"
license=('GPL-3.0-or-later')
depends=(
  'pyside6'
  'python-inputs'
  'python-psutil'
  'python-pyaml'
  'python-pyxdg'
  'python-requests'
  'python-steam'
  'python-vdf'
  'python-zstandard'
  'qt6-tools'
)
makedepends=(
 'python-build'
 'python-installer'
 'python-setuptools'
 'python-wheel'
 )
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=(
  'dosbox: required for Boxtron'
  'git: required for SteamTinkerLaunch'
  'inotify-tools: required for Boxtron & Roberta'
  'scummvm: required for Roberta'
  'timidity++: required for Boxtron'
  'unzip: required for SteamTinkerLaunch'
  'wget: required for SteamTinkerLaunch'
  'xdotool: required for SteamTinkerLaunch'
  'xorg-xprop: required for SteamTinkerLaunch'
  'xorg-xrandr: required for SteamTinkerLaunch'
  'xorg-xwininfo: required for SteamTinkerLaunch'
  'xxd: required for SteamTinkerLaunch'
  'yad: required for SteamTinkerLaunch'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidoTek/ProtonUp-Qt/archive/refs/tags/v$pkgver.tar.gz"
        "${_app_id}.sh")
sha256sums=('5fecede9e710f5be544d8f18b0f44072bc247177aa3bd81eed194e232cad9bf3'
            '732fd88026a801d64ffb85c98c1bc53536100524cced87ab86a112d83de07c1f')

prepare() {
  cd "ProtonUp-Qt-$pkgver"
}

build() {
  cd "ProtonUp-Qt-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "ProtonUp-Qt-$pkgver"
  appstream-util validate-relax --nonet "share/metainfo/${_app_id}.appdata.xml"
  desktop-file-validate "share/applications/${_app_id}.desktop"
}

package() {
  cd "ProtonUp-Qt-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -r share "$pkgdir/usr/"

  install -Dm755 "$srcdir/${_app_id}.sh" "$pkgdir/usr/bin/${_app_id}"
  ln -s /usr/bin/${_app_id} "$pkgdir/usr/bin/$pkgname"
}
