# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=poppassd-ceti-git
pkgver=20140924
pkgrel=1
pkgdesc="POP3 password change daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/kravietz/poppassd-ceti"
license=('GPL')
makedepends=('git' 'autoconf' 'm4')
depends=('pam')
provides=('poppassd')
source=('poppassd.socket' 'poppassd@.service' 'poppassd.pam')
noextract=()
sha256sums=('e37648591a8789256410954cee2481951b3e8b7e89705c37435da9ddf8698bc8'
            '6111aed841cc9e31dbd2d476cb8e4e786db2c9300c5e39468f4aa2703d43d123'
            '3025b1cfaf35e78f1351854f837708b00515351d88a03fdf8ca61e93aabe421e')

_gitroot=https://github.com/kravietz/poppassd-ceti.git
_gitname=poppassd-ceti

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
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  autoreconf -I m4 -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../poppassd@.service "${pkgdir}"/usr/lib/systemd/system/poppassd@.service
  install -Dm644 ../poppassd.socket "${pkgdir}"/usr/lib/systemd/system/poppassd.socket
  install -Dm644 ../poppassd.pam "${pkgdir}"/etc/pamd/poppassd
}

# vim:set ts=2 sw=2 et:
