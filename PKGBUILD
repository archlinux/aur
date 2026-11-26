# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=msal-extensions
pkgname=python-$_name
pkgver=1.3.1
pkgrel=3
pkgdesc="Microsoft Authentication Library extensions for Python"
arch=('any')
url="https://github.com/AzureAD/microsoft-authentication-extensions-for-python"
license=('MIT')
depends=('python'
         'python-msal')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-gobject'
              'python-pytest'
              'libsecret'
              'org.freedesktop.secrets'
              'xorg-server-xvfb')
optdepends=('python-gobject: libsecret persistence'
            'libsecret: libsecret persistence'
            'org.freedesktop.secrets: libsecret persistence'

            'python-portalocker: portalocker')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'secret-service.py')
sha256sums=('4fd784f391e19a56d1f86c2288f878fb00b2f9e8658b6396dea5eea6baace58b'
            '553e09ceca3e9e8480b186ad4cd63d5240e0fa7c8db572846ffd8b4d9cda35e1')

prepare() {
  cd "microsoft-authentication-extensions-for-python-$pkgver"
  # Give libsecret items a label, so the tests also work with KWallet and other Secret Service providers
  sed -E -i "s/\blabel=(\"\"|'')/label=\"MSAL Extensions\"/" msal_extensions/libsecret.py
}

build() {
  cd "microsoft-authentication-extensions-for-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "microsoft-authentication-extensions-for-python-$pkgver"
  if [[ -n $DBUS_SESSION_BUS_ADDRESS ]]; then
    PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
  else
    PYTHONPATH=$PWD dbus-run-session -- python ../secret-service.py pytest "${pytest_options[@]}" tests
  fi
}

package() {
  cd "microsoft-authentication-extensions-for-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
