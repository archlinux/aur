# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbxvt-git
pkgver=0.8
pkgrel=1
pkgdesc="xcb terminal emulator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jefbed/jbxvt"
license=('MIT')
depends=('xcb-util-keysyms' 'libutempter')
makedepends=('git')
provides=('xterm')
_gitroot=https://github.com/jefbed/jbxvt.git
_gitname=jbxvt
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
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  # build:
  ./configure -J
  make
}
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
