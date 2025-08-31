# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=dl-desktop-git
_pkgname=dl-desktop
pkgver=r259.0275138
pkgrel=1
pkgdesc="Desktop client for Duolingo, using Electron"
arch=(x86_64)
url="https://github.com/hmlendea/dl-desktop"
license=('GPL')
depends=('gtk2' 'libxss' 'nss' 'nspr' 'libxtst' 'alsa-lib')
makedepends=('npm' 'git')
source=("git+https://github.com/hmlendea/dl-desktop")
md5sums=("SKIP")

pkgver() {
  cd "dl-desktop"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}



build() {
	cd ${srcdir}/${_pkgname}
	npm install
	npm run build -- --dir
}

package() {
	cd ${srcdir}/${_pkgname}

	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/dist/linux-unpacked/." "${pkgdir}/opt/${_pkgname}"

	chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -d "${pkgdir}/usr/share/applications"
	mv ro.go.hmlendea.DL-Desktop.desktop dl-desktop.desktop
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
	install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/ro.go.hmlendea.DL-Desktop.png"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"	
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"	
}
