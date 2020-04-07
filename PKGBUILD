# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral
_srcname="${_name}-dropbox"

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=0.6.4.r16.g9ed32e8
pkgrel=1
pkgdesc='A light-weight and open-source Dropbox client.'
arch=('any')
url="https://github.com/SamSchott/${_srcname}"
license=('MIT')
source=("git+${url}" "maestral@.service")
makedepends=('git' 'python' 'python-setuptools')
depends=(
    'python'
    'python-atomicwrites'
    'python-bugsnag'
    'python-click>=7.0'
    'python-dropbox>=9.4.0'
    'python-dropbox<=9.5.0'
    'python-keyring>=19.0.0'
    'python-keyrings-alt>=3.0.0'
    'python-lockfile'
    'python-packaging'
    'python-pathspec'
    'python-pyro5>=5.7'
    'python-requests'
    'python-sdnotify'
    'python-setuptools'
    'python-six>=1.12.0'
    'python-u-msgpack'
    'python-watchdog>=0.9.0'
    'python-systemd')
# python-bugsnag:   AUR dependency (git-version maintained by me)
# python-pyro5:     AUR dependency (git-version maintained by me)
# python-sdnotify:  AUR dependency
# python-u-msgpack: Will probably be dropped in the future
optdepends=('maestral-qt: QT frontend for maestral')
md5sums=('SKIP'
         '841d7d34ae18d512e3d2fbe453702744')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    cd "${srcdir}/${_name}"
    python setup.py build
}

package() {
    # Change into the source git directory
    cd "${srcdir}/${_name}"

    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    # Install the licence
    install -Dm644 "${srcdir}/${_name}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

    # Install the systemd unit provided
    install -Dm644 "${srcdir}/maestral@.service" \
        "${pkgdir}/usr/lib/systemd/user/maestral@.service"
}
