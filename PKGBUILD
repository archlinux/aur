# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral
_srcname="${_name}-dropbox"

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=1.1.0.r2.g998cefc
pkgrel=1
pkgdesc='A light-weight and open-source Dropbox client.'
arch=('any')
url="https://github.com/SamSchott/${_srcname}"
license=('MIT')
source=("git+${url}" "maestral@.service")
makedepends=('git' 'python' 'python-setuptools')
depends=(
  'python>=3.8'
  'python-atomicwrites>=1.0.0'
  'python-bugsnag'
  'python-click>=7.1.1'
  'python-dropbox>=10.0.0'
  'python-fasteners'
  'python-importlib-metadata'
  'python-jeepney'
  'python-keyring>=19.0.0'
  'python-keyrings-alt>=3.1.0'
  'python-packaging'
  'python-pathspec>=0.5.8'
  'python-pyro5>=5.7'
  'python-requests'
  'python-sdnotify'
  'python-setuptools'
  'python-watchdog>=0.10.0'
  )
optdepends=('maestral-qt: QT frontend for maestral')
md5sums=('SKIP'
         '841d7d34ae18d512e3d2fbe453702744')

pkgver() {
  cd "${srcdir}/${_srcname}"
  git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
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
