# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=navid-m
_gitname=blood
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Performant and expressive shell"

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

install="${_appname}.install"

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "SPECIFICATION-${pkgver}.adoc::${_ghurlraw}/docs/SPECIFICATION.adoc")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('6119158375bcb39a39f76b9f0f57bc78bafcabec2baf7ccbc630ce420b91aa1a'
            '46139ac971e64e4a0f68d229f667df9269c07d49cf9247c99fd15d58c269cff6')
sha256sums_x86_64=('2d63a22e1d6436786bdcc8eceb2fb80fcf021698a2574cf3dc78b223756ab0ac')
sha256sums_aarch64=('49686ea77adee8049f93f00f2efc757836a8f3ac08d0f77ca2941d9459cb5c13')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /samples && git checkout

	sed -i '1s/^/#!\/usr\/bin\/env blood\n\n/' samples/*.bx && chmod +x samples/*.bx
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rfa git/samples "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "SPECIFICATION-${pkgver}.adoc" "${pkgdir}/usr/share/doc/${pkgname}/SPECIFICATION.adoc"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
