# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_pkgname=pandoc
pkgname=$_pkgname-sile-git
_pkgver=3.8.3
pkgver=3.8.3.r12.ga3b567515
pkgrel=1
pkgdesc='Conversion between markup formats (sile fork, static build)'
url='https://pandoc.org'
license=(GPL-2.0-or-later)
arch=(x86_64)
depends=(glibc # libm.so libc.so
         gmp # libgmp.so
         lua
         zlib)
makedepends=(ghc
             git
             stack)
optdepends=('pandoc-crossref: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
            'texlive-context: for pdf output using context engine'
            'groff: for pdf output using pdfroff engine'
            'python-weasyprint: for pdf output using weasyprint engine'
            'sile: for pdf output using sile engine'
            'typst: for pdf output using typst engine'
            'tectonic: for pdf output using tectonic engine'
            'texlive-fontsrecommended: for pdf output using latex or xelatex engines'
            'texlive-latex: for pdf output using pdflatex engine'
            'texlive-xetex: for pdf output using xelatex engine')
provides=("$_pkgname=$_pkgver"
          "$_pkgname-cli=$_pkgver")
conflicts=("$_pkgname-cli"
           "haskell-$_pkgname") # binary and man page are in different arch packages
source=("$pkgname::git+https://github.com/alerque/$_pkgname.git#branch=sile-$_pkgver")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --long --match 'pandoc-cli-*' \
		| sed 's/^pandoc-cli-//;s/^v//' \
		| awk -F- \
			'BEGIN { OFS="" }
			{
				revcount=$(NF-1)
					sha=$NF
					NF=(NF-2)
					printf "%s.r%s.%s\n", $0, revcount, sha
			}'
}

build() {
	cd "$pkgname"
	stack build \
		--install-ghc \
		--ghc-options='-fdiagnostics-color=always' \
		--flag 'pandoc:embed_data_files' \
		--flag 'lua:system-lua' \
		--flag 'lua:pkg-config' \
		--fast
}

package() {
	depends+=(libz.so)
	cd "$pkgname"
	find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
		-execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" pandoc-cli/man/pandoc.1
}
