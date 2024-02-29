# Maintainer: f4iey <f4iey@f4iey.fr>

pkgname=cwsim-git
pkgver=r105.be867e1
pkgrel=3
pkgdesc="Cross-platform amateur radio WPX CW contest simulator written in python, based on Morse Runner."
arch=('any')
license=('GPL3')
url="https://github.com/w9cf/cwsim"
makedepends=(git)
depends=(
python
python-cffi
python-cycler
python-fonttools
python-kiwisolver
python-matplotlib
python-packaging
python-pillow
python-pycparser
python-pyparsing
python-pyqt6
python-pyqt6-sip
python-dateutil
python-pyxdg
python-six
python-sounddevice
python-numpy
)
source=(
	$pkgname::"git+$url.git"
	cwsim.desktop
	MRunnerIcon.gif
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare(){
    git -C "$srcdir/$pkgname" clean -dfx
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    # Compile UI...
    cd "$srcdir/$pkgname/python"
    pyuic6 -x "cwsimgui.ui" -o "cwsimgui.py" --indent=3
}

package() {
  cd $srcdir/$pkgname/python
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 ./*.py "$pkgdir/opt/$pkgname"
  install -Dm755 ./*.ui "$pkgdir/opt/$pkgname"
  cp -r ./translate "$pkgdir/opt/$pkgname/"
  install -Dm755 "MASTER.SCP" "$pkgdir/opt/$pkgname"
  echo "python /opt/$pkgname/cwsim.py" > "$pkgdir/usr/bin/cwsim"
  chmod 755 "$pkgdir/usr/bin/cwsim"
  # Desktop icon
  install -Dm644 "../../cwsim.desktop" "$pkgdir/usr/share/applications/cwsim.desktop"
  install -Dm644 "../../MRunnerIcon.gif" "$pkgdir/usr/share/pixmaps/MRunnerIcon.gif"
}
