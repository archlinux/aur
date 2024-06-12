# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate-gui
_name=argostranslategui
pkgver=1.6.5
pkgrel=3
pkgdesc="Graphical user interface for Argos Translate"
arch=('any')
url="https://www.argosopentech.com"
license=('MIT')
depends=(
  'argos-translate'
  'python-pyqt5'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
_commit=06aafde3faf1709080471c94914382a566f6f775  # 1.6.5
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/argosopentech/argos-translate-gui/${_commit}/requirements.txt"
        'argos-translate.desktop'
        'argos-translate.png')
sha256sums=('442362f1dbdaf04ed340fcf464d03c5277c919dbfc80085e2d87f66c25c29905'
            '898adb5dbf071be73b8bd42d48a855085e28bfb5c204f5f6e10908b4197508ef'
            'e0b55ff51c34d8b170aa7b459efc1d69931a2726d7bc8d2cf8c09c916489f3e3'
            '634c076d02a175109d4190aa9b816fedf4ec25b0985a4c1eeafc730dece69e65')

prepare() {
  cd "$_name-$pkgver"
  cp -f "$srcdir/requirements.txt" .

  # py2app only for Mac
  sed -i '/py2app"/d' setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/argos-translate.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "$srcdir/argos-translate.desktop" -t "$pkgdir/usr/share/applications/"
}
