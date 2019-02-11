# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Co-Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=i3status-git
pkgver=2.12.r83.g49461ac
pkgrel=1
pkgdesc='Generates status bar to use with dzen2 or wmii'
arch=('i686' 'x86_64')
url='http://i3wm.org/i3status/'
license=('BSD')
groups=('i3-vcs')
depends=('confuse' 'alsa-lib' 'yajl' 'libpulse' 'libnl')
makedepends=('git' 'pkgconfig' 'asciidoc' 'xmlto')
options=('docs')
install=i3status.install
conflicts=('i3status')
provides=('i3status')
source=(git+https://github.com/i3/i3status)
sha1sums=('SKIP')

_gitname='i3status'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  autoreconf --force --install

  rm -rf build/
  mkdir -p build && cd build/

  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sanitizers

  # See https://lists.archlinux.org/pipermail/arch-dev-public/2013-April/024776.html
  make CPPFLAGS+="-U_FORTIFY_SOURCE"
}

package() {
  cd "$_gitname"
  cd build/

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
