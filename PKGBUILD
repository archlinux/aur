# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pbincli-git
_name="PBinCLI"
pkgver=0.3.5.r14.gac0a145
pkgrel=1

pkgdesc='A command line client for PrivateBin'
arch=('any')
url="https://github.com/r4sas/${_name}"
license=('MIT')

depends=('python'
         'python-base58'
         'python-pycryptodome'
         'python-requests'
         'python-sjcl'
         'python-argcomplete'
         'python-pysocks')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')

_pkgsrc="${_name}-${pkgver}"
provides=("pbincli=${pkgver%%.r*}")
conflicts=(pbincli)
source=("${_pkgsrc}.tar.gz::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_pkgsrc}.tar.gz" clean -dfx
}

pkgver() {
  cd "$srcdir/${_pkgsrc}.tar.gz"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgsrc}.tar.gz"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgsrc}.tar.gz"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
