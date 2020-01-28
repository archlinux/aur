# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral
_srcname="${_name}-dropbox"

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=0.5.0.r0.g43c3e73
pkgrel=2
pkgdesc='A light-weight and open-source Dropbox client.'
arch=('any')
url="https://github.com/SamSchott/${_srcname}"
license=('MIT')
source=(
    "git+${url}"
    "maestral.service"
    "maestral-config@.service")
makedepends=('git' 'python-setuptools' 'gendesk')
depends=(
    'python-click>=7.0'
    'python-dropbox>=9.4.0'
    'python-watchdog'
    'python-blinker'
    'python-requests'
    'python-u-msgpack'
    'python-keyring>=19.0.0'
    'python-keyrings-alt>=3.0.0'
    'python-pyro5'
    'python-systemd'
    'python-sdnotify')
optdepends=('python-pyqt5: GUI support for runtime')
md5sums=('SKIP'
         '3ba26948bcf8652de28d95e3fd787fdb'
         'c4fb651691cde2218426ca32c69cf859')

prepare() {
    gendesk -q -n \
        --pkgname="${_name}" \
        --exec="${_name} gui" \
        --comment="${pkgdesc}" \
        --categories=Network
}

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
    install -Dm644 "${scrdir}/${_srcname}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
    # Install the icon
    install -Dm644 "${scrdir}/${_srcname}/${_name}/gui/resources/maestral.png" \
        "${pkgdir}/usr/share/pixmaps/${_name}.png"
    # Install the generated desktop file
    install -Dm644 "${srcdir}/${_name}.desktop" -t "${pkgdir}/usr/share/applications"
    # Install the systemd units provided
    install -Dm644 "${srcdir}/maestral.service" "${pkgdir}/usr/lib/systemd/user/maestral.service"
    install -Dm644 "${srcdir}/maestral-config@.service" "${pkgdir}/usr/lib/systemd/user/maestral-config@.service"
}
