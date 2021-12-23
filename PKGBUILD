# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo-git
pkgver=8.1
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=('git://git.kraxel.org/drminfo')
sha256sums=('SKIP')
depends=('libdrm' 'mesa' 'libepoxy' 'pixman' 'gtk3')
makedepends=('meson')
checkdepends=('python-avocado')
conflicts=('drminfo')
provides=("drminfo=${pkgver%+*}")

pkgver() {
  cd drminfo
  git describe --long --abbrev=10 | sed 's/^drminfo-//; s/-/./; s/-/+/; s/-/./'
}

build() {
  cd drminfo
  rm -rf build
  meson build --prefix='/usr'
  ninja -C build
}

check() {
  cd drminfo/tests
  avocado run *.py
}

package() {
  cd drminfo
  DESTDIR="${pkgdir}" ninja -C build install

  install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
  pushd "$pkgdir/usr/bin" >/dev/null
  for x in *
  do
    ./$x --complete-bash > "$pkgdir/usr/share/bash-completion/completions/$x"
  done
  popd >/dev/null
}
