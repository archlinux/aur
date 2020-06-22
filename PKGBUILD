# Contributor: solnce <solnce at ratajczak dot one>
# Maintainer: solnce <solnce at ratajczak dot one>
# original code by Sunday87: https://bbs.archlinux.org/viewtopic.php?pid=1253365#p1253365

pkgname=texlive-most-doc
pkgver=20200622
pkgrel=1
pkgdesc="Most TeXLive documentation"
url="http://tug.org/texlive/"
arch=('any')
license=('unknown')
optdepends=('texlive-core: texdoc, mktexlsr hook, and many packages documented here')
makedepends=('rsync')
conflicts=(texlive-tlpdb)
options=('!strip' '!purge')

pkgver() {
  date -I | tr -d '-'
}

build() {
  _texmfdoc=/usr/share/texmf-dist/doc
  _olddoc=""
  if test -d "$_texmfdoc"; then
    _olddoc="--link-dest=$_texmfdoc"
  else
    cat >&2 <<EOT
******************************************************************************
Directory $_texmfdoc not found.
This means that rsync'ing the TeXLive documentation tree will download
several gigabytes of documentation.
This could be made much more efficient by having a previous version of
package $pkgname installed.
******************************************************************************
EOT
  fi
  mkdir -p "$srcdir$_texmfdoc"
  # Excluding texmf-dist/doc/{man,info} because their contents are mostly
  # provided by other packages in standard locations outside texmf-dist
  rsync -av --no-o --no-g --chmod=D755,F644 $_olddoc --del --delete-excluded --exclude=/man --exclude=/info rsync://tug.org/texlive/Contents/live/texmf-dist/doc/ "$srcdir$_texmfdoc/"

  _tlpkg=/usr/share/tlpkg
  _oldtlpkg=""
  if test -d "$_tlpkg"; then
    _oldtlpkg="--link-dest=$_tlpkg"
  fi
  mkdir -p "$srcdir$_tlpkg"
  rsync -av --no-o --no-g --chmod=D755,F644 $_oldtlpkg --del rsync://tug.org/texlive/Contents/live/tlpkg/texlive.tlpdb "$srcdir$_tlpkg/texlive.tlpdb"
}

package() {
  cp -rl "$srcdir"/* "$pkgdir"
}
