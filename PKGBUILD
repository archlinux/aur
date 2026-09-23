# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.25.r2.g5affbc9.pandoc.3.11
_pandoc_type=stock
_pandoc_ver=3.11
_pandoc_lua_ver=0.5.4
_pandoc_commit=b913622e1ff87c69ab8b1a606577122e220925cd
pkgrel=1
pkgdesc='Pandoc filter for cross-references (static build)'
arch=('i686' 'x86_64')
url="https://github.com/lierdakil/${_pkgname}"
license=('GPL-2.0-or-later')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp' "pandoc-cli=$_pandoc_ver" 'zlib')
makedepends=('git' 'cabal-install' 'ghc' 'pandoc-cli')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long --match='*[0-9]' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed "s/$/.pandoc.$_pandoc_ver/"
}

prepare() {
  cd "$pkgname"

  # if pandoc updates break the golden tests, cf
  # https://github.com/lierdakil/pandoc-crossref/pull/403#issuecomment-1732434519
  # for how to bump

  _bumpBound() {
    _pandoc_bound="${_pandoc_ver}.1"
    sed -i "/pandoc.*< \?$_pandoc_ver/s#< \?[0-9.]*#<$_pandoc_bound#" \
      pandoc-crossref.cabal
  }

  case "$_pandoc_type" in
  stock) if ! git diff --quiet -- cabal.project.freeze; then
    echo "cabal.project.freeze has been modified, can't use stock version selection"
    echo '(you probably need to comment out the steps in prepare() modifying it)'
    exit 1
    fi
    ;;
  commit)
    _sourceRepo() {
      printf '
source-repository-package
    type:     git
    location: https://github.com/%s.git
    tag:      %s
    subdir:   %s
' "$1" "$2" "$3"
    }
    _sourceStanzas() {
      _sourceRepo jgm/pandoc "$_pandoc_commit" .
      _sourceRepo jgm/pandoc "$_pandoc_commit" pandoc-cli
      _sourceRepo jgm/pandoc "$_pandoc_commit" pandoc-lua-engine
    }
    if grep source-repository-package cabal.project; then
      echo 'cabal.project is already configured with a source repository,'
      echo "can't confidently edit it to point to the correct commit."
      echo 'Make sure the following stanzas are present, then rerun with makepkg -e'
      _sourceStanzas
      exit 1
    fi
    _sourceStanzas >> cabal.project
    _bumpBound
    ;;
  version)
    _freezeVer() {
      sed -i "/any\.$1 ==/s/==[0-9.]*/==$2/" cabal.project.freeze
    }
    _freezeVer pandoc "$_pandoc_ver"
    _freezeVer pandoc-cli "$_pandoc_ver"
    _freezeVer pandoc-lua-engine "$_pandoc_lua_ver"
    _bumpBound
  ;;
  *)
    echo "Invalid pandoc version type: $_pandoc_type"
    exit 1
  esac

  sed -i '/pandoc /s/-\(embed_data_files\)/+\1/' cabal.project.freeze

  rts=$(date +@%s --date="$(curl -I http://hackage.haskell.org/01-index.tar |
    awk -F': ' '$1 == "Last-modified" { print $2 }')")
  lts=$(TZ=UTC date +@%s --date='today 00:00')
  ts=$(printf '%s\n' "$rts" "$lts" | sort -n | head -n1)

  cabal update hackage.haskell.org,$ts
  cabal configure --prefix=/usr --docdir=/usr/share/doc/"$pkgname" \
    --enable-tests --constraint 'pandoc +embed_data_files'
  cabal build --only-dependencies
}

build() {
  cd "$pkgname"

  cabal build --offline
  pandoc -s -t man docs/index.md -o pandoc-crossref.1
}

check() {
  cd "$pkgname"
  cabal test
}

package() {
  cd "$pkgname"
  cabal install --install-method=copy --installdir "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 pandoc-crossref.1 \
    "$pkgdir"/usr/share/man/man1/pandoc-crossref.1
}

# vim:set ts=2 sw=2 et
