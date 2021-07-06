# Maintainer: Neil Shepperd <nshepperd at gmail dot com>
pkgname=cabal-static
pkgver=3.4.0.0
pkgrel=2
pkgdesc="The command-line interface for Cabal and Hackage. Statically linked."
arch=('i686' 'x86_64' 'armv7h')
url="https://hackage.haskell.org/package/cabal-install"
license=('custom:BSD3')
depends=('gmp' 'zlib' 'libffi')
makedepends=('ghc' 'ghc-static' 'python3')
provides=(cabal-install)
conflicts=(cabal-install)
source=("https://hackage.haskell.org/package/cabal-install-${pkgver}/cabal-install-${pkgver}.tar.gz"
		"https://raw.githubusercontent.com/haskell/cabal/f0d0594bae4f8e3e1ae1bdacef6217a4fc4e136d/bootstrap/bootstrap.py"
		"arch-8.10.4.json"
		"arch-8.10.5.json")
sha256sums=('1980ef3fb30001ca8cf830c4cae1356f6065f4fea787c7786c7200754ba73e97'
            '7e7bebde030eeadc07e3f622fe34e49dfa4e6bafd5f9edabe2bd50f190b2508e'
            '00223c3b2d85c9817651e8139f1d99abeaf25fb0f2d97654bd281bb40c4ee4c0'
            '41c665984a2173feba915f1fcf3a7750151b79ecacc4547e8c5a3fb6176bbdb9')

# Transitive dependencies of cabal-install
makeconflicts=(haskell-async
			   haskell-base16-bytestring
			   haskell-base64-bytestring
			   haskell-cryptohash-sha256
			   haskell-echo
			   haskell-ed25519
			   haskell-edit-distance
			   haskell-hackage-security
			   haskell-hashable
			   haskell-http
			   haskell-network
			   haskell-network-uri
			   haskell-random
			   haskell-tar
			   haskell-zlib)

prepare() {
  cd "${srcdir}"

  # Detect conflicting globally installed haskell packages.
  conflicts_present=()
  for conflict in ${makeconflicts[*]}; do
	if (pacman -Q ${conflict} | grep ${conflict}) 2>/dev/null >/dev/null ; then
		conflicts_present+=(${conflict})
	fi
  done

  if [ ${#conflicts_present[@]} -gt 0 ]; then
	  echo "Warning: conflicting globally installed packages detected:" ${conflicts_present[*]}
	  echo "These will probably break the build. You should remove these before building."
	  exit 1
  fi

  test -a cabal-install || ln -s "cabal-install-$pkgver" cabal-install
}

build() {
  cd "${srcdir}"

  GHC=$(which ghc)

  ghcver=$($GHC -V | egrep -o 'version [0-9.]*' | egrep -o '[0-9.]*')

  if ! test -a "${srcdir}"/arch-${ghcver}.json ; then
	echo "I have not yet generated a build plan for ghc-${ghcver}."
	echo "You could try generating one by following the instructions at <https://github.com/haskell/cabal/tree/master/bootstrap>, or leave a comment on the aur page for cabal-static."
	exit 1
  fi

  python3 "${srcdir}"/bootstrap.py -d "${srcdir}"/arch-${ghcver}.json -w $GHC
}

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/_build/bin/cabal" "${pkgdir}/usr/bin/cabal"

  # Man pages aren't in the sdist any more?
  # gzip -c .cabal-sandbox/share/man/man1/cabal.1 \
  #      > .cabal-sandbox/share/man/man1/cabal.1.gz
  # install -Dm644 .cabal-sandbox/share/man/man1/cabal.1.gz \
  #         "${pkgdir}/usr/share/man/man1/cabal.1.gz"

  install -Dm644 "${srcdir}/cabal-install-$pkgver/LICENSE" \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/cabal-install-$pkgver/bash-completion/cabal" \
          "${pkgdir}/usr/share/bash-completion/completions/cabal"
}
