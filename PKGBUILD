# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.24.0
pkgrel=2
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-setuptools' 'python-wheel')
depends=('python' 'python-ruamel-yaml' 'python-colorama' 'python-requests' 'python-attrs' 'python-tqdm' 'python-ruamel-yaml' 'python-packaging' 'python-jsonschema')
provides=('semgrep')
options=('!strip')
source=(
  "https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz"
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('698a239c1b446835ae3a5ee02032fc2228789bd3fb8b5870c7a3ed24b77a47d4'
            '5b1c4c8e5782ef9f62f4d12851c14a59c226ece11f86884e96853b39bfaa8c28')
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"
  find semgrep-files -type f -exec install -D '{}' "${pkgdir}/usr/lib/{}" \;
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/semgrep-files/semgrep-core" "${pkgdir}/usr/bin/semgrep-core"

  cd "${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
