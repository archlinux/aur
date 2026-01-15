# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=icloudpd
_name="icloud_photos_downloader"
pkgdesc="A command-line tool to download photos and videos from iCloud."
url="https://icloud-photos-downloader.github.io/icloud_photos_downloader/"

pkgver=1.32.2
pkgrel=2

arch=("any")
license=("MIT")

depends=(
    "python"
    "python-certifi"
    "python-flask"
    "python-keyring"
    "python-keyrings-alt"
    "python-piexif"
    "python-pytz"
    "python-requests"
    "python-schema"
    "python-srp"
    "python-tqdm"
    "python-typing_extensions"
    "python-tzlocal"
    "python-urllib3"
    "python-waitress"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "mypy"
    "python-freezegun"
    "python-mock"
    "python-pytest"
    "python-pytest-cov"
    "python-pytest-timeout"
    "python-pytest-xdist"
    "python-ruff"
    "python-types-mock"
    "python-types-pytz"
    "python-types-requests"
    "python-types-tqdm"
    "python-types-urllib3"
    "python-types-waitress"
    "python-vcrpy"
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "icloudpd-skip-interactive-tests.patch"
    "icloudpd-skip-timezone-dependent-tests.patch"
)
b2sums=(
    "bd6a2f321d022d974d69845051157a1b2018c96a6606ee82e3508383281227977d1d1f590b613145b46626af708282c663ce050312ab20443500bc0129d8c356"
    "ec7c3ef99d328e761aacfabd6c33b9a4ebff5af33f5e5e28a101e302cc83cac8dddf0f1a08be5491a0ccb0cd8953d6a80ece360278abf5cdb055880d8d34ff32"
    "09b4b56e14707c61b0cebf798bebec6df312836fe886404ab80de3ebe58c8dc5918dfdeef0a1dc21e908e6b644178ecca4dee82afa82700416e5f10410e59d6e"
)

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input "${srcdir}/icloudpd-skip-interactive-tests.patch"
    patch --forward --strip=1 --input "${srcdir}/icloudpd-skip-timezone-dependent-tests.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
