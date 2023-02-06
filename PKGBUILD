# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy-git
_pkg="${pkgname%-git}"
pkgver=3.0.6.r6.g3b3e78d
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-click' 'python-requests' 'python-urllib3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-waybackpy' "${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  ## exclude tests directory
  sed -i '/packages/s/find:/waybackpy/' setup.cfg
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
