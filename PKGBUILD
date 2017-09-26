# Maintainer: Raphaël Doursenaud <rdoursenaud@gmail.com>
pkgname=letsencrypt-gandi-git
pkgver=r37.cf35ab7
pkgrel=1
pkgdesc="Gandi plugin for Let's Encrypt"
arch=(any)
url="https://github.com/Gandi/letsencrypt-gandi"
license=('APACHE')
groups=()
depends=('certbot')
makedepends=('git' 'python-setuptools' 'python-mock' 'openssh')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Gandi/letsencrypt-gandi'
        '0001-Update-setuptools-entry-point-to-certbot.patch'
        '0002-Python-3-compatibility.patch')
noextract=()
sha512sums=('SKIP'
            'bf1ed0b6f2f75cd0b819c0f0908da76934bb6182162a2ab365b55eb4106b787645401a318ff85fd53d604d2b5fafa1105443fe7de308bb8b2a96031fa78d4e7c'
            '1fedb9f5808f7352b4e3f75035ea57066ff965fc7da2d36a590da02f932786e28e068acdb6ab59406982095145354677822acdfbcc5c1d3189e916a6d8b1d104')

_gitroot=https://github.com/Gandi/letsencrypt-gandi
_gitname=letsencrypt-gandi

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
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Python 3 compatibility (See: https://github.com/Gandi/letsencrypt-gandi/pull/33)
  patch -Np1 -i "${srcdir}/0001-Update-setuptools-entry-point-to-certbot.patch"
  patch -Np1 -i "${srcdir}/0002-Python-3-compatibility.patch"

  python setup.py build
}

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
check() {
  cd "$srcdir/$_gitname-build"
  python setup.py test
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
