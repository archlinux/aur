# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Paul Boddie

pkgname=mercurial-web-theme-hg
pkgver=58
pkgrel=2
pkgdesc="A clean & lean Mercurial Web theme"
arch=(any)
url="http://hgweb.boddie.org.uk/MercurialWebTheme"
license=('GPL')
groups=()
depends=('mercurial')
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://hgweb.boddie.org.uk/"
_hgrepo="MercurialWebTheme"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
}

package() {
  _ins="$pkgdir/usr/lib/python2.7/site-packages/mercurial/templates"
  mkdir -p "$_ins"
  mkdir -p "$_ins/static/"
  cd "$srcdir/$_hgrepo-build"
  ./insttheme "$_ins"
  echo "--------------------------------------------------------------------------------"
  echo "To use this hgweb theme, add this to your /etc/mercurial/hgrc (or the repository's hgrc) :"
  echo ""
  echo "[web]"
  echo "style = mercurialweb"
  echo ""
}

# vim:set ts=2 sw=2 et:
