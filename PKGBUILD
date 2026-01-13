# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=joystickwake
pkgname="${_name}-git"
pkgver=v0.5.1.r0.gc410127
pkgrel=2
pkgdesc='A joystick-aware screen waker'
arch=('any')
url='https://codeberg.org/forestix/joystickwake'
makedepends=('python-setuptools' 'python-docutils')
depends=('python' 'python-pyudev')
conflicts=('joystickwake')
provides=('joystickwake')
license=('MIT')
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  _version=$(python3 -m setuptools_scm 2>&-)
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    exit 1
    #printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  # manpage
  install -d $pkgdir/usr/share/man/man1
  rst2man README.rst joystickwake.1
  gzip joystickwake.1
  mv joystickwake.1.gz $pkgdir/usr/share/man/man1
}

