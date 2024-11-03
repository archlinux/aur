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
pkgver=3.11.54
pkgrel=1
pkgdesc="A multipurpose automation tool for all of your media"
arch=(any)
url="https://github.com/$_pkgname/$_pkgname"
license=(MIT)
depends=(
    python-apscheduler
    python-beautifulsoup4
    python-certifi
    python-cherrypy
    python-feedparser
    python-flask-compress
    python-flask-cors
    python-flask-login
    python-flask-restx
    python-guessit
    python-html5lib
    python-loguru
    python-pendulum
    python-psutil
    python-pynzb
    python-pyparsing
    python-pyrss2gen
    python-pyyaml
    python-requests
    python-rich
    python-rpyc
    python-soupsieve
    python-sqlalchemy
    python-zstandard
    python-zxcvbn
)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=("$pkgname-webui: webui v2"
            "$pkgname-webui-v1: webui v1"
            "python-boto3: SNS output plugin"
            "python-plexapi: plex support"
            "python-pysftp: sftp support"
            "subliminal: subtitles support")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname@.service"
        "$pkgname.user.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('9ea4bde9a1e5107df6c51b8d49a7fa27aaac114795eae2d9d6d3c723f1c7706b'
            'b7578417ab5f671def7021133ae68900d82aaa81b5e80a2fec4d85e46eb1f8e9'
            'b9d354f6095aafe7a29cb8e90239b662a2584903a85fe3770f2b99bb8bdfff4a'
            '799921777b3714f074deaafbdd241ea7b99a0eccd65931708fd81457286f4f49'
            '919115d2ce9bdc49161c38897dc4b0b7fe9682c15b3f1a6b2c557a8534af6915'
            '81625d5cd816eadb179974a68a1a2ce80f316cd8e097c0d873f0aa7ead794909')
options=("!strip")

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    install -Dm644 "$pkgname.service"      "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname@.service"     "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
    install -Dm644 "$pkgname.user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 "$pkgname.sysusers"     "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles"     "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -sf "/usr/share/flexget-webui/v1/app"  "$pkgdir/$site_packages/$pkgname/ui/v1/app"
    ln -sf "/usr/share/flexget-webui/v2/dist" "$pkgdir/$site_packages/$pkgname/ui/v2/dist"
}
