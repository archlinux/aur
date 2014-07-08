# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

# Cabal Flags:
# The git-annex assistant requires significantly more dependencies.
# If you do not need the assistant or have build issues try:
# _webapp=0

_s3=1
_webdav=1
_inotify=1
_dbus=1
_assistant=1
_webapp=1
_pairing=1
_xmpp=1
_dns=1
# slower build; faster binary
_production=1
_android=0
_testsuite=1
_tdfa=1
_feed=1
_quvi=1
_cryptohash=1

# In _cabal_mode=1 cabal install is used to install the missing dependencies
# for git-annex in a temporary local location to not interfer with you
# installation.
_cabal_mode=1
_cabal_flags=( --force-reinstalls )

# The man page is always built but,
# building the rest of the documentation requires ikiwiki.
# If you want to build the documentation turns this to 1.
_build_docs=0

# When _haskell_core is set to 1, packages available on the [haskell-core]
# repo are used (https://github.com/archhaskell/habs).
# [CHECKED on 2013-01-14]
_haskell_core=1

# When _haskell_web is set to 1, packages available on the [haskell-web]
# repo are used (https://github.com/EffeErre/habs-web).
# [BROKEN as of 2013-05-19]
_haskell_web=0

pkgname=git-annex-git
pkgver=5.20140210
pkgrel=1
pkgdesc='manage files with git, without checking their contents into git'
arch=('i686' 'x86_64')
url="http://git-annex.branchable.com/"
license=(GPL3)
depends=(
         curl
         git
         gmp
         gnupg
         gsasl
         libidn
         libxml2
         lsof
         nss-mdns
         openssh
         rsync
         util-linux
         )
options=(!makeflags)
conflicts=(git-annex)
makedepends=(ghc)
optdepends=('quvi: Enable use of quvi to download videos')

_features=()

(( ! _cabal_mode )) ||
  makedepends=("${makedepends[@]}" cabal-install happy alex haskell-cpphs)

(( ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
              haskell-bloomfilter
              haskell-dataenc
              haskell-edit-distance
              haskell-extensible-exceptions
              haskell-hslogger
              haskell-http
              haskell-ifelse
              haskell-json
              haskell-lifted-base
              haskell-missingh
              haskell-monad-control
              haskell-mtl
              haskell-network
              haskell-quickcheck
              haskell-sha
              haskell-text
              haskell-transformers-base
              haskell-utf8-string
              )

(( ! _haskell_web )) ||
  makedepends=("${makedepends[@]}" haskell-safesemaphore haskell-uuid)

gitannexfeature(){
  case $1 in
    (0) _features=("${_features[@]}" -f-$2);;
    (*) _features=("${_features[@]}" -f$2);;
  esac
}

gitannexfeature $_android    Android
gitannexfeature $_assistant  Assistant
gitannexfeature $_dbus       Dbus
gitannexfeature $_dns        DNS
gitannexfeature $_inotify    Inotify
gitannexfeature $_pairing    Pairing
gitannexfeature $_production Production
gitannexfeature $_s3         S3
gitannexfeature $_testsuite  TestSuite
gitannexfeature $_tdfa       TDFA
gitannexfeature $_webapp     Webapp
gitannexfeature $_webdav     WebDAV
gitannexfeature $_xmpp       XMPP
gitannexfeature $_feed       Feed
gitannexfeature $_quvi       Quvi
gitannexfeature $_cryptohash CryptoHash

(( ! _s3 || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}" haskell-hs3)

(( ! _assistant || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}" haskell-stm)

(( ! _assistant || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}" haskell-async)

(( ! _inotify || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}" haskell-hinotify)

(( ! _webdav || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}" haskell-dav haskell-http-conduit haskell-xml-conduit)
#(( ! _webdav || ! _cabal_mode || _haskell_web )) ||
#  _cabal_install=("${_cabal_install[@]}" DAV http-conduit xml-conduit)

(( ! _dbus || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}" haskell-dbus)
#(( ! _dbus || ! _cabal_mode || _haskell_core )) ||
#  _cabal_install=("${_cabal_install[@]}" dbus)

(( ! _webapp || ! _assistant || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
               haskell-case-insensitive
               haskell-http-types
               haskell-transformers
               haskell-wai
               haskell-warp
               haskell-blaze-builder
               haskell-crypto-api
               haskell-aeson
               haskell-data-default
              )

(( ! _webapp || ! _assistant || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}"
               haskell-clientsession
               haskell-wai-logger
               haskell-yesod
               haskell-yesod-static
               haskell-yesod-form
               haskell-yesod-default
               haskell-hamlet
              )
#(( ! _webapp || ! _assistant || ! _cabal_mode || _haskell_web )) ||
#  _cabal_install=("${_cabal_install[@]}" wai-logger project-template-0.1.0.1 yesod yesod-static yesod-default hamlet)

(( ! _webapp || ! _pairing || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}"
               haskell-network-multicast
               haskell-network-info)
#(( ! _webapp || ! _pairing || ! _cabal_mode || _haskell_web )) ||
#  _cabal_install=("${_cabal_install[@]}"
#                  network-multicast
#                  network-info)

(( ! _xmpp || ! _assistant || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}"
               haskell-xml-types
               haskell-network-protocol-xmpp
               haskell-gnutls)
#(( ! _xmpp || ! _assistant || ! _cabal_mode || _haskell_web )) ||
#  _cabal_install=("${_cabal_install[@]}"
#                  xml-types
#                  network-protocol-xmpp
#                  gnutls)

(( ! _xmpp || ! _assistant || ! _dns || ! _haskell_web )) ||
  makedepends=("${makedepends[@]}" haskell-dns)
#(( ! _xmpp || ! _assistant || ! _dns || ! _cabal_mode || _haskell_web )) ||
#  _cabal_install=("${_cabal_install[@]}" dns)

(( ! _testsuite || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
               haskell-hunit)

(( ! _tdfa || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
               haskell-regex-tdfa)

### haskell-feed is not packaged yet
#(( ! _feed || ! _haskell_core )) ||
#  makedepends=("${makedepends[@]}"
#               haskell-feed)

(( ! _quvi || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
               haskell-aeson)

(( ! _cryptohash || ! _haskell_core )) ||
  makedepends=("${makedepends[@]}"
               haskell-cryptohash)

(( ! _build_docs )) || makedepends=("${makedepends[@]}" ikiwiki)

_gitroot=git://git.kitenet.net/git-annex
_gitname=git-annex

asking() {
  read -p "$@ (Y/n)" answer
  case "$answer" in
    n|N|no|NO|No|nO) false;;
    *) true;;
  esac
}

_localize-home(){
  ORIG_HOME="$HOME"
  ORIG_TMPDIR="$TMPDIR"
  export HOME="${srcdir}/home"
  export TMPDIR="${srcdir}/home/tmp"
  export PATH="$HOME/.cabal/bin:$PATH"
}

_restore-home(){
  export HOME="$ORIG_HOME"
  export TMPDIR="$ORIG_TMPDIR"
}

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir

  if [ -d $_gitname ] ; then
    cd $_gitname
    git fetch origin || return 1
    git reset --hard origin/master || return 1
    msg "The local files are updated."
  else
    # --depth=1 should only be used when no merge is done
    git clone "${_gitroot}" $_gitname || return 1
  fi
  cd "${srcdir}/$_gitname"
  git checkout master || return 1
  rsync -aH --del "${srcdir}/$_gitname/" "${srcdir}/build/" || return 1
  cd "${srcdir}/build"

  msg "Git checkout done or server timeout"

  _localize-home
  mkdir -p "$HOME" "$TMPDIR"

  msg "Features: ${_features[*]}"

  if (( _cabal_mode )); then
    msg "Cabal mode: installing missing dependencies..."
    #cabal install cabal-install
    #cabal sandbox init
    cabal update
    which c2hs || cabal install c2hs
    # only if _cabal_install non empty
    # cabal install "${_cabal_install[@]}" --user
    cabal install "${_cabal_flags[@]}" --user --only-dependencies "${_features[@]}"
  fi

  msg "Configuring..."
  cabal configure "${_features[@]}"

  msg "Starting build..."
  make
  (( ! _testsuite )) ||
    make test ||
    asking "Tests failed. Continue?"
  _restore-home
}

package() {
  cd $srcdir/build
  _localize-home
  make DESTDIR=$pkgdir install
  _restore-home
}
