# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ryancswallace
_gitname=Jobman
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A daemon-less command line job manager with flexible support for retries, timeouts, logging, notifications, and more..."

pkgver=1.9.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_appname}-agent")
conflicts=("${pkgname%-bin}")

optdepends=('jobman-diagnose' 'jobman-control')

options=('!strip')

backup=("etc/${_appname}/${_appname}.yml")

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('5ffc28312011fa9a54bea23ec8f3bc5f8bf643b61e2a31d336ce8c726e4b9e3f')
sha256sums_i686=('fcc412dcdca858b024234925bc923f9d873c4e736bf021be1520bbf9b18f88cb')
sha256sums_aarch64=('0f6d1495d05abaf6175ade716ca12cca0347cf440f58c221a253aa476917f712')


prepare() {
	cd "${srcdir}/" || exit

	mv THIRD_PARTY_NOTICES.md THIRD_PARTY_NOTICES
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${provides[@]} -t "${pkgdir}/usr/bin/"

	install -Dm644 etc/${_appname}/${_appname}.yml "${pkgdir}/etc/${_appname}/${_appname}.yml"

	install -D -m644 docs/completions/bash/${_appname} "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -D -m644 docs/completions/zsh/_${_appname} "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	for man in docs/manpage/*.1; do
		install -Dm644 ${man} "${pkgdir}/usr/share/man/man1/$(basename ${man})"
	done

	install -Dm644 assets/*svg -t "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 docs/design/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 THIRD_PARTY_NOTICES -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
