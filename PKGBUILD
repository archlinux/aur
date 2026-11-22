# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=navid-m
_gitname=blood
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Performant and expressive shell"

pkgver=0.1.3
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
sha256sums=('a62faa4c2eae1f204fb66adb2e3a502ca21ed4bc4a9cb0fc776cf1f93a31c5bb'
            'd4ccb01624a16b2d9a97f36d7e6ab54b25f52dee30dac101490634e83002f6af')
sha256sums_x86_64=('4da44415c64c1f4bc10cd57c6a617c721bfa13173e719dcad1d44c41cead550f')
sha256sums_aarch64=('191729e83a1f424194174dedc17ebe87d924975fca9dccff35a41e7c31b939e9')


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
