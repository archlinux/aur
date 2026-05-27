# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Michael-A-Kuykendall
_gitname=shimmy
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Drop-in OpenAI API Replacement for Local LLMs"

pkgver=2.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}"{-cpu,-gpu})
makedepends=('rust')
depends=('glibc' 'libgcc' 'libstdc++')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('d9114c5d1e41d84916961669cba50a326dcef2825f8899a84090e08ebae07195')

prepare() {
	cd "${pkgbase}-${pkgver}/" || exit

	cargo update -w
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgbase}-${pkgver}/" || exit

	RUSTUP_TOOLCHAIN=stable cargo build --frozen --release
}

package() {
	cd "${pkgbase}-${pkgver}/" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "README-DOCKER.md" "${pkgdir}/usr/share/doc/${pkgname}/README-DOCKER.md"
	install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "DEVELOPERS.md" "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPERS.md"
	install -Dm644 "ROADMAP.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "DCO.md" "${pkgdir}/usr/share/doc/${pkgname}/DCO.md"
	install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "SPONSORS.md" "${pkgdir}/usr/share/doc/${pkgname}/SPONSORS.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "RELEASE_PROCESS.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_PROCESS.md"
	install -Dm644 "RELEASE_GATES_CHECKLIST.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_GATES_CHECKLIST.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
