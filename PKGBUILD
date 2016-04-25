# Maintainer: 2ion <dev@2ion.de>
pkgname=forecast-git
pkgver=0.5.0
pkgrel=6
pkgdesc="Query weather forecasts from forecast.io"
arch=('i686' 'x86_64')
url="https://github.com/2ion/forecast"
license=('GPL3')
depends=('json-c' 'curl' 'libconfig' 'ncurses' 'openssl' 'lz4' 'bash-completion' 'talloc' 'fuse')
makedepends=('autoconf' 'automake' 'make' 'pkg-config' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('forecast::git+https://github.com/2ion/forecast.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/-/.r/;s/-/./')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -f -i -s

  # Remove --with-bash-completion-dir if you do not want to install Bash
  # completion.

  ./configure --prefix=/usr --with-bash-completion-dir

  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
