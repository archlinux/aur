# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=ghost-dl-git
pkgver=v1.1.3.0.gd79199c
pkgrel=1
pkgdesc="Kingdom Hearts Insider Game OST Archive Dowloader CLI"
arch=('x86_64')
url="https://github.com/TheElevatedOne/ghost-dl"
license=('GPL3')
depends=('glibc' 'gcc' 'python' 'python-pip')
options=('!debug' '!strip')
makedepends=(
  'git'
  'clang'
  'patchelf'
  'ccache'
)
provides=(ghost-dl-git)
conflicts=(ghost-dl-bin)
source=("git+https://github.com/TheElevatedOne/ghost-dl.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd ghost-dl
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd ..
}

build() {
  set -e
  cd ghost-dl
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  pip install nuitka
  if ! ls build; then mkdir build; fi
  python -m nuitka --onefile --follow-imports --main=ghost_dl.py --output-dir=build --output-filename=ghost-dl
  deactivate
  rm -rf venv
  rm -rf build/ghost_dl.build build/ghost_dl.dist build/ghost_dl.onefile-build
  cd ..
}

package() {
  set -e
  cd ghost-dl

  install -Dm755 build/ghost-dl "$pkgdir/usr/bin/ghost-dl"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
