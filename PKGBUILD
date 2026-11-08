# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ryancswallace
_gitname=Jobman-Control
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Shared PostgreSQL-backed control plane for Jobman."

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('jobman')

options=('!strip')

backup=("etc/${_appname}/${_appname}.env")

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('003c9d81bd05f7753f36bc6ffdea7fc81e783c47ce532a5c88730c464c9619bc')
sha256sums_i686=('785f19a4f3984a33a81a9da99cd3a645ce68abe0d1c91953a10565ed4ac3c8d7')
sha256sums_aarch64=('605af6ac2047fae47e22347c9158acc20abbedf1774bbb154e13f2301f8938aa')


prepare() {
	cd "${srcdir}/" || exit

	mv THIRD_PARTY_NOTICES.md THIRD_PARTY_NOTICES
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${provides[@]} -t "${pkgdir}/usr/bin/"

	install -Dm644 etc/${_appname}/*env* "${pkgdir}/etc/${_appname}/${_appname}.env"

	install -Dm644 etc/${_appname}/*service -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 api/*.yaml -t "${pkgdir}/usr/share/doc/${pkgname}/api/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 THIRD_PARTY_NOTICES -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
