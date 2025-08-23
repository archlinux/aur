# Maintainer: Jorge Pizarro-Callejas <jpizarrocallejas@gmail.com>
pkgname=protonup-qt-git
_app_id=net.davidotek.pupgui2
_pkgname="ProtonUp-Qt"
pkgver=2.13.0.r7.gf881e4c
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
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
source=("git+https://github.com/DavidoTek/$_pkgname")
sha256sums=('SKIP')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} ${pkgname%-git}-bin)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname"
  appstreamcli validate --no-net "share/metainfo/${_app_id}.appdata.xml"
  desktop-file-validate "share/applications/${_app_id}.desktop"
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -r share "$pkgdir/usr/"

  ln -s "/usr/bin/${pkgname%-git}" "$pkgdir/usr/bin/${_app_id}"
}
