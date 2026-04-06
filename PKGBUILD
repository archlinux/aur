# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Michael-A-Kuykendall
_gitname=shimmy
_appname=${_gitname}
pkgbase=${_appname}
pkgname=(${pkgbase}{-cpu,-gpu})
pkgdesc="Drop-in OpenAI API Replacement for Local LLMs"

pkgver=1.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}"{-git,-bin})

makedepends=('rust')
depends=('glibc' 'libgcc')

source=("${pkgbase}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('d761c96a497263a19a2d4a78ddfe248e5c8c0b896ff535d15ac31b47032761e4')

_target_cpu='build-cpu'
_target_gpu='build-gpu'

prepare() {
	cd "${pkgbase}-${pkgver}/" || exit

	cargo update -w
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgbase}-${pkgver}/" || exit

	msg2 "Building CPU-only version"
	RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="${_target_cpu}" cargo build --frozen --release --features huggingface,llama,vision

	msg2 "Building with GPU support"
	RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="${_target_gpu}" cargo build --frozen --release --features huggingface,llama,llama-cuda,llama-vulkan,llama-opencl,vision
}

package_shimmy-cpu() {
	cd "${pkgbase}-${pkgver}/" || exit

	install -Dm755 "${_target_cpu}/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "README-DOCKER.md" "${pkgdir}/usr/share/doc/${pkgname}/README-DOCKER.md"
	install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "DEVELOPERS.md" "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPERS.md"
	install -Dm644 "ROADMAP.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "SPONSORS.md" "${pkgdir}/usr/share/doc/${pkgname}/SPONSORS.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "RELEASE_PROCESS.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_PROCESS.md"
	install -Dm644 "RELEASE_GATES_CHECKLIST.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_GATES_CHECKLIST.md"
	install -Dm644 "V${pkgver}_RELEASE_CHECKLIST.md" "${pkgdir}/usr/share/doc/${pkgname}/V${pkgver}_RELEASE_CHECKLIST.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_shimmy-gpu() {
	cd "${pkgbase}-${pkgver}/" || exit

	install -Dm755 "${_target_gpu}/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "README-DOCKER.md" "${pkgdir}/usr/share/doc/${pkgname}/README-DOCKER.md"
	install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "DEVELOPERS.md" "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPERS.md"
	install -Dm644 "ROADMAP.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "SPONSORS.md" "${pkgdir}/usr/share/doc/${pkgname}/SPONSORS.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "RELEASE_PROCESS.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_PROCESS.md"
	install -Dm644 "RELEASE_GATES_CHECKLIST.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_GATES_CHECKLIST.md"
	install -Dm644 "V${pkgver}_RELEASE_CHECKLIST.md" "${pkgdir}/usr/share/doc/${pkgname}/V${pkgver}_RELEASE_CHECKLIST.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
