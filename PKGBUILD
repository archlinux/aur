# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.10.13
pkgrel=1
pkgdesc='A program to calculate the ephemerides'
depends=(
    'python'
    'python-kosmorrolib>=1.0.0'
    'python-termcolor'
    'python-tabulate'
    'python-dateutil'
    'python-babel'
)

optdepends=(
    'texlive-bin: PDF creation support'
)

makedepends=(
    'python-pip'
    'python-poetry'
    'ruby-ronn'
)

arch=('any')
url='https://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/Kosmorro/kosmorro/tar.gz/v$pkgver")
sha256sums=("7f16c6367a1e53cb144e2c0a0e0eed77a3569fbcb3c3d54a25d9e9a694495805")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    make i18n manpage build
}

package() {
    PYTHON_VERSION=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    echo "Found Python ${PYTHON_VERSION}."

    SOURCE_DIR="${srcdir}/kosmorro-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip3 install --no-warn-script-location --isolated --ignore-installed --no-deps --root="${pkgdir}/" ${SOURCE_DIR}/dist/kosmorro-${pkgver}-py3-none-any.whl

    mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/man/man7"
    install "$SOURCE_DIR/manpage/kosmorro.1" "${pkgdir}/usr/share/man/man1/kosmorro.1"
    install "$SOURCE_DIR/manpage/kosmorro.7" "${pkgdir}/usr/share/man/man7/kosmorro.7"

    rm -rf ${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/kosmorro/__pycache__
    rm ${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/kosmorro-${pkgver}.dist-info/direct_url.json
}

