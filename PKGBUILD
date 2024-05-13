# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=manga-ocr-git
_gitname=${pkgname%-git}
pkgver=0.1.11.r0.g1a3ffca
pkgrel=2

pkgdesc="Optical character recognition for Japanese text focused on manga"
url="https://github.com/kha-white/manga-ocr"
license=(Apache-2.0)
arch=(x86_64)

depends=(
  python
  python-fire
  python-fugashi
  python-jaconv
  python-loguru
  python-numpy
  python-pillow
  python-pyperclip
  python-pytorch
  python-transformers
  python-unidic-lite
)
makedepends=(
  git
  python-setuptools
)
optdepends=(
  "wl-clipboard: Read images from the clipboard in the command-line mode on Wayland"
  "xclip: Read images from the clipbaord in the command-line mode on X11"
)
checkdepends=(python-pytest)

provides=("manga-ocr=$pkgver")
conflicts=(manga-ocr)

source=(
  "git+$url.git#branch=master"
  "skip-example-run-on-boot.patch"
)
b2sums=('SKIP'
        '80d608d0c474839113cf36f35a2984f819e4a62cb5a2e4915cb9798461a14772ddbfa4ebf4a633047393eadaae9c8106850d7c1e4ad6356f02c8be101a288195')

prepare() {
  cd "$_gitname"
  patch --forward --strip=0 --input=../skip-example-run-on-boot.patch
}

pkgver(){
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  python setup.py build
}

check() {
  cd "$_gitname"
  pytest
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
