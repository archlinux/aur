# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: S. Leduc <sebastien@sleduc.fr>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_name=Flexget
pkgver=3.11.14
pkgrel=1
pkgdesc="Multipurpose automation tool for downloading media content from different sources"
arch=(any)
url="https://github.com/flexget/flexget"
license=(MIT)
depends=(
  libnotify
  python
  python-apscheduler
  python-babelfish
  python-beautifulsoup4
  python-cherrypy
  python-cloudscraper
  python-dateutil
  python-dnspython
  python-feedparser
  python-flask
  python-flask-compress
  python-flask-cors
  python-flask-login
  python-flask-restx
  python-gobject
  python-guessit
  python-html5lib
  python-jinja
  python-jsonschema
  python-loguru
  python-lxml
  python-packaging
  python-paramiko
  python-pendulum
  python-pillow
  python-psutil
  python-pynzb
  python-pyparsing
  python-pyrss2gen
  python-pysftp
  python-rebulk
  python-referencing
  python-requests
  python-rich
  python-rpyc
  python-sqlalchemy
  python-typing-extensions
  python-werkzeug
  python-yaml
  python-zxcvbn
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-boto3
  python-plexapi
  python-pytest
  python-rarfile
  python-transmissionrpc
  python-vcrpy
)
optdepends=(
  'python-boto3: SNS output plugin'
  'python-plexapi: Plex support'
  'python-rarfile: decompress plugin'
  'python-transmissionrpc: Transmission support'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "flexget.service"
  "flexget@.service"
)
sha256sums=(
  '2c1e03a843224bd558e24c3a4d5d0329aa6d4e19be39beeb47e0a5ef6fa9784f'
  '117de8d5cbe0ac53ecd3be3e579f2cfa62ef186ab36e382f857059380447c5aa'
  'aceecee5496a34c14c12ed5ad8b97197de32896f358b5aef63a84bf4a419756a'
)

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --deselect flexget/tests/test_decompress.py::TestExtract::test_delete_rar \
    --deselect flexget/tests/test_decompress.py::TestExtract::test_rar
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm644 -t "$pkgdir/usr/lib/systemd/user/" \
    "$srcdir/flexget.service" \
    "$srcdir/flexget@.service"

  install -Dvm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
