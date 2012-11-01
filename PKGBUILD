# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikked-git
pkgver=20120706
pkgrel=1
pkgdesc="An advanced and beautiful pastebin written in PHP"
arch=('any')
url="https://github.com/claudehohl/Stikked"
license=('GPL')
depends=('php')
provides=('stikked')
conflicts=('stikked')
backup=('etc/webapps/stikked/stikked.php')
options=('!strip')
install=$pkgname.install

_gitroot='https://github.com/claudehohl/Stikked.git'
_gitname='Stikked'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build/htdocs"
  _instdir="$pkgdir/usr/share/webapps/Stikked"
  _cfgdir="$pkgdir/etc/webapps/stikked"
  mkdir -p "$_instdir" "$_cfgdir"

  cp -ra * .htaccess "$_instdir"
  mv "$_instdir/application/config/stikked.php" "$_cfgdir"
  ln -s /etc/webapps/stikked/stikked.php "$_instdir/application/config/stikked.php"
}

# vim:set ts=2 sw=2 et:
