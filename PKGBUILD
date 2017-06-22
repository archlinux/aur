# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=kwin-scripts-tiling-git
_gitname=${pkgname%-git}
_pkgname=${_gitname/scripts/script}
pkgver=r372.676b74d
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://github.com/faho/kwin-tiling.git"
license=('GPL')
depends=('kwin')
makedepends=('plasma-framework')
provides=("$_gitname")
conflicts=("$_gitname")
source=("$_gitname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/pkg"
  cd "${srcdir}/${_gitname}"

  # Tell plasmapkg2 to do an upgrade if we've built this package before
  # Otherwise tell it to install as normal
  if [ -d "${srcdir}/pkg/.local/share/kwin/scripts/kwin-script-tiling" ]
  then
    FLAGS=-u
  else
    FLAGS=-i
  fi

  HOME=${srcdir}/pkg plasmapkg2 --type kwinscript $FLAGS .
}

package() {
  cd "${srcdir}/${_gitname}"
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -ra "${srcdir}/pkg/.local/share/kwin/scripts/kwin-script-tiling/." "${pkgdir}/usr/share/kwin/scripts/${_pkgname}/"
  install -Dm644 ./metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
