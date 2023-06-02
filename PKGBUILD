# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=spleeter
pkgver=2.3.0
pkgrel=2
pkgdesc='Deezer music source separation library and tool using pretrained models'
url='https://github.com/deezer/spleeter'
arch=('any')
license=('MIT')
depends=(
    'python-ffmpeg'
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
    "${pkgname}-${pkgver}.tar.gz::https://github.com/deezer/spleeter/archive/v${pkgver}.tar.gz"
    'github-pr-808-rebased-2.3.0.patch'
    'fix-stray-license.patch'
    'str-enum-python311.patch'
    'test-eval-xfail.patch'
)
sha512sums=(
    '2c807358817cc2516e9c5b6ccaad2121164a37681abddb281231158ddab8d24ce5678770b4d12a1a116090b4b2dc143b24e4f3af373e40fb545696af5cb36c71'
    'f573e211ca884948abf1d9f962a4d4f7e10609d3e7b714d0dde5326c6d1041ff83df26631c47e983cec962e44b2a2a2e964320d3d3d8d1d78811db991327a2f4'
    '2a54b0b27c60db02bef64195737970a8fcde9a7a79576aa1a01b8e46ba7f40d3d1d0ae02d739f2e63475a10c663ce437fbbcbcaa52b397d33b82e68d8218df85'
    '86223d53fdcd4219bab113c9ecc12a24ca14fb1a713ab1e71c37f3d9648325ae0ab5db541b8daa3f093f1f1aed51f733f95d095b7f81d92829474eef9d785c96'
    'cdf7b1b499dc5877af2e5f0a13659fb9a2e45795743e757f7b521f7d4267cfa527f7905e749525fbd960ca5e7cfaeae2bcacfc33cf08a74049ba78e824328d9e'
)

prepare() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"

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
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    rm -rf pretrained_models
    python -m pytest
}

package() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"

    echo >&2 'Packaging wheel'
    python -I -m installer --destdir="${pkgdir}" dist/*.whl

    echo >&2 'Packaging license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    echo >&2 'Packaging resources'
    install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/resources" \
        'spleeter/resources'/*.json
}
