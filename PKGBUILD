# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=spleeter
pkgver=2.3.2

# The upstream folks don’t tag Git commits for their PyPi releases.
# Requests to tag their releases are left unanswered [1].
#
# However, what they do is bump the version field in `pyproject.toml`
# prior to releasing. We consider the Git commit containing the
# version bump [2] a reasonable approximation for the actual release.
#
# [1]: https://github.com/deezer/spleeter/issues/845
# [2]: https://github.com/deezer/spleeter/commit/bdc27726412dd296ae9d51434db402675565d129#diff-50c86b7ed8ac2cf95bd48334961bf0530cdc77b5a56f852c5c61b89d735fd711R3
#
_commit=bdc27726412dd296ae9d51434db402675565d129

pkgrel=1
pkgdesc='Deezer music source separation library and tool using pretrained models'
url='https://github.com/deezer/spleeter'
arch=('any')
license=('MIT')
depends=(
    'python-ffmpeg-python'
    'python-h2'
    'python-httpx'
    'python-librosa'
    'python-museval'
    'python-norbert'
    'python-tensorflow'
    'python-typer'

    # `python-lazy-loader` and `python-soxr` are transitive
    # dependencies, which should have been declared in
    # `python-librosa`’s PKGBUILD.
    # Declaring them here as a temporary workaround.
    # Remove these lines once they’ve been added to `python-librosa`.
    'python-lazy-loader'
    'python-soxr'
)
checkdepends=(
    'python-py'
    'python-pytest'
    'python-pytest-forked'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry'
    'python-wheel'
)
optdepends=('libsndfile: to perform evaluation')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/deezer/spleeter/archive/${_commit}.tar.gz"
    'github-pr-808-rebased-2.3.0.patch'
    'fix-stray-license.patch'
    'str-enum-python311.patch'
    'test-eval-xfail.patch'
)
sha512sums=(
    '254cfdd3379f766103aba02d6783eea634681841d01fc94d65dba7c7b996d9ec441ee8185011a3bf567e02e04c1ef7c89e50a666b37b79c6053dc1104fbd53a8'
    'f573e211ca884948abf1d9f962a4d4f7e10609d3e7b714d0dde5326c6d1041ff83df26631c47e983cec962e44b2a2a2e964320d3d3d8d1d78811db991327a2f4'
    '2a54b0b27c60db02bef64195737970a8fcde9a7a79576aa1a01b8e46ba7f40d3d1d0ae02d739f2e63475a10c663ce437fbbcbcaa52b397d33b82e68d8218df85'
    '8e84da04d5c19d6fe13fc469c4e8e2d1246ad3eb734b6b65f690c7f85acbd8d2c71121ddb983b3a332a6d7eb4c2e289a445ac9364a9e681900c9b7dce572a4a1'
    'cdf7b1b499dc5877af2e5f0a13659fb9a2e45795743e757f7b521f7d4267cfa527f7905e749525fbd960ca5e7cfaeae2bcacfc33cf08a74049ba78e824328d9e'
)

prepare() {
    cd "${srcdir}/${pkgname#python-}-${_commit}"

    # https://github.com/deezer/spleeter/pull/808
    patch -p1 < "${srcdir}/github-pr-808-rebased-2.3.0.patch"

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
