# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=python-pandare
_pkgname=pandare
pkgver=1.8.85
pkgrel=1
pkgdesc='Python interface for PANDA dynamic analysis'
arch=('x86_64')
url='https://github.com/panda-re/panda'
license=('GPL-2.0-only')
depends=('python' 'python-cffi' 'python-protobuf' 'python-colorama' 'panda-re')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${_pkgname}-${pkgver}-py3-none-any.whl::https://github.com/panda-re/panda/releases/download/v${pkgver}/${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('e5a29834f854729a394ce0f701c1386fa12b7b7bc07dfd95290c5ce7a4152623')

latestver() {
    curl -fsSL https://pypi.org/pypi/pandare/json | jq -r '.info.version // empty'
}

prepare() {
    mkdir -p "${_pkgname}-${pkgver}"
    bsdtar -xf "${_pkgname}-${pkgver}-py3-none-any.whl" -C "${_pkgname}-${pkgver}"
}

build() {
    python -m compileall -q "${_pkgname}-${pkgver}/pandare"
}

check() {
    PYTHONPATH="$srcdir/${_pkgname}-${pkgver}" python -c 'import pandare'
}

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_pkgname}-${pkgver}-py3-none-any.whl"

    # Upstream's wheel looks for PANDA under /usr/local; Arch installs it under /usr.
    local purelib
    purelib=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    sed -i 's|system_build = "/usr/local/bin/"|system_build = "/usr/bin/"|' \
        "${pkgdir}${purelib}/pandare/utils.py"
}
