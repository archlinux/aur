# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=kuina-git-static
pkgver=9651d37
_pkgname=kuina
pkgrel=2
pkgdesc="Fish/bash/zsh shell prompt in the style of XMonad."
arch=("x86_64")
url="https://codeberg.org/eviefp/kuina"
license=('PPL')
depends=("gmp" "glibc" "inetutils")
# Uncomment and Change this and use makepkg --nodeps if you are using Haskell outside of the official repos
# Underneath is an example using ghcup
#_cabal_path="$HOME/.ghcup/bin/cabal-3.16.1.0"
_cabal_path="cabal"
makedepends=("cabal-install" "ghc" "ghc-static" "ghc-libs")
conflicts=($_pkgname)
replaces=($_pkgname)
provides=($_pkgname)
source=(git+$url.git)
sha256sums=("SKIP")


pkgver() {
  	cd "$_pkgname"
  	git describe --always --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	$_cabal_path update hackage.haskell.org
	$_cabal_path configure --prefix=/usr --docdir=/usr/share/doc/"$_pkgname" \
	$_cabal_path build --only-dependencies --enable-static
}
build(){
	cd "$srcdir/$_pkgname"
	$_cabal_path build --offline 
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/$_pkgname" LICENSE
	$_cabal_path install exe:kuina --install-method=copy --installdir "$pkgdir/usr/bin"
}
