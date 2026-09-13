# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=jsonize
_appname=jz
pkgname=${_gitname}-bin
pkgdesc="Turn command output into JSON"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

_pkgsrc="${_gitname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${url}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${url}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${url}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
sha256sums=('8c1df1c0d6ed05fabb6582e0512bd7802e4335f45219759ff60b88141400913b')
sha256sums_x86_64=('2d3b8da69be0097c299c90502e6381dd912ed1119485a43ea3dda5455d03b751')
sha256sums_aarch64=('cff78c4f939e19d24cb029abc281273c089ef4adb75ccf908137f55055eeb45a')


verify() {
	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_pkgsrc//-/_}_${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_pkgsrc//-/_}_${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
