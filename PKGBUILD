# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: Frank Bearoff fbearoff at gmail dot com
# Contributor: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
_pkgname=trash
pkgver=21
pkgrel=1
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('MIT')
makedepends=(dub ldc scdoc)
conflicts=("trash-cli")
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('db5a827d6d6b57e3e55faec89107e65bcb5f81e92f4cd56d25ca95c7fa65fe38475a493f4ee1e82fb3bf2ee0a8113d77d5ef66b7fabbabc9a36a2570a264188e')

build() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Build using dub
	dub build --compiler=ldc2 --build=release
	
	# Build the manpage using scdoc
	scdoc < MANUAL.scd > ./build/trash.man
}

check() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Run the tests provided by the developer
	dub test --compiler=ldc2
}

package() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Install the produced binary
	install -Dm755 "./build/trash" "${pkgdir}/usr/bin/trash"
	
	# Install the manpage in the section #1
	install -Dm644 "./build/trash.man" "${pkgdir}/usr/share/man/man1/trash.1"

	# Install completions
	install -Dm644 "completions/zsh/_${_pkgname}" \
		"${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 completions/fish/${_pkgname}.fish \
		"${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	# Install the license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

