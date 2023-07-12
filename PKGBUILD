# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=parcellite-git
pkgver=1.2.2.r0.3c3ef48
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager (git version)"
arch=('x86_64')
url="https://github.com/rickyrockrat/${pkgname%%-*}"
license=('GPL3')
depends=('gtk2')
makedepends=('intltool'
             'git'
             'psmisc')
optdepends=('xdotool: auto-paste support')
conflicts=("${pkgname%%-*}")
provides=("${pkgname%%-*}")
source=("$pkgname::git+https://github.com/rickyrockrat/${pkgname%%-*}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  touch src/config.simple.h
}

build() {
  cd "${srcdir}/${pkgname}"
	test -x configure || (
	(sleep 5; killall gettextize) &
    ./autogen.sh
  )
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-appindicator=no
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
