# Maintainer: Daniele Basso
# Contributor: John Luebs

pkgname=('conan')
_name='conan'
pkgver=2.32.0
pkgrel=2
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'patch')
depends=('python-requests>=2.25'
  'python-urllib3>=1.26.6'
  'python-colorama>=0.4.3'
  'python-yaml>=6.0'
  'python-patch-ng>=1.18.0'
  'python-fasteners>=0.15'
  'python-distro>=1.4.0'
  'python-jinja>=3.0'
  'python-dateutil>=2.8.0')
conflicts=('conan1')

source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('59a033862bc46f99c4e4fd72c2741f44b8742377864ba33b28a698cd7361471e')

prepare() {
  cd $pkgname-$pkgver
  # Remove maximum version constraints
  sed -i -r 's|(.*),.*|\1|g' conans/requirements.txt
  sed -i -r 's|(.*),.*|\1|g' conans/requirements_server.txt
  sed -i -r 's|(.*),.*|\1|g' conans/requirements_dev.txt
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}
