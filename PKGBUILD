# Maintainer: Johann Klähn <kljohann@gmail.com>

pkgname=git-annex-cabal
pkgdesc='manage files with git, without checking their contents into git (cabal sandbox build)'
pkgver=5.20150528
pkgrel=1

url='http://git-annex.branchable.com/'
license=(GPL3)
arch=('i686' 'x86_64')
# Please report missing dependencies (and your $_features setting below)
depends=(curl git gmp gnupg gsasl libidn libxml2 lsof nss-mdns openssh rsync util-linux)
options=(!makeflags)
conflicts=(git-annex-git git-annex)
provides=("git-annex=$pkgver")
makedepends=(ghc "cabal-install>=1.18" happy alex)
source=("git-annex::git://git.kitenet.net/git-annex#tag=${pkgver}")
sha256sums=('SKIP')

# The following flags are used when building git-annex.
# Features can be disabled by prepending them with a dash in $_features below.
# You can use this to disable the webapp, for example (→ less build time).

# S3 ............. Enable S3 support
# WebDAV ......... Enable WebDAV support
# Inotify ........ Enable inotify support
# Dbus ........... Enable dbus support
# Assistant ...... Enable git-annex assistant and watch command
# Webapp ......... Enable git-annex webapp
# Webapp-secure .. Secure webapp
# Pairing ........ Enable pairing
# XMPP ........... Enable notifications using XMPP
# DNS ............ Enable the haskell DNS library for DNS lookup
# Production ..... Enable production build (slower build; faster binary)
# -Android ....... Cross building for Android
# -AndroidSplice . Building to get TH splices for Android
# TestSuite ...... Embed the test suite into git-annex
# TDFA ........... Use regex-tdfa for wildcards
# Feed ........... Enable podcast feed support
# Quvi ........... Enable use of quvi to download videos
# Tahoe .......... Enable the tahoe special remote
# CryptoHash ..... Enable use of cryptohash for checksumming
# DesktopNotify .. Enable desktop environment notifications
# -EKG ........... Enable use of EKG to monitor git-annex as it runs

_features=(
  S3
  -WebDAV
  Inotify
  Dbus
  Assistant
  Webapp
  Webapp-secure
  Pairing
  -XMPP
  DNS
  Production
  -Android
  -AndroidSplice
  TestSuite
  TDFA
  Feed
  Quvi
  -Tahoe
  CryptoHash
  DesktopNotify
  -EKG
)


case " ${_features[@]}" in
  *" Dbus"*)
    makedepends=("${makedepends[@]}" dbus)
    ;;&
esac

_cabal_flags=(--force-reinstalls --reinstall --user)

build() {
  cd git-annex

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal update

  msg "Building dependencies..."
  msg2 "Features: ${_features[*]}"
  msg2 "Cabal flags: ${_cabal_flags[*]}"

  which c2hs || cabal install "${_cabal_flags[@]}" c2hs
  cabal install "${_cabal_flags[@]}" --only-dependencies "${_features[@]/#/-f}"

  msg "Configuring..."
  cabal configure "${_features[@]/#/-f}"

  msg "Starting build..."
  make
}

check() {
  cd git-annex

  GNUPGHOME="$PWD/.gnupg" make test
}

package() {
  cd git-annex

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  make GHC="cabal exec ghc --" DESTDIR="$pkgdir" install
}
