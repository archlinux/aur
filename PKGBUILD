#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Freqtrade.
# Maintainer: Achmad Fathoni <fathoni.id@gmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Michele <king_duckz@gmx.com>

declare -r _version_frequi="2.1.0"
readonly _pkgname="freqtrade"

pkgname="python-freqtrade"
pkgver="2025.10"
pkgrel="1"
pkgdesc="Free, open source crypto trading bot."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-aiofiles" "python-aiohttp" "python-arrow" "python-ast-comments" "python-blosc" "python-cachetools" "python-catboost" "python-ccxt" "python-colorama" "python-cryptography" "python-datasieve" "python-dateutil" "python-fastapi" "python-filelock" "python-gymnasium" "python-janus" "python-jinja" "python-joblib" "python-jsonschema" "python-lightgbm" "python-numpy" "python-orjson" "python-pandas" "python-pandas-ta" "python-plotly" "python-progressbar" "python-prompt_toolkit" "python-psutil" "python-py-find-1st" "python-pyarrow" "python-pycoingecko" "python-pydantic" "python-pyjwt" "python-pytables" "python-pytorch" "python-questionary" "python-rapidjson" "python-requests" "python-schedule" "python-scikit-learn" "python-scikit-optimize" "python-scipy" "python-sdnotify" "python-sqlalchemy" "python-stable-baselines3" "python-stable-baselines3-contrib" "python-starlette" "python-ta-lib" "python-tabulate" "python-technical" "python-telegram-bot" "python-tensorflow" "python-urllib3" "python-uvloop" "python-websockets" "python-xgboost" "tensorboard" "uvicorn")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=(
    "python-httpx" "python-pytest" "python-pytest-asyncio" "python-pytest-cov" "python-pytest-mock" "python-pytest-random-order" "python-time-machine")
conflicts=("python-freqtrade-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "frequi-v${_version_frequi}.zip::https://github.com/freqtrade/frequi/releases/download/${_version_frequi}/freqUI.zip")
sha512sums=("975e71a13f1a3329a955cf5a634ef043f692dbca783d1fa2fd21a53d6799e8a9bd5d90150068ae63a6b3bbb52bda5eb01e03f2e7412dd3eb62f9068f62d82bd5"
    "4d8811be496fd17d6543eff56f333c469d404a5cb8b4dcac74fd2dc5cf9f9468532a2efd3a87feebf1081ddcb5d2fbf2051522f2bb7771b24c3c5c898648e2bb")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # pytest
}

package()
{
    declare _site_packages
    _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
    readonly _site_packages

    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl
    rm -r "${pkgdir}"/"${_site_packages}"/tests/

    cp -r "${srcdir}"/assets/ "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/
    install -Dm644 "${srcdir}"/favicon.ico "${srcdir}"/index.html "${pkgdir}"/"${_site_packages}"/freqtrade/rpc/api_server/ui/installed/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
