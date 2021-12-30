# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=grume
pkgname="${_pkgname}-git"
pkgver=r2540.b1062dea
pkgrel=1
pkgdesc='A 3D Action RPG by Paul Wortmann.'
arch=('x86_64')
url="https://github.com/Paul-Wortmann/grume"
license=('GPL2')
depends=("assimp" "glfw" "glm" "openal" "mesa" "physfs" "libvorbis")
source=("git+https://github.com/Paul-Wortmann/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
  cmake .
  make
}

package() {
	cd "${_pkgname}"
  mkdir -p ${pkgdir}/usr/bin/
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/share/games/${_pkgname}/${_pkgname}"
  cp -r "data" "${pkgdir}/usr/share/games/${_pkgname}/"
  find "${pkgdir}/usr/share/games/${_pkgname}/data/" -type f -exec chmod 644 {} \;
  chmod 666 "${pkgdir}/usr/share/games/${_pkgname}/data/config.txt"
  mkdir -m777 "${pkgdir}/usr/share/games/${_pkgname}/save"
  echo -e "#!/bin/sh\ncd /usr/share/games/${_pkgname}\n./${_pkgname} \$@" > ${pkgdir}/usr/bin/${_pkgname} 
  chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
