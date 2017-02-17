# Maintainer: Raphaël Doursenaud <rdoursenaud@gmail.com>
pkgname=letsencrypt-gandi-git
pkgver=r31.4f724cd
pkgrel=1
pkgdesc="Gandi plugin for Let's Encrypt"
arch=(any)
url="https://github.com/Gandi/letsencrypt-gandi"
license=('APACHE')
groups=()
depends=('certbot')
makedepends=('git' 'python2-setuptools' 'python2-mock')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Gandi/letsencrypt-gandi')
noextract=()
md5sums=('SKIP')

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
  python2 setup.py build
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
  python2 setup.py test
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
