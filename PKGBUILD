# Maintainer: milk on freenode
_pkgname=ninjas
pkgname=${_pkgname}-git
pkgver=r252.089b776
pkgrel=1
pkgdesc="Ninjas Is Not Just Another Slicer. Standalone, LV2, VST. Undeveloped; see instead ninjas2-git."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/rghvdberg/ninjas"
license=('custom')
groups=()
depends=('mesa' 'xorg-server' 'libsndfile' 'libsamplerate')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(git+https://github.com/rghvdberg/ninjas)
noextract=()
md5sums=('SKIP')

pkgver()
{
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# check()
# {
  # cd "$_pkgname"
# }

prepare()
{
  cd "$_pkgname"
  git submodule init && git submodule update --recursive
  make
}

package() {
  cd ${_pkgname}
  install -Dm775 ${srcdir}/ninjas/bin/ninjas ${pkgdir}/usr/bin/ninjas
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -r bin/ninjas.lv2 ${pkgdir}/usr/lib/lv2/
  install -Dm775 ${srcdir}/ninjas/bin/ninjas-vst.so ${pkgdir}/usr/lib/vst/ninjas-vst.so
}
