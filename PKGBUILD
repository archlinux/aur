# Maintainer: John Gowers <wjg27 AT bath DOT ac DOT uk>
# See also the 'agda' package in the 'community' repository.
pkgname=agda-git
pkgver=2.5.1.r5468.a4e5f12bc
pkgrel=1
pkgdesc="A dependently typed functional programming language and proof assistant: development version"
arch=('x86_64')
url="http://wiki.portal.chalmers.se/agda/"
license=('custom')
groups=()
depends=('ghc-libs' 'haskell-async' 'haskell-blaze-html' 'haskell-boxes'
         'haskell-cpphs' 'haskell-data-hash' 'haskell-edisonapi' 'haskell-edisoncore'
         'haskell-edit-distance' 'haskell-equivalence' 'haskell-geniplate-mirror' 'haskell-gitrev'
         'haskell-hashable' 'haskell-hashtables' 'haskell-ieee754' 'haskell-murmur-hash'
         'haskell-regex-tdfa' 'haskell-strict' 'haskell-unordered-containers' 'haskell-uri-encode'
         'haskell-zlib')
makedepends=('git' 'alex' 'happy' 'ghc')
optdepends=('agda-stdlib: for standard library')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+http://github.com/${pkgname%-git}/${pkgname%-git}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p lib-target
	cp -a ${pkgname%-git}/src/data/lib lib-target/lib
	sed -e "s|rawSystem agda \\[|rawSystem \"env\" [\"Agda_datadir=$PWD/lib-target\", \"LD_LIBRARY_PATH=$PWD/${pkgname%-git}/dist/build\", agda,|" \
		-e "s|(ms, datadir dirs|(ms, \"$PWD/lib-target\"|" \
		-i ${pkgname%-git}/Setup.hs
}

build() {
	cd "${srcdir}/${pkgname%-git}"

	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir="/usr/share/doc/${pkgname%-git}" --datasubdir="${pkgname%-git}" \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
			-fcpphs -f-debug -f-enable-cluster-counting
	LC_CTYPE=en_US.UTF-8 runhaskell Setup build
	runhaskell Setup register --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname%-git}.sh"
	install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname%-git}.sh"
	runhaskell Setup copy --destdir="${pkgdir}"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	rm -f "${pkgdir}/usr/share/doc/${pkgname%-git}/LICENSE"

	install -m644 "$srcdir"/lib-target/lib/prim/Agda/Primitive.agdai "$pkgdir"/usr/share/agda/lib/prim/Agda/Primitive.agdai
  install -m644 "$srcdir"/lib-target/lib/prim/Agda/Primitive/*.agdai "$pkgdir"/usr/share/agda/lib/prim/Agda/Primitive/
	install -m644 "$srcdir"/lib-target/lib/prim/Agda/Builtin/*.agdai "$pkgdir"/usr/share/agda/lib/prim/Agda/Builtin/
}
