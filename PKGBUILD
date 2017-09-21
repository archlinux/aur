# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.4.2
pkgrel=2
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/v$pkgver.tar.gz")
sha512sums=('bc9ab4f4f047d32a5783c992d5f73fb05c9f096ef7994d14db117340dd3fd1931ff2c17f48b02a994b6ac5778fdfd4eec5d04856d0c74f4422ba5340ebb4cefc')
noextract=("docker-credential-helpers-$pkgver.tar.gz")
install=$pkgname.install

prepare() {
  mkdir -p "$srcdir/src/$_gourl"
  tar -x --strip-components=1 -C "$srcdir/src/$_gourl" -f "$srcdir/docker-credential-helpers-$pkgver.tar.gz"
}

build() {
  cd "$srcdir/src/$_gourl"
  GOPATH="$srcdir" go install -v -x ./credentials
  GOPATH="$srcdir" make secretservice
}

package() {
  cd "$srcdir/src/$_gourl"
  install -D -m 0755 bin/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:

