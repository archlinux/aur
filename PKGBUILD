# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dwm-distrotube-git
pkgver=.r10.db0af66
pkgrel=1
pkgdesc="A heavily-patched and customized build of dwm from DistroTube."
arch=(x86_64 i686)
url="https://gitlab.com/dwt1/dwm-distrotube.git"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft freetype2 st dmenu)
makedepends=(make)
checkdepends=()
optdepends=(nerd-fonts-complete ttf-symbola)
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd dwm-distrotube
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm-distrotube  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-distrotube/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwm-distrotube/README.md"
  install -Dm644 "${srcdir}/dwm-distrotube/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

