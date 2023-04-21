# Maintainer: Nikarh <nikolajs.arhipovs@gmail.com>
pkgname=psvita-sdk-extra-packages
pkgver=1
pkgrel=1
pkgdesc="PS vita homebrew sdk with gl4es support"
arch=('i686' 'x86_64')
url="https://vitasdk.org/"
license=('GPL2')
options=(!strip)
depends=(
  'pacman>5'
  'git'
)
makedepends=(
  'curl'
)

source=("sudo-fix.patch" "git+https://github.com/vitasdk/vdpm" "git+https://github.com/nikarh/vita-packages-extra")
md5sums=('1213c1c23d734af92553ac8801443d36'
         'SKIP'
         'SKIP')

prepare() {
    cd "vdpm"
    patch --forward --strip=1 --input="${srcdir}/sudo-fix.patch"
}

build() {
  export VITASDK=$pkgdir/opt/vitasdk
  cd "vdpm"
  ./bootstrap-vitasdk.sh

  find -name VITABUILD | while read line; do
    (
      cd "$(dirname $line)"
      "$VITASDK/bin/vita-makepkg" --install
    )
  done
}

package() {
  export VITASDK=$pkgdir/opt/vitasdk

  cd "vdpm"
  ./install-all.sh
}
