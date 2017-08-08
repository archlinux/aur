# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=php55-appengine-git
_pkgbase="${pkgname#php55-}"
_phpbase="${pkgname#-appengine}"
_gitname="appengine-php-extension"
pkgver=r6.b40aa29
_PKGVER="$(echo "${pkgver}" | tr '[:lower:]' '[:upper:]')"
pkgrel=1
pkgdesc="php55 Google App Engine Extension"
arch=('i686' 'x86_64')
url="https://github.com/GoogleCloudPlatform/appengine-php-extension"
license=('Apache')
depends=('php55>=5.5' 'protobuf')
options=('!makeflags')
provides=("${_pkgbase}=${pkgver}-${pkgrel}" "php-${_pkgbase}=${pkgver}-${pkgrel}")
source=('git+https://github.com/GoogleCloudPlatform/appengine-php-extension.git')
sha512sums=('SKIP')

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

  protoc --cpp_out=. remote_api.proto
  protoc --cpp_out=. urlfetch_service.proto
  phpize55
  ./configure --prefix=/usr --enable-gae --with-protobuf_inc=/usr/include --with-protobuf_lib=/usr/lib
  make
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_ROOT=$pkgdir install
}

check() {
  cd "$srcdir/$_gitname-build"
  make test
}
