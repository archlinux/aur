# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dkron-io
_gitname=dkron
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Distributed, fault tolerant job scheduling system"

pkgver=4.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://dkron.io'

license=('LGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

backup=("etc/${_appname}/${_appname}.yml")

source=("CONFIG-${pkgver}.yml::${_ghurlraw}/builder/files/${_appname}.yml"
		"SERVICE-${pkgver}.service::${_ghurlraw}/builder/files/${_appname}.service")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('16e2582c09b22c23e2aa479f7aea410c8d092f56a288144d75fd8b88fd95da35'
            '6aa819ebd51f6ac1c327e9c2fb7c48e692ea8f0b592c359d27e1b24633be775b')
sha256sums_x86_64=('4db3c62df8fbf4789b7df8d6ca12c58926d91b78a2601a3df5480b327fb8eb1c')
sha256sums_aarch64=('9115e55f0becb0a2da8aa8d5728847f370a7d7e866cc0bc8b20b85130f369316')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${_appname} "${pkgdir}/usr/bin/${_appname}"

	for executor in ${_appname}-executor-*; do
		install -Dm755 ${executor} "${pkgdir}/usr/bin/${executor}"
	done

	for processor in ${_appname}-processor-*; do
		install -Dm755 ${processor} "${pkgdir}/usr/bin/${processor}"
	done

	install -Dm644 CONFIG-${pkgver}.yml "${pkgdir}/etc/${_appname}/${_appname}.yml"

	install -Dm644 SERVICE-${pkgver}.service "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
