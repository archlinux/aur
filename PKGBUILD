# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: envolution
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
pkgver=6.21.0
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64')
url="https://www.pyinstaller.org"
license=('LicenseRef-custom')
depends=(
  'glib2'
  'glibc'
  'gstreamer'
  'java-runtime'
  'libgirepository'
  'pyinstaller-hooks-contrib'
  'python'
  'python-altgraph'
  'python-gobject'
  'python-importlib-metadata'
  'python-matplotlib'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-pkg_resources'
  'python-psutil'
  'python-pytest'
  'python-setuptools'
  'python-six'
  'python-urllib3'
  'zlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
#checkdepends=(
#  'python-pillow'
#  'python-psutil'
#  'python-pytest'
#  'python-pytest-xdist'
#  'xmldiff'
#)
optdepends=('python-argcomplete: tab completion for CLI tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyinstaller/pyinstaller/archive/refs/tags/v$pkgver.tar.gz"
        'fortify-source-fix.diff')
sha256sums=('9375443f8832cc96103c7206e5b656e9052f27f293f3d45829f68b79b395257b'
            '46f7cfd082570a3f4c138a868e55dc39deacccbff602ce7e70d033236566fa1b')

prepare() {
  cd "$pkgname-$pkgver"

  # Force bootloader build for the current platform
  # and remove the unnecessary binaries
  #rm -rvf PyInstaller/bootloader/{Darwin,Linux,Windows}*
  rm -rvf PyInstaller/bootloader/{Darwin,Windows}*

  # Apply patch to bootloader build script to avoid redefining _FORTIFY_SOURCE if
  # default makepkg CFLAGS are used, which contain `-Wp,-D_FORTIFY_SOURCE=3`:
  patch -Np1 -i "${srcdir}/fortify-source-fix.diff"
}

build() {
  ls
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"

#  # run only the unit tests
#  pytest tests/unit \
#    -m 'not darwin and not win32' \
#    -n=auto --maxprocesses="${PYTEST_XDIST_AUTO_NUM_WORKERS:-2}" --dist='load'
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 doc/{"$pkgname.1",pyi-makespec.1} -t \
    "$pkgdir/usr/share/man/man1/"
  install -Dm644 COPYING.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et:
