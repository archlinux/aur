# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Alex Arwine <arwineap at gmail dot com>

_pkgname=epulse
pkgname=$_pkgname-git
pkgver=0.1.r32.be82ad1
pkgrel=1
pkgdesc="Audio control written for EFL based off of pavucontrol"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('unknown')
depends=('elementary')
makedepends=('git' 'enlightenment-git')
optdepends=('enlightenment-git: Enlightenment module')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git://git.enlightenment.org/devs/ceolin/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd $_pkgname

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" NEWS README
}
