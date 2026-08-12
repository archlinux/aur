# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: S. Leduc <sebastien@sleduc.fr>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

_pkgname=Flexget
pkgname=${_pkgname,,}
pkgver=3.20.5
pkgrel=1
pkgdesc="A program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
arch=(any)
url="https://github.com/${_pkgname}/${_pkgname}"
license=(MIT)
# run './geninfo.sh' to auto generate 'depends' variable after run 'updpkgsums'
depends=(
    "python-aniso8601"
    "python-annotated-doc"
    "python-apscheduler"
    "python-attrs"
    "python-babelfish"
    "python-beautifulsoup4"
    "python-blinker"
    "python-brotli"
    "python-certifi"
    "python-cffi"
    "python-charset-normalizer"
    "python-cheroot"
    "python-cherrypy"
    "python-click"
    "python-cryptography"
    "python-curl_cffi"
    "python-dateutil"
    "python-feedparser"
    "python-feedparser-sgmllib"
    "python-flask"
    "python-flask-compress"
    "python-flask-cors"
    "python-flask-login"
    "python-flask-restx"
    "python-greenlet"
    "python-guessit"
    "python-html5lib"
    "python-idna"
    "python-importlib_resources"
    "python-itsdangerous"
    "python-jaraco.collections"
    "python-jaraco.context"
    "python-jaraco.functools"
    "python-jaraco.text"
    "python-jinja"
    "python-jsonschema"
    "python-jsonschema-specifications"
    "python-loguru"
    "python-markdown-it-py"
    "python-markupsafe"
    "python-mdurl"
    "python-more-itertools"
    "python-packaging"
    "python-pendulum"
    "python-plumbum"
    "python-portend"
    "python-psutil"
    "python-pycparser"
    "python-pygments"
    "python-pynzb"
    "python-pyparsing"
    "python-pyrss2gen"
    "python-pyscrypt"
    "python-pyyaml"
    "python-rebulk"
    "python-referencing"
    "python-requests"
    "python-rich"
    "python-rpds-py"
    "python-rpyc"
    "python-setuptools"
    "python-shellingham"
    "python-six"
    "python-soupsieve"
    "python-sqlalchemy"
    "python-tempora"
    "python-typer"
    "python-typing_extensions"
    "python-tzdata"
    "python-tzlocal"
    "python-urllib3"
    "python-webencodings"
    "python-werkzeug"
    "python-zc.lockfile"
    "python-zxcvbn"
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-socket' 'python-pytest-xdist' 'python-vcrpy')
optdepends=(
    "flexget-webui-v1: webui v1"
    "flexget-webui: webui v2"
    "python-boto3: aws s3 plugin"
    "python-deluge-client: deluge plugin"
    "python-ftputil: ftp plugin"
    "python-matrix-nio: matrix plugin"
    "python-plexapi: plex plugin"
    "python-paramiko: sftp plugin"
    "python-pysftp: sftp plugin"
    "python-qbittorrent-api: qbittorrent plugin"
    "python-rarfile: rarfile plugin"
    "python-pillow: telegram plugin"
    "python-telegram-bot: telegram plugin"
    "python-h2: telegram plugin"
    "python-socksio: telegram plugin"
    "python-transmission-rpc: transmission plugin"
    "subliminal: subtitles plugin"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('d67cb49cc6c18ed5ddbab3df0e2b5d36e77db3b16bcc9c69c2fb103ef888ba93'
            '8dc5035d934f9163509a7e2f085c45db11857cc7110ff4d096677d3a5622e833'
            'a79330c58603e606511164d9f033fc3b5758144b8df072aead87b70fe510d28d'
            'f9564d79e62b9e4d078e2695ebe062772c89b3f135b25abc6c73bdcd5124fdee'
            '919115d2ce9bdc49161c38897dc4b0b7fe9682c15b3f1a6b2c557a8534af6915'
            '81625d5cd816eadb179974a68a1a2ce80f316cd8e097c0d873f0aa7ead794909')
options=("!strip")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="tmp_install" dist/*.whl

    echo "==> Running tests..."
    echo "==> These tests related to the optional features will be skipped: "
    echo "==> archives, decompress, ftp, matrix, plex_watchlist, sftp, sns, subtitle, telegram, transmission"
    sleep 3
    export PYTHONPATH="$PWD/tmp_install$_site_packages/:$PYTHONPATH:$PWD/tests"
    pytest -k "not (test_archives or test_check_subtitles or test_decompress or test_ftp or test_matrix or test_plex_watchlist or \
        test_sftp or test_sns or test_subtitle_list or test_telegram or test_transmission)" || true
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    install -Dm644 "${pkgname}.service"       "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}@.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "${pkgname}.user.service"  "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"      "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -sf "/usr/share/flexget-webui/v1/app"  "${pkgdir}${site_packages}/${pkgname}/ui/v1/app"
    ln -sf "/usr/share/flexget-webui/v2/dist" "${pkgdir}${site_packages}/${pkgname}/ui/v2/dist"
}
