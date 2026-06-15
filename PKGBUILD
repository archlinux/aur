# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=icloudpd
_name="icloud_photos_downloader"
pkgdesc="A command-line tool to download photos and videos from iCloud."
url="https://github.com/icloud-photos-downloader/icloud_photos_downloader/"

pkgver=1.32.3
pkgrel=1

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
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "icloudpd-relax-version-pinning.patch"
    "icloudpd-skip-interactive-tests.patch"
    "icloudpd-skip-timezone-dependent-tests.patch"
)
b2sums=(
    "62da9039d4aee0b111865596bf5c445819180e12fd94e9759dd4943d2fcaae7e86e9e0897eb06519d73d5b65cc96bf2d6f1ef5d6465aac058d6f2aef619f3ad3"
    "5a23e9456ade01f9857f423ddc01b0cb438049c5af33862c20deef10bd40b0040cf0dfab6fb6ef1b069a28221ac58a8e6a1a91f5f58c376f21cf77c981065bdb"
    "ec7c3ef99d328e761aacfabd6c33b9a4ebff5af33f5e5e28a101e302cc83cac8dddf0f1a08be5491a0ccb0cd8953d6a80ece360278abf5cdb055880d8d34ff32"
    "09b4b56e14707c61b0cebf798bebec6df312836fe886404ab80de3ebe58c8dc5918dfdeef0a1dc21e908e6b644178ecca4dee82afa82700416e5f10410e59d6e"
)

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input "${srcdir}/icloudpd-relax-version-pinning.patch"
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
