#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Freqtrade.
# Maintainer: Achmad Fathoni <fathoni.id@gmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Michele <king_duckz@gmx.com>

readonly _pkgname="freqtrade"

pkgname="python-freqtrade"
pkgver="2023.2"
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
    "https://github.com/freqtrade/frequi/releases/download/0.6.8/freqUI.zip"
    "freqtrade@.service")
sha512sums=("e9800a26aed5a2271bfdc99ec69dfeedc33e6cef4cde47dd1da0c0cddfe7a91b7eb334d654dd60d7e5892d9033d2e7e899cf6e6e6ee6a60a88572ace7ee6e866"
    "d70532b47b405aa06cd1930dd7ba08202ad2762375cf677c928515b70be43f3ebc6067f83956c012becb01761e097decb3eaa80b6a29bc684a20225fba4d378b"
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

    install -Dm644 "${srcdir}"/freqtrade@.service "${pkgdir}"/usr/lib/systemd/system/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
