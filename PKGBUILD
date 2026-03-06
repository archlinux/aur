# Maintainer: gub-7 <gub@gubsdomain.com>
# https://github.com/gub-7/local_moonie

pkgname=python-local_moonie
_pypiname=local_moonie
pkgver=0.1.1
pkgrel=1
pkgdesc="Local OpenAI-compatible proxy with Firefox/Selenium search + Ollama backend for Avante.nvim"
arch=('any')
url="https://github.com/gub-7/local_moonie"
license=('MIT')
depends=(
    'python>=3.11'
    'python-fastapi'
    'uvicorn'
    'python-pydantic'
    'python-selenium'
    'python-httpx'
    'python-dotenv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'ollama: Local LLM backend (required for generation)'
    'firefox: Web browser for search feature'
    'geckodriver: WebDriver for Firefox automation'
)
backup=('etc/local-moonie/config.env')
install=python-local_moonie.install

# Source from PyPI (use after publishing to PyPI with new name)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz"
        "local-moonie.service")

# TODO: Replace SKIP with actual sha256sums before publishing to AUR
#   After uploading to PyPI, run: makepkg -g
sha256sums=('SKIP'
            'SKIP')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"

    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install systemd service
    install -Dm644 "$srcdir/local-moonie.service" \
        "$pkgdir/usr/lib/systemd/system/local-moonie.service"

    # Install default configuration
    install -Dm640 .env.example \
        "$pkgdir/etc/local-moonie/config.env"

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('aa3470c5fc28ca8a53e07f2d9bce5cd6e4891eef192ea1570a528983eb254142'
            '1889b59e45990091891ae253dda963fc862cab91bf9f9f256af1515dc2963c83')
