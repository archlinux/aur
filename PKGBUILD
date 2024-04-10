#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Freqtrade.
# Maintainer: Achmad Fathoni <fathoni.id@gmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Michele <king_duckz@gmx.com>

declare -r _version_frequi="1.2.7"
readonly _pkgname="freqtrade"

pkgname="python-freqtrade"
pkgver="2024.3"
pkgrel="2"
pkgdesc="Free, open source crypto trading bot."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-aiofiles" "python-aiohttp" "python-arrow" "python-ast-comments" "python-blosc" "python-cachetools" "python-catboost" "python-ccxt" "python-colorama" "python-cryptography" "python-datasieve" "python-dateutil" "python-fastapi" "python-filelock" "python-gymnasium" "python-janus" "python-jinja" "python-joblib" "python-jsonschema" "python-lightgbm" "python-numpy" "python-orjson" "python-pandas" "python-pandas-ta" "python-plotly" "python-progressbar" "python-prompt_toolkit" "python-psutil" "python-py-find-1st" "python-pyarrow" "python-pycoingecko" "python-pydantic" "python-pyjwt" "python-pytables" "python-pytorch" "python-questionary" "python-rapidjson" "python-requests" "python-schedule" "python-scikit-learn" "python-scikit-optimize" "python-scipy" "python-sdnotify" "python-sqlalchemy" "python-stable-baselines3" "python-stable-baselines3-contrib" "python-starlette" "python-ta-lib" "python-tabulate" "python-technical" "python-telegram-bot" "python-tensorflow" "python-urllib3" "python-uvloop" "python-websockets" "python-xgboost" "tensorboard" "uvicorn")
makedepends=("python-build" "python-installer")
checkdepends=(
    "python-httpx" "python-pytest" "python-pytest-asyncio" "python-pytest-cov" "python-pytest-mock" "python-pytest-random-order" "python-time-machine")
conflicts=("python-freqtrade-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "frequi-v${_version_frequi}.zip::https://github.com/freqtrade/frequi/releases/download/${_version_frequi}/freqUI.zip")
sha512sums=("4351b36ffc564af9da56a21b63da41000073167952a2c3d912802e0fea48243f769033fd752c8df9b9c8ebb7f9e95797e1265091e294da0ae70bba2998919ada"
    "30c662e0a2b884290f23b3c06bb7738d9f596d6776d229cfd055d964a28267fbe86099cde5079ea7285bd56876ec21fe9933ad651908be53a9118e3c02431a30")

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
