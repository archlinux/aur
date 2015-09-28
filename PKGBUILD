# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=pulsemixer-git
pkgver=r35.c7817ad
pkgrel=1
pkgdesc="cli and curses mixer for pulseaudio"
arch=(any)
url="https://github.com/GeorgeFilipkin/pulsemixer"
license=('MIT')
depends=('python' 'pulseaudio')
makedepends=('git')

_gitroot=https://github.com/GeorgeFilipkin/pulsemixer.git
_gitname=pulsemixer

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  cd "$srcdir/$_gitname-build"
  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 pulsemixer "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
