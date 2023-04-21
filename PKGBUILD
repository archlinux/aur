# Maintainer: Nikarh <nikolajs.arhipovs@gmail.com>
pkgname=psvita-sdk-extra-packages
pkgver=1
pkgrel=1
pkgdesc="PS vita homebrew sdk with gl4es support"
arch=('i686' 'x86_64')
url="https://vitasdk.org/"
license=('GPL2')
options=(!strip)
provides=(psvita-sdk)
conflicts=(psvita-sdk)
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
  rm -rf "$srcdir/pkg/opt/vitasdk"
  export VITASDK=$srcdir/pkg/opt/vitasdk
  export PATH="$VITASDK/bin:$PATH"

  (
    cd "vdpm"
    ./bootstrap-vitasdk.sh
    ./install-all.sh
  )

  (
    cd "vita-packages-extra"
    find -name VITABUILD | while read line; do
      (
        cd "$(dirname $line)"
        "$VITASDK/bin/vita-makepkg" --install
      )
    done
  )
}

package() {
  mv "$srcdir/pkg/opt" "$pkgdir"
}
