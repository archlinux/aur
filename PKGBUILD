# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-museval
_gitpkgname=sigsep-mus-eval
pkgver=0.4.1

# The upstream folks don’t always tag Git commits for their
# PyPI releases.
#
# However, what they do is bump the version field in
# `museval/version.py` prior to releasing. We consider the
# Git commit containing the version bump a reasonable
# approximation for the actual release.
_commit=b2a2246f343eeb3c17dd69882db3eb73b6714617

pkgrel=1
pkgdesc='Source separation evaluation tools for Python'
arch=('any')
url='https://github.com/sigsep/sigsep-mus-eval'
license=('MIT')
depends=(
  'python'
  'python-jsonschema'
  'python-musdb'
  'python-numpy'
  'python-pandas'
  'python-scipy'
  'python-simplejson'
  'python-soundfile'

  # ffmpeg and python-ffmpeg-python seem to be undeclared transitive
  # runtime dependencies of python-stempeg.
  # Adding it here as a temporary workaround until the package
  # picks up the missing `depends` entries.
  'ffmpeg'
  'python-ffmpeg-python'
)
checkdepends=('python-pytest')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/sigsep-mus-eval/archive/${_commit}.tar.gz"
)

sha512sums=(
  '006cbb65d381247734800548cd5d4d235ccd0544114e6540a56575949ae54112180b40c86e1d64e6f4ec4998beb6011a7ad224525eb2fe870408671b311ab929'
)

build() {
    cd "${srcdir}/${_gitpkgname}-${_commit}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_gitpkgname}-${_commit}"
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${_gitpkgname}-${_commit}"
    python -I -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
