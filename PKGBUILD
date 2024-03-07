# Maintainer: Benoit Brummer <trougnouf@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>
# Contributor: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

_name=radicale
pkgname=${_name}-git
pkgver=0.1.r2160.gf4079152
pkgrel=1
pkgdesc="Simple calendar (CalDAV) and contact (CardDAV) server"
arch=(any)
url="https://radicale.org/"
_url="https://github.com/Kozea/radicale"
license=(GPL-3.0-or-later)
provides=("${_name}")
conflicts=("${_name}")
depends=(
  python
  python-bcrypt
  python-dateutil
  python-defusedxml
  python-passlib
  python-pytz
  python-vobject
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-typeguard
  python-waitress
)
backup=(
  'etc/radicale/config'
  'etc/radicale/rights'
  'etc/radicale/users'
)
install=$_name.install
source=(
  git+${_url}.git
  $_name-sysusers.conf
  $_name-tmpfiles.conf
  $_name.service
)
sha512sums=('SKIP'
            '56dffb66e018cfbf158dc5d8fe638b3cb31229945f659aae5623f219bcd1d68ddc375f1633fa8e857a9b2f50c9e05a06efce165370137d6e116a4f187466637f'
            '9d0dd88e4a34e9f97abda1785698e4b2a5e8202063deeb91b84e13c05e00b07e45b8d4d9eca09b9241b1138bbbfdc999dba0135c18f5bc0c08d65b0cd83b367b'
            '0f74a662e2eee56a89f5735e686910043ad5589b638e56a7ad3caa6d3b111cfbf1c131fe1b2ee34ce0d10d2f8a041a183f1382b1e1c9594f7e793c92161ef17a')
b2sums=('SKIP'
        'b3af60e144ef857e42ec672e806e9600265ab7d2ea4a75011de9ab56918a008437afdacb301df210b54424fb7ff1e9a332831c67b2e58fd6bc0a0aa1eebe8909'
        '41916d62f5e3f1060bd21db0722abe837754a4cb915af218c904dafac4b06794f8fde2e34486fb7392777b4738502f3df4c1390b835050045337585b064e23bb'
        '8d7e732bb7430428db2b60ffd8b4b1c3e85cbda4a1b900ae28d80c46a64e97ab484d9cc13aaa2582eeca4063f4e74141754f1e67769d444b08b3663f62cf8bf1')


pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_name
  touch "users"
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect radicale/tests/test_server.py::TestBaseServerRequests::test_root
    --deselect radicale/tests/test_server.py::TestBaseServerRequests::test_ssl
    --deselect radicale/tests/test_server.py::TestBaseServerRequests::test_command_line_interface
    --deselect radicale/tests/test_server.py::TestBaseServerRequests::test_command_line_interface_with_bool_options
    --deselect radicale/tests/test_server.py::TestBaseServerRequests::test_wsgi_server
    --deselect radicale/tests/test_web.py::TestBaseWebRequests::test_internal
    --deselect radicale/tests/test_web.py::TestBaseWebRequests::test_none
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}" $_name/tests
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  # config
  install -vDm 644 {config,rights,users} -t "$pkgdir/etc/$_name/"
  # wsgi
  install -vDm 644 $_name.wsgi -t "$pkgdir/usr/share/$_name/"
  # systemd service
  install -vDm 644 ../$_name.service -t "$pkgdir/usr/lib/systemd/system/"
  # sysusers.d
  install -vDm 644 ../$_name-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_name.conf"
  # tmpfiles.d
  install -vDm 644 ../$_name-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_name.conf"
  # docs
  install -vDm 644 {CHANGELOG,DOCUMENTATION,README}.md -t "$pkgdir/usr/share/doc/$_name/"
}
