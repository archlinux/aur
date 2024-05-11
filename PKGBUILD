# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_pkgname=pandoc
pkgname=$_pkgname-sile-git
_pkgver=3.2
pkgver=3.1.12.1.r189.g9c87deb
pkgrel=1
pkgdesc='Conversion between markup formats (sile fork, static build)'
url='https://pandoc.org'
license=(GPL-2.0-or-later)
arch=(x86_64)
depends=(glibc # libm.so libc.so
         gmp # libgmp.so
         zlib)
makedepends=(git
             stack)
optdepends=('pandoc-crossref: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
            'texlive-core: for pdf output')
provides=("$_pkgname=$_pkgver"
          "$_pkgname-cli=$_pkgver")
conflicts=("$_pkgname-cli"
           "haskell-$_pkgname") # binary and man page are in different arch packages
source=("$pkgname::git+https://github.com/alerque/$_pkgname.git#branch=sile-$_pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	stack config set resolver lts-22.19 # ghc-9.6.4
	echo 'compiler: ghc-9.6.5' >> stack.yaml
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --always HEAD --match "[0-9].[0-9]*" |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	stack build \
		--install-ghc \
		--ghc-options='-fdiagnostics-color=always' \
		--flag 'pandoc:embed_data_files' \
		--fast
}

package() {
	depends+=(libz.so)
	cd "$pkgname"
	find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
		-execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" pandoc-cli/man/pandoc.1
}
