# Maintainer: Yann Büchau <nobodyinperson at posteo de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

# pkgname git-annex-git already taken somehow and can't be adopted, so added this '-dev' bit...
pkgname=git-annex-dev-git
pkgver=10.20221212.r24.gac6ccb513
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git (dev version)"
url="https://git-annex.branchable.com/"
license=("AGPL3")
arch=('x86_64')
provides=("${pkgname%-dev-git}")
conflicts=("${pkgname%-dev-git}" 'git-annex-standalone')
depends=('git' 'lsof' 'rsync' 'ghc-libs' 'haskell-aeson' 'haskell-ansi-terminal' 'haskell-async'
         'haskell-aws' 'haskell-blaze-builder' 'haskell-bloomfilter' 'haskell-byteable'
         'haskell-case-insensitive' 'haskell-clientsession' 'haskell-concurrent-output'
         'haskell-connection' 'haskell-conduit' 'haskell-criterion' 'haskell-crypto-api'
         'haskell-cryptonite' 'haskell-data-default' 'haskell-dav' 'haskell-dbus'
         'haskell-disk-free-space' 'haskell-dlist' 'haskell-edit-distance' 'haskell-fdo-notify'
         'haskell-feed' 'haskell-filepath-bytestring' 'haskell-git-lfs' 'haskell-hinotify'
         'haskell-http-client' 'haskell-http-client-restricted' 'haskell-http-client-tls'
         'haskell-http-conduit' 'haskell-http-types' 'haskell-ifelse' 'haskell-magic'
         'haskell-memory' 'haskell-microlens' 'haskell-monad-control' 'haskell-monad-logger'
         'haskell-mountpoints' 'haskell-network' 'haskell-network-info' 'haskell-network-multicast'
         'haskell-network-uri' 'haskell-old-locale' 'haskell-optparse-applicative'
         'haskell-path-pieces' 'haskell-persistent' 'haskell-persistent-sqlite' 'haskell-quickcheck'
         'haskell-random' 'haskell-regex-tdfa' 'haskell-resourcet' 'haskell-safesemaphore'
         'haskell-sandi' 'haskell-securemem' 'haskell-shakespeare' 'haskell-socks' 'haskell-split'
         'haskell-stm-chans' 'haskell-tagsoup' 'haskell-tasty' 'haskell-tasty-hunit'
         'haskell-tasty-quickcheck' 'haskell-tasty-rerun' 'haskell-torrent' 'haskell-unix-compat'
         'haskell-unliftio-core' 'haskell-unordered-containers' 'haskell-utf8-string' 'haskell-uuid'
         'haskell-vector' 'haskell-wai' 'haskell-wai-extra' 'haskell-warp' 'haskell-warp-tls'
         'haskell-yesod' 'haskell-yesod-core' 'haskell-yesod-form' 'haskell-yesod-static')
makedepends=('chrpath' 'ghc' 'uusi')
source=("git+https://git.joeyh.name/git/git-annex.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir"/"${pkgname%-dev-git}"
  git describe --long --tags --always | sed 's/^[^0-9]\+//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd git-annex
  # persistent-template was merged into persistent
  uusi -d persistent-template git-annex.cabal
  sed -i 's/MIN_VERSION_persistent_template/MIN_VERSION_persistent/' Database/ContentIdentifier.hs Database/Export.hs Database/Fsck.hs Database/Keys/SQL.hs
}

build() {
  cd git-annex
  sed -e 's|--ghc-options|-O --prefix=/usr --enable-executable-dynamic --disable-library-vanilla --docdir=/usr/share/doc/'${pkgname%-dev-git}' --ghc-options|' \
      -i Makefile
  make GHC="ghc -dynamic" BUILDER=./Setup BUILDEROPTIONS=$MAKEFLAGS
}

package() {
  cd git-annex
  make GHC="ghc -dynamic" BUILDER=./Setup DESTDIR="$pkgdir" install

  rmdir "$pkgdir"/usr/share/doc/git-annex "$pkgdir"/usr/share/doc
}
