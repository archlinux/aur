#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Freqtrade.
# Maintainer: Achmad Fathoni <fathoni.id@gmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Michele <king_duckz@gmx.com>

declare -r _version_frequi="0.9.5"
readonly _pkgname="freqtrade"

pkgname="python-freqtrade"
pkgver="2023.6"
pkgrel="2"
pkgdesc="Free, open source crypto trading bot."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL3")
depends=("python" "python-aiofiles" "python-aiohttp" "python-arrow" "python-blosc" "python-cachetools" "python-catboost" "python-ccxt" "python-colorama" "python-cryptography" "python-dateutil" "python-fastapi" "python-filelock" "python-gym" "python-janus" "python-jinja" "python-joblib" "python-jsonschema" "python-lightgbm" "python-numpy" "python-orjson" "python-pandas" "python-pandas-ta" "python-plotly" "python-progressbar" "python-psutil" "python-py-find-1st" "python-pyarrow" "python-pycoingecko" "python-pydantic" "python-pyjwt" "python-prompt_toolkit" "python-pytorch" "python-questionary" "python-rapidjson" "python-requests" "python-schedule" "python-scikit-learn" "python-scikit-optimize" "python-scipy" "python-sdnotify" "python-sqlalchemy" "python-stable-baselines3" "python-stable-baselines3-contrib" "python-starlette" "python-ta-lib" "python-tables" "python-tabulate" "python-technical" "python-telegram-bot" "python-tensorflow" "python-urllib3" "python-uvloop" "python-websockets" "python-xgboost-git" "tensorboard" "uvicorn")
makedepends=("python-build" "python-installer")
checkdepends=(
    "python-httpx" "python-pytest" "python-pytest-asyncio" "python-pytest-cov" "python-pytest-mock" "python-pytest-random-order" "python-time-machine")
conflicts=("python-freqtrade-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "frequi-v${_version_frequi}.zip::https://github.com/freqtrade/frequi/releases/download/${_version_frequi}/freqUI.zip"
    "${_pkgname}@.service")
sha512sums=("7d82b0e1d6e9e912c7f2e4142ab5d1279b6e0a9c2042e8abbc63d949078a7ecc49a8bba588d639bea8b83b09c2a38d55a6be6f413f3c9b2edf3603e14041bdcb"
    "c367fc509e000a9349f05b4607c9946150e2c50d7f98a4c1b9a981464a0cd32a80f2704d270954f8e2089b89efc00231410db3edbd35a37f5e30b88ad5583b7c"
    "5126cdd86136ae7f2b93fa22b3f01f811121a9cde875b4d699d92ae74f40bf017ee04cd8fc7df39d73660a2bad180063994cf6890d51e2dcfff312fb2e622df2")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # TODO
    # pytest
}

package()
{
    declare _site_packages
    _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
    readonly _site_packages

    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/
    mkdir -p "${pkgdir}"/usr/lib/systemd/system/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl
    rm -r "${pkgdir}"/"${_site_packages}"/tests/

    cp -r "${srcdir}"/assets/ "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/
    install -Dm644 "${srcdir}"/favicon.ico "${srcdir}"/index.html "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/

    install -Dm644 "${srcdir}"/"${_pkgname}"@.service "${pkgdir}"/usr/lib/systemd/system/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
