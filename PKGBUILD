# Maintainer: Stefan Dimitrijevic <stefanstele95@hotmail.com>

pkgname='linvam-git'
pkgver=v0.8.3
pkgrel=1
pkgdesc='Linux voice activated macros'
arch=('x86_64')
url='https://github.com/stele95/LinVAM'
license=('GPL3')
makedepends=(
  'python'
  'git'
)
depends=(
  'xorg-xinput'
  'python'
  'python-pyqt6'
  'python-srt'
  'python-requests'
  'python-tqdm'
  'python-sounddevice'
  'python-vosk'
  'ffmpeg'
  'ydotool'
)
provides=(
  'linvam'
  'linvamrun'
)
conflicts=(
  'linvam'
  'linvamrun'
)
source=('git+https://github.com/stele95/LinVAM.git')
sha256sums=('SKIP')
install=linvam.install

pkgver() {
  cd LinVAM
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/LinVAM"
  python setup.py build
}

package_linvam-git() {
  pkgdesc+=' (GIT version)'
  cd "${srcdir}/LinVAM"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install LinVAM.desktop -Dm644 "$pkgdir/usr/share/applications/LinVAM.desktop"
  install linvam/assets/icons/linvam.svg -Dm644 "$pkgdir/usr/share/icons/hicolor/scalable/apps/linvam.svg"
  install LICENSE.txt -Dm644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install rules/12-input-arch.rules -Dm644 "$pkgdir/etc/udev/rules.d/12-input.rules"
  install rules/50-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/50-uinput.rules"
  install rules/80-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
