# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dark-Alex-17
_gitname=coyote
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="All-in-one, batteries-included LLM CLI Tool"

pkgver=0.10.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('jq' 'usql' 'docker' 'uv' 'ast-grep' 'duckdb')

options=('!strip')

source=("INTEGRATION-${pkgver}.fish::${_ghurlraw}/scripts/shell-integration/integration.fish"
		"INTEGRATION-${pkgver}.bash::${_ghurlraw}/scripts/shell-integration/integration.bash"
		"INTEGRATION-${pkgver}.zsh::${_ghurlraw}/scripts/shell-integration/integration.zsh"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('164ff98c54fd3842fa51ab014b23bbfbd20e426e0bfdc82a245144b283978c7d'
            '31d7be9837c323843c9ff9ed4a81ea18368f3dd89275887a923f5c16fd21f5eb'
            '8eea4eccb4e6a8a20b96c1b6c58960da93ca9a08f732fc4cfdb812fff86416fd'
            '9e5df042fcd8772063f9916ac2e3d534126945230a4b3be84b486daef2b76cf9'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('2bb020184f3f5507708542745f582a2a29c7635de020e6d9590321408da63aaa')
sha256sums_aarch64=('c6e130c33d7afb9d23fa16d69c4124e806ef7537c74db63a2e6496b5af379edd')

prepare() {
	cd "${srcdir}/" || exit

	mkdir -p "./integrations"

	mv "INTEGRATION-${pkgver}.fish" "./integrations/"
	mv "INTEGRATION-${pkgver}.bash" "./integrations/"
	mv "INTEGRATION-${pkgver}.zsh" "./integrations/"

	mkdir -p "./completions"

	./coyote --completions zsh > "./completions/${_appname}.zsh"
	./coyote --completions bash > "./completions/${_appname}.bash"
	./coyote --completions fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "integrations/INTEGRATION-${pkgver}.zsh" "${pkgdir}/usr/share/${_appname}/shell-integration/${_appname}.zsh"
	install -Dm644 "integrations/INTEGRATION-${pkgver}.bash" "${pkgdir}/usr/share/${_appname}/shell-integration/${_appname}.bash"
	install -Dm644 "integrations/INTEGRATION-${pkgver}.fish" "${pkgdir}/usr/share/${_appname}/shell-integration/${_appname}.fish"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
