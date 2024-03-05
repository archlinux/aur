# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-museval
_gitpkgname=sigsep-mus-eval
pkgver=0.4.0
pkgrel=3
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/sigsep-mus-eval/archive/v${pkgver}.tar.gz"
  'github-pr-88.patch'
  'github-pr-91.patch'
  # Too large for the AUR
  'github-pr-93.patch::https://github.com/sigsep/sigsep-mus-eval/commit/6bfdd07ce9855c8c5bd1c6944f487e6f231eac1f.patch'
)

sha512sums=(
  '45eaefc5f5b342edea49f7b12c4987522ba5f7c835b0a1c89111014b5afc7d5c3f78a1274d5700d16843a53fb3e251c2412689bda38938d0f30d55e0b2902886'
  '278be0030e61176bbb627d3d195cbdf405e84d3344a5e559e01f6bb6cb4f85edacccdb40572f466d1f7e54f086e6225761e4a9bb8317bdb523555b5273976bbc'
  '34a0e0cc6aba4ce8138bc09b85f78dc8d1cbf01a55e6f0a9cc6ca8318d0c853eae97c7ce1bc7572fd60609d73d3d043d1cb264c5b30618dd0eeb36199b36cce9'
  '7e061c224b7534efe85ff7fe0399042762cb0900b33714ca2fd9da9380a2ce7ca1934c8a612d7c0577194b7ab24a44b01e5f39ac4470aaeed27b4e5ee4962f20'
)

prepare() {
    # Fix numpy compatibility issue
    # See also: https://github.com/sigsep/sigsep-mus-eval/pull/88
    # Remove this patch once a stable release of v0.4.1 or newer has been
    # tagged on GitHub
    patch -p1 -d "${srcdir}/${_gitpkgname}-${pkgver}" < "${srcdir}/github-pr-88.patch"

    # Fix failing test
    # See also: https://github.com/sigsep/sigsep-mus-eval/pull/93
    # Remove these patches (and the `git` makedepends entry) once a
    # stable release of v0.4.1 or newer has been tagged on GitHub
    git -C "${srcdir}/${_gitpkgname}-${pkgver}" apply \
        "${srcdir}/github-pr-91.patch" \
        "${srcdir}/github-pr-93.patch"
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
