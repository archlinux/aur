# Maintainer: nightuser <nightuser.android@gmail.com>

pkgname=podman-compose-git
pkgver=1.0.3.r17.0bd493f
pkgrel=1
epoch=1
pkgdesc="A script to run docker-compose.yml using podman"
arch=('any')
url="https://github.com/containers/podman-compose"
license=('GPL2')
depends=('podman' 'python-yaml' 'python-dotenv')
makedepends=('git' 'python-setuptools')
optdepends=('podman-dnsname: the containers will be able to resolve each other if they are on the same CNI network')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/containers/podman-compose#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.%s" \
    "$(grep -Po "(?<=__version__ = ').*(?=')" podman_compose.py)" \
    "$(git describe --long | sed -e "s/^$(git describe --abbrev=0)-//" -e 's/\([^-]*-\)g/r\1/;s/-/./g')"
  # Alt. way of getting version number:
  # "$(python -c 'from podman_compose import __version__; print(__version__)')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
