# Maintainer: Neil Shepperd <nshepperd at gmail dot com>
pkgname=cabal-static
pkgver=3.2.0.0
pkgrel=1
pkgdesc="The command-line interface for Cabal and Hackage. Statically linked."
arch=('i686' 'x86_64' 'armv7h')
url="https://hackage.haskell.org/package/cabal-install"
license=('custom:BSD3')
depends=('gmp' 'zlib' 'libffi')
makedepends=('ghc' 'ghc-static')
provides=(cabal-install)
conflicts=(cabal-install)
source=("https://hackage.haskell.org/package/cabal-install-${pkgver}/cabal-install-${pkgver}.tar.gz")
md5sums=('cc807bc0114eae46ccc90a4ad3bea877')

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

build() {
  cd "${srcdir}/cabal-install-$pkgver"

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

  # Detect global environment file and move it out of the way.
  ENV_FILE=$(echo 'main = return ()' | runghc 2>&1 | grep 'Loaded package environment from .*' | grep -o '/.*' || true)
  if [ -f "$ENV_FILE" ]; then
	echo "Warning: Environment file detected at ${ENV_FILE}."
	echo "This is likely to break the build."
	echo -n "Would you like it to be temporarily renamed for the duration? [y/n] "
	read MOVE_ENV_FILE
	if [ "${MOVE_ENV_FILE}" != "y" ]; then
	  echo "Cancelled."
	  exit 1
	fi
	mv -vb "${ENV_FILE}" "${ENV_FILE}.bak"
  fi

  EXTRA_CONFIGURE_OPTS="" ./bootstrap.sh --sandbox || FAIL=true

  # Restore default environment if we moved it.
  if [ "${MOVE_ENV_FILE}" == "y" ]; then
	mv -vb "${ENV_FILE}.bak" "${ENV_FILE}"
  fi

  # Exit with failure status if the build failed.
  if [ "$FAIL" == "true" ]; then
	exit 1
  fi
}

package() {
  cd "${srcdir}/cabal-install-$pkgver"

  install -Dm755 .cabal-sandbox/bin/cabal \
          "${pkgdir}/usr/bin/cabal"
  gzip -c .cabal-sandbox/share/man/man1/cabal.1 \
       > .cabal-sandbox/share/man/man1/cabal.1.gz
  install -Dm644 .cabal-sandbox/share/man/man1/cabal.1.gz \
          "${pkgdir}/usr/share/man/man1/cabal.1.gz"

  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 bash-completion/cabal \
          "${pkgdir}/usr/share/bash-completion/completions/cabal"
}
