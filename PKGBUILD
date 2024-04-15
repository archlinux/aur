# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=rc-sircmpwn
pkgver=r233.2e5495e
pkgrel=1
pkgdesc="an experimental shell for Unix inspired by Plan 9's rc"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://git.sr.ht/~sircmpwn/rc"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'hare' 'hare-madeline' 'scdoc')
provides=("rc")
conflicts=("rc")
_commit='2e5495ec7d82bf187f65ff1bbb8aadee4472ad15'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('d6ee6614d7ca39f603b588f3d553cf29c29fe850454309a82de23928a8b69507')

pkgver() {
	cd "${pkgname}"
	local commits hash
	commits=$(git rev-list --count HEAD)
	hash=$(git rev-parse --short=7 HEAD)
	printf "r%s.%s" "${commits}" "${hash}"
}

build() {
	cd "${pkgname}"
	make docs
	make rc
}

check() {
	cd "${pkgname}"
	hare test
	./run-tests
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "doc/grammar.txt"
}
