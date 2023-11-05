# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=spleeter
pkgver=2.4.0

# The upstream folks don’t tag Git commits for their PyPi releases.
# Requests to tag their releases are left unanswered [1].
#
# However, what they do is bump the version field in `pyproject.toml`
# prior to releasing. We consider the Git commit containing the
# version bump [2] a reasonable approximation for the actual release.
#
# [1]: https://github.com/deezer/spleeter/issues/845
# [2]: https://github.com/deezer/spleeter/commit/0b26dec9f03685117a3a78dc1c4ba1ac7d2d6980#diff-50c86b7ed8ac2cf95bd48334961bf0530cdc77b5a56f852c5c61b89d735fd711R3
#
_commit=0b26dec9f03685117a3a78dc1c4ba1ac7d2d6980

pkgrel=2
pkgdesc='Deezer music source separation library and tool using pretrained models'
url='https://github.com/deezer/spleeter'
arch=('any')
license=('MIT')
depends=(
    'python-ffmpeg-python'
    # Due to `extras=["https"]`, `python-httpx` requires `python-h2`.
    # Ignore the namcap warning `dependency-not-needed python-h2`.
    'python-h2'
    'python-httpx'
    'python-museval'
    'python-norbert'
    'python-tensorflow'
    'python-typer'
)
checkdepends=('python-py' 'python-pytest' 'python-pytest-forked')
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
optdepends=('libsndfile: to perform evaluation')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/deezer/spleeter/archive/${_commit}.tar.gz"
    'github-pr-808-rebased-2.4.0.patch'
    'fix-stray-license.patch'
    'str-enum-python311.patch'
    'test-eval-xfail.patch'
)
sha512sums=(
    '9301d1e2e5c6eb547dfe95db84692b20db252a51ece90c9f11b951933ae770fb9ff936e6857f8c6fe8e46128b2388c2f30fb1fd470e077adedc49fb9c62810d4'
    '0e5a19178f85b9d456db1a43fe54010ce25070626e8324d45beae77fe14703c975ea81280c96d791cb54ab648c2bab3bff8cad63dc368d0f86a00392ab97d9c7'
    '2a54b0b27c60db02bef64195737970a8fcde9a7a79576aa1a01b8e46ba7f40d3d1d0ae02d739f2e63475a10c663ce437fbbcbcaa52b397d33b82e68d8218df85'
    'bb0605e24ea452ff37c4fe650ed1680439301a4d341e6f514b65cf20946e3fe013a8e07d6263c9640ee370f79c5dab642c555777ea6090defe143acf0333f65e'
    '891fc4bcf8f93d53e99e9a5d339b4a5a36349834a737ee0ac07b1a7da3f66813e6ada76164de22548171f47d43d03302b5fa8dcfb92b134bedb302318990ba0b'
)

prepare() {
    cd "${srcdir}/${pkgname#python-}-${_commit}"

    # https://github.com/deezer/spleeter/pull/808
    patch -p1 < "${srcdir}/github-pr-808-rebased-2.4.0.patch"

    # Keep the build backend from including `LICENSE` in the
    # `site-packages` folder directly. Upstream PR pending.
    patch -p1 < "${srcdir}/fix-stray-license.patch"

    # Fix `test_separate_to_file` and `test_filename_format`.
    # Not filed upstream because this fix requires Python 3.11.
    patch -p1 < "${srcdir}/str-enum-python311.patch"

    # Skip failing evaluation tests, needs more analysis
    patch -p1 < "${srcdir}/test-eval-xfail.patch"
}

build() {
    cd "${srcdir}/${pkgname#python-}-${_commit}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname#python-}-${_commit}"
    rm -rf pretrained_models
    python -m pytest
}

package() {
    cd "${srcdir}/${pkgname#python-}-${_commit}"

    echo >&2 'Packaging wheel'
    python -I -m installer --destdir="${pkgdir}" dist/*.whl

    echo >&2 'Packaging license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    echo >&2 'Packaging resources'
    install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/resources" \
        'spleeter/resources'/*.json
}
