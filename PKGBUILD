# Maintainer: milk on freenode
_pkgname=ninjas2
pkgname=${_pkgname}-git
pkgver=r142.ce7d3d2
pkgrel=1
pkgdesc="Ninjas 2 Is Not Just Another Slicer. Standalone, LV2, VST. (unstable!)"
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/rghvdberg/ninjas2"
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
changelog=()
source=(git+https://github.com/rghvdberg/ninjas2)
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
  install -Dm775 ${srcdir}/ninjas2/bin/ninjas2 ${pkgdir}/usr/bin/ninjas2
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -r bin/ninjas2.lv2 ${pkgdir}/usr/lib/lv2/
  install -Dm775 ${srcdir}/ninjas2/bin/ninjas2-vst.so ${pkgdir}/usr/lib/vst/ninjas2-vst.so
}
