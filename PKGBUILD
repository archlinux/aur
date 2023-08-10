# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: S. Leduc <sebastien@sleduc.fr>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_name=Flexget
pkgver=3.8.4
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
  python-pillow
  python-plexapi
  python-psutil
  python-pynzb
  python-pyparsing
  python-pyrss2gen
  python-pysftp
  python-rebulk
  python-requests
  python-rich
  python-rpyc
  python-setuptools
  python-sqlalchemy
  python-werkzeug
  python-yaml
  python-zxcvbn
)
optdepends=(
  'python-boto3: SNS output plugin'
  'python-rarfile: decompress plugin'
  'python-transmissionrpc: Transmission support'
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-boto3
  python-pytest
  python-rarfile
  python-transmissionrpc
  python-vcrpy
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "flexget.service"
  "flexget@.service"
)
sha256sums=(
  '63d4d3e357211ee6891a6221d4dbeeffe1aab5374b75e75f8f615877882dae9e'
  'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
  'aceecee5496a34c14c12ed5ad8b97197de32896f358b5aef63a84bf4a419756a'
)

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    -k "\
      not test_rar \
      and not test_delete_rar \
      and not test_list_add \
      and not test_list_match \
      and not test_list_remove \
    "
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dvm644 "$srcdir/$pkgname"{,@}.service -t "$pkgdir/usr/lib/systemd/user/"
}
