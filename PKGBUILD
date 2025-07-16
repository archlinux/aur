# Maintainer: plasmaofthedawn <plasmaofthedawn@gmail.com>

pkgname='fcitx5-toki-pona-git'
_pkgname='fcitx5-toki-pona'
pkgver=r5.b001947
pkgrel=1
pkgdesc="fcitx5 for writing various toki pona logographs"
arch=(any)
url="https://github.com/plasmaofthedawn/fcitx5-toki-pona"
license=('MIT')
depends=('fcitx5')
makedepends=('python' 'libime' 'git')
conflicts=(${_pkgname})
source=("${_pkgname}::git+https://github.com/plasmaofthedawn/fcitx5-toki-pona.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    cd "$_pkgname"
    
    python3 combine.py
}

package() {
    cd "$_pkgname"

    for file in table/*; do
      install -Dm644 -t "${pkgdir}"/usr/share/fcitx5/table/ $file
    done

    for file in confs/*; do 
      install -Dm644 -t "${pkgdir}"/usr/share/fcitx5/inputmethod/ $file
    done

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/ LICENSE

}
