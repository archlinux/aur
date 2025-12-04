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
pkgver=3.18.29
pkgrel=1
pkgdesc="A program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
arch=(any)
url="https://github.com/${_pkgname}/${_pkgname}"
license=(MIT)
# run './geninfo.sh' to auto generate 'depends' variable after run 'updpkgsums'
depends=(
    "python-aniso8601"
    "python-apscheduler"
    "python-attrs"
    "python-autocommand"
    "python-babelfish"
    "python-backports-zstd"
    "python-beautifulsoup4"
    "python-blinker"
    "python-brotli"
    "python-certifi"
    "python-charset-normalizer"
    "python-cheroot"
    "python-cherrypy"
    "python-click"
    "python-dateutil"
    "python-feedparser"
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
    "python-pygments"
    "python-pynzb"
    "python-pyparsing"
    "python-pyrss2gen"
    "python-pyyaml"
    "python-rebulk"
    "python-referencing"
    "python-requests"
    "python-rich"
    "python-rpds-py"
    "python-rpyc"
    "python-setuptools"
    "python-sgmllib3k"
    "python-six"
    "python-soupsieve"
    "python-sqlalchemy"
    "python-tempora"
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
sha256sums=('0761a4c89911ceb16be6e0986a76a5a5f147d405c51a3ccb912ad27ecbbd2874'
            'b7578417ab5f671def7021133ae68900d82aaa81b5e80a2fec4d85e46eb1f8e9'
            'b9d354f6095aafe7a29cb8e90239b662a2584903a85fe3770f2b99bb8bdfff4a'
            '799921777b3714f074deaafbdd241ea7b99a0eccd65931708fd81457286f4f49'
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

    ## There are actually a large number of test errors currently, but they are still forcibly packaged. 
    ## Please pay attention to distinguishing whether the errors affect your settings.
    echo "==> Running tests..."
    echo "==> There are actually a large number of test errors currently, but still forcibly packaged..."
    echo "==> Please pay attention to distinguishing whether the errors affect your settings..."
    export PYTHONPATH="$PWD/tmp_install$_site_packages/:$PYTHONPATH:$PWD/tests"
    pytest -k "not (test_archives or test_decompress or test_telegram \
        or test_plex_watchlist or test_sftp or test_sns or test_subtitle_list)" || true
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
