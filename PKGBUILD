# Downstream (AUR) Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Upstream Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=torbrowser-launcher-qt6
_pkgname=torbrowser-launcher
pkgver=0.3.9
pkgrel=1
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser in Linux - updated to qt6 until merged upstream"
url="https://github.com/torproject/torbrowser-launcher"
depends=(
  'dbus-glib'
  'gnupg'
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-gpgme'
  'python-packaging'
  'python-pysocks'
  'python-requests'
  'tor'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('apparmor: support for apparmor profiles')
arch=('any')
license=('MIT')
backup=(
  'etc/apparmor.d/local/torbrowser.Browser.firefox'
  'etc/apparmor.d/local/torbrowser.Tor.tor'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/torproject/torbrowser-launcher/archive/v${pkgver}.tar.gz"
        af0d56a0540a301f5f0ca707162696d2ec010c6d.patch
        pyproject.toml)
sha256sums=('386cb590a931772a26a1a00d4fd56169ba7967ecc598984c434e7f4bebf2361e'
            '7fc89baefaaa373a35824ea0d19a128bf600f4372bd8512cefb7647d23e7ee11'
            '11557fc869021485aeba1dd31c06405ea0fbe2290d18de21324fc6f9fcaa7922')
b2sums=('62e4b7b97e358ac25a26f235832b787cd0a5f6067b7a6341c10c6ce159a62686e79b5cbcbddf2515b97582c45c0cc6a887cc7b6784fa21d14d281e540f3341a2'
        'e17ca5610c7481f160a03ed84f52659df608e566f9f4d4c8aa7fd48317fe37817ffd7c823d798a09b4658b9104235270c576a9efbf9972e0c87dd67029d73506'
        '2fe6e2efed71aaf1f976578fbb1b8f523705a3e1bf0409872c6f8e9e3846ff3c87f62cde82f16b49b2098b3d92eb48c80c5acadc754d8420cf0ca56a69b9cb98')
provides=(torbrowser-launcher)

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../af0d56a0540a301f5f0ca707162696d2ec010c6d.patch || true

  [ ! -e pyproject.toml ] # remove our pyproject.toml if upstream already has one
  cp ../pyproject.toml .
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" torbrowser-launcher --help
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/etc/apparmor.d"
  cp -a apparmor/* "${pkgdir}/etc/apparmor.d"
  rm "${pkgdir}/etc/apparmor.d/license.txt"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 apparmor/license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/license.apparmor.txt"
}

# vim:set ts=2 sw=2 et:
