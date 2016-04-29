# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>

pkgname=git-annex-stack
pkgdesc='manage files with git, without checking their contents into git (stack build)'
pkgver=6.20160419.r9.g4482caf
pkgrel=1

url='http://git-annex.branchable.com/'
license=(GPL3)
arch=('i686' 'x86_64')

# Please report missing dependencies (and your $_features setting below)
depends=(curl git gmp gnupg gsasl libidn libxml2 lsof nss-mdns openssh rsync util-linux)
options=(!makeflags)
conflicts=(git-annex-git git-annex git-annex-cabal)
provides=("git-annex=$pkgver")
makedepends=(ghc haskell-stack)
source=("git-annex::git://git.kitenet.net/git-annex")
sha256sums=('SKIP')

# The following flags are used when building git-annex.
# Features can be disabled by prepending them with a dash in $_features below.
# You can use this to disable the webapp, for example (→ less build time).

# S3 ............. Enable S3 support
# WebDAV ......... Enable WebDAV support
# Dbus ........... Enable dbus support
# Assistant ...... Enable git-annex assistant and watch command
# Webapp ......... Enable git-annex webapp
# Pairing ........ Enable pairing
# XMPP ........... Enable notifications using XMPP
# Production ..... Enable production build (slower build; faster binary)
# -Android ....... Cross building for Android
# -AndroidSplice . Building to get TH splices for Android
# TestSuite ...... Embed the test suite into git-annex
# -EKG ........... Enable use of EKG to monitor git-annex as it runs

_features=(
  S3
  -WebDAV
  Dbus
  Assistant
  Webapp
  Pairing
  -XMPP
  Production
  -Android
  -AndroidSplice
  TestSuite
  -EKG
)


case " ${_features[@]}" in
  *" Dbus"*)
    makedepends=("${makedepends[@]}" dbus)
    ;;&
esac

_stack_flags=$(printf '%s\n' "${_features[@]}" | xargs -n1 -I% echo --flag 'git-annex:%')

prepare(){
  cd "git-annex"
  git checkout $(git describe)

}
pkgver(){
  cd "git-annex"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd git-annex
  msg2 "Features: ${_features[*]}"
  stack init --force --system-ghc
  stack setup
  stack build $_stack_flags
}

# This involves a recompile, uncomment if you're patient.
# check() {
#   cd git-annex
#   stack test
# }

package() {
  cd git-annex
  mkdir -p "$pkgdir/usr/bin"
  stack install --local-bin-path "$pkgdir/usr/bin"
}
