# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_pkgname=pandoc
pkgname=$_pkgname-sile-git
_pkgver=3.1.11.1
pkgver=3.1.11.1.r10.gcacd261
pkgrel=2
pkgdesc='Conversion between markup formats (sile fork, static build)'
url='https://pandoc.org'
license=(GPL)
arch=(x86_64)
makedepends=(git
             stack)
optdepends=('pandoc-citeproc: for citation rendering with pandoc-citeproc filter'
            'pandoc-crossref: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
            'texlive-core: for pdf output')
provides=("$_pkgname=$_pkgver" "$_pkgname-cli=$_pkgver")
conflicts=("$_pkgname-cli" "haskell-$_pkgname") # binary and man page are in different arch packages
source=("git+https://github.com/alerque/$_pkgname.git#branch=sile-$_pkgver")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --always HEAD --match "[0-9].[0-9]*" |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	stack setup
	stack build \
		--install-ghc \
		--ghc-options='-fdiagnostics-color=always' \
		--flag 'pandoc:embed_data_files' \
		--fast
}

package() {
	cd "$_pkgname"
	find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
		-execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" pandoc-cli/man/pandoc.1
}
