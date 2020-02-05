# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=alock-git
pkgver=2.5.0
pkgrel=1
pkgdesc="Simple transparent screen-lock"
arch=('i686' 'x86_64')
#url="https://code.google.com/p/alock/"
url="https://github.com/Arkq/alock"
license=('MIT')
depends=('imlib2' 'pam' 'libxxf86misc' 'libxrender' 'libgcrypt')
makedepends=('git' 'xmlto')
optdepends=('libxcursor' 'pam')
conflicts=('alock-svn')
#source=('git+https://code.google.com/p/alock/')
source=("$pkgname::git+https://github.com/Arkq/alock")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's,^[^0-9]*,,;s,\([^-]*-g\),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  sed -i -e 's,"login","system-auth",' src/auth_pam.c
  autoreconf -fiv
}

build() {
  cd $pkgname
  # upstream bug: Configure ignores --prefix option
  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--enable-pam \
	--enable-hash \
	--enable-xrender \
	--enable-imlib2 \
	--with-dunst \
	--with-xbacklight
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
