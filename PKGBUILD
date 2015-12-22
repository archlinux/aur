# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Maintainer: Matt Bilker <me@mbilker.us>

_pkgname='N1'
pkgname='n1-git'
pkgver=..0edbf51
pkgrel=1
pkgdesc="A new mail client, built on the modern web and designed to be extended."
arch=('any')
url="https://github.com/nylas/N1"
license=('GPL3')
depends=('gconf' 'nodejs' 'libgnome-keyring' 'nss' 'python2')
makedepends=('git' 'npm')
provides=('n1')
conflicts=('n1')
source=('git+https://github.com/nylas/N1.git')
sha512sums=('SKIP')

pkgver() {
  cd "nylas"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export PYTHON=python2
  script/bootstrap
  script/grunt build --build-dir "$srcdir/nylas-build"
  script/grunt set-version --build-dir "$srcdir/nylas-build"
  script/grunt generate-asar --build-dir "$srcdir/nylas-build"
}

package() {
  cd "$_pkgname"

  script/grunt install --build-dir "$srcdir/nylas-build" --install-dir "$pkgdir/usr"
  install -Dm644 build/resources/linux/Nylas.desktop "$pkgdir/usr/share/applications/nylas.desktop"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
