# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-simpleaudio
_pkgname=py-simple-audio
pkgver=1.0.4
pkgrel=9
pkgdesc='A simple audio playback Python extension'
arch=('x86_64' 'aarch64')
url="https://github.com/hamiltron/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        python312-crash-fix.patch
        python313-compile-fix.patch)
sha256sums=('843f208fd9c2f644cfd5c2c6f795259c53846681fb4df662ab3e5cf2ec8aba28'
            'd24877c6512788b85ccc0dcdf1418aec547f048b17b7f771be958af50758fff8'
            '3ed7a703546438c55f4db9fbedef7ff099de3f01408bf0a870520bd92a6f443c')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # Fix crash with Python 3.12+ (https://github.com/hamiltron/py-simple-audio/issues/72#issuecomment-1902610214)
    patch --no-backup-if-mismatch -Np1 -i ../python312-crash-fix.patch

    # Fix Python 3.13+ build
    patch --no-backup-if-mismatch -Np1 -i ../python313-compile-fix.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

    # Workaround for unittest not respecting PYTHONSAFEPATH
    [ -L simpleaudio_tests ] || ln -s "${_pkgname}-${pkgver}"/tests simpleaudio_tests

    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="${PWD}/${_pkgname}-${pkgver}/build/lib.linux-${CARCH}-cpython-${python_version}" \
        python -m unittest discover -v
}

package() {
    cd "${_pkgname}-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --optimize='1' --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
