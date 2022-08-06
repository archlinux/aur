# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_pkgname=pandoc
pkgname=$_pkgname-sile-git
_pkgver=2.19
pkgver=2.19.r8.ge3fee91
pkgrel=1
pkgdesc='Conversion between markup formats (sile fork, static build)'
url='https://pandoc.org'
license=(GPL)
arch=(x86_64)
depends=(lua53)
makedepends=(git stack)
optdepends=('pandoc-citeproc: for citation rendering with pandoc-citeproc filter'
            'pandoc-crossref: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
            'texlive-core: for pdf output')
provides=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/alerque/$_pkgname.git#branch=sile-$_pkgver")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --always HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	# TODO: find a better solution
	sed -i "s|let env' = dynlibEnv ++ |let env' = dynlibEnv ++ [(\"LD_LIBRARY_PATH\", \"$PWD/dist/build\")] ++ |" test/Tests/Command.hs
}

build() {
	cd "$_pkgname"
	stack setup
	stack build \
		--install-ghc \
		--ghc-options='-fdiagnostics-color=always' \
		--flag 'pandoc:embed_data_files' \
		--fast
		# --flag 'hslua:system-lua' \
		# --flag 'hslua:pkg-config' \
}

package() {
	cd "$_pkgname"
	find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
		-execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" man/pandoc.1
}
