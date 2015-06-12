# Maintainer: Manish Munikar <munikarmanish at gmail dot com>

pkgname=batti-git
pkgver=1.2.r0.g33feb57
pkgrel=1
pkgdesc="Nepal load-shedding schedule for terminal"
arch=('any')
url="https://github.com/foss-np/batti"
license=('GPL')
depends=('wget' 'poppler' 'sed')
makedepends=('git')
source=('git+https://github.com/foss-np/batti.git')
md5sums=('SKIP') #generate with 'makepkg -g'

_gitname="batti"
_gitroot="https://github.com/foss-np/batti"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  msg "Installing..."

  # Create directories
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/opt/$_gitname"

  # Copy files
  for filename in $(find "$srcdir/$_gitname" -maxdepth 1 -mindepth 1 -not -name "*.git*"); do
    if file "$filename" | grep "executable" &>/dev/null; then
      install -m755 "$filename" "$pkgdir/opt/$_gitname/"
    else
      install -m644 "$filename" "$pkgdir/opt/$_gitname/"
    fi
  done

  # Create the symlink
  ln -s "/opt/$_gitname/main.sh" "$pkgdir/usr/bin/$_gitname"
}

# vim:set ts=2 sw=2 et:
