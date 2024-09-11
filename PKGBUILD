# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=souko
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'libgit2' 'openssl')
conflicts=('souko-bin')
provides=('souko')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f2e535899d9d48fd5233248f920bb12f9ef3ecf79ecfcfebba2fb89af753b243')

build() {
	cd "${pkgname}-${pkgver}"
	cargo xtask dist-build-completion
	cargo xtask dist-build-doc
	cargo xtask dist-build-license
	cargo xtask dist-build-man
	cargo xtask dist-build-readme
	cargo build --release
}

test() {
	cd "${pkgname}-${pkgver}"
	cargo xtask test
}

package() {
	cd "${pkgname}-${pkgver}/target"
	install -Dm 755 "release/souko" -t "${pkgdir}/usr/bin/"

	cd "xtask/dist/${pkgname}-v${pkgver}/"

	install -Dm 644 noarch/man/*.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 noarch/completion/_souko -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm 644 noarch/completion/souko.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm 644 noarch/completion/souko.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm 644 noarch/LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 noarch/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
