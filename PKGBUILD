# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral
_srcname="${_name}-dropbox"

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=1.4.4
pkgrel=1
pkgdesc='A light-weight and open-source Dropbox client.'
arch=('any')
url="https://github.com/SamSchott/${_srcname}"
license=('MIT')
source=("git+${url}#branch=master" "maestral@.service")
makedepends=('git' 'python' 'python-setuptools' 'python-wheel')
depends=(
    'python>=3.9'
    'python-alembic>=1.3'           'python-alembic<1.6'
    'python-click>=8.0.0'
    'python-desktop-notifier>=3.2.2'
    'python-dropbox>=10.9.0'        'python-dropbox<12.0'
    'python-fasteners>=0.15'
    'python-keyring>=22'
    'python-keyrings-alt>=3.1.0'
    'python-packaging'
    'python-pathspec>=0.5.8'
    'python-pyro5>=5.10'
    'python-requests>=2.16.2'
    'python-sdnotify>=0.3.2'
    'python-survey>=3.4.3'          'python-survey<4.0'
    'python-watchdog'
    'python-wheel'
    'python-systemd')
optdepends=('maestral-qt: QT frontend for maestral')
md5sums=('SKIP'
         '841d7d34ae18d512e3d2fbe453702744')

pkgver() {
  cd "${srcdir}/${_srcname}"
  git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

prepare() {
    # Remove version restriction from watchdog; version name seems to be odd in arch repo
    sed -i 's|watchdog>=[\.,0-9]*|watchdog|' "${pkgname}-${pkgver}/setup.py"
}

build() {
  cd "${srcdir}/${_srcname}"
  python setup.py build
}

package() {
  # Change into the source git directory
  cd "${srcdir}/${_srcname}"

  # Run python setup function
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Install the licence
  install -Dm644 "${srcdir}/${_srcname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  # Install the systemd unit provided
  install -Dm644 "${srcdir}/maestral@.service" \
    "${pkgdir}/usr/lib/systemd/user/maestral@.service"
}
