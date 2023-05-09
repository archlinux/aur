# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-museval
_gitpkgname=sigsep-mus-eval
pkgver=0.4.0
pkgrel=2
pkgdesc='Source separation evaluation tools for Python'
arch=('any')
url='https://github.com/sigsep/sigsep-mus-eval'
license=('MIT')
depends=(
  'ffmpeg'
  'python-jsonschema'
  'python-musdb'
  'python-pandas'
  'python-scipy'
  'python-simplejson'
)
checkdepends=('python-pytest')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/sigsep-mus-eval/archive/v${pkgver}.tar.gz"
  'github-pr-88.patch'
  'museval-test-xfail.patch'
)

sha512sums=(
  '45eaefc5f5b342edea49f7b12c4987522ba5f7c835b0a1c89111014b5afc7d5c3f78a1274d5700d16843a53fb3e251c2412689bda38938d0f30d55e0b2902886'
  '278be0030e61176bbb627d3d195cbdf405e84d3344a5e559e01f6bb6cb4f85edacccdb40572f466d1f7e54f086e6225761e4a9bb8317bdb523555b5273976bbc'
  '1193344ff5a4a21180414e047e14b214358cf19291802b12d8f6d941c65be07d49dd2e9500964679c6b0e4fc9bc6ae7b96f3377fab4a25a1a64750c9eb28bcce'
)

prepare() {
    # https://github.com/sigsep/sigsep-mus-eval/pull/88
    patch -p1 -d "${srcdir}/${_gitpkgname}-${pkgver}" < "${srcdir}/github-pr-88.patch"
    # Known failing test
    patch -p1 -d "${srcdir}/${_gitpkgname}-${pkgver}" < "${srcdir}/museval-test-xfail.patch"
}

build() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${_gitpkgname}-${pkgver}"
    python -I -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
