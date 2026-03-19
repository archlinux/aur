# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='extract-otp-secrets'
pkgver='2.13.0'
pkgrel=1
pkgdesc='Extract one time password secrets from QR codes exported by two-factor authentication apps'
arch=('x86_64')
url='https://github.com/scito/extract_otp_secrets'
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'libice' 'libsm' 'mpdecimal' 'tk' 'zbar' 'zlib')
makedepends=('git' 'python')

source=("${pkgname}-${pkgver}::git+https://github.com/scito/extract_otp_secrets.git#tag=v${pkgver}")
b2sums=('1e939d9bfc237e230ced84f426d74280e2465eb898264da9cb2cb143a01fc52d3bf9b1273940510ed7b22335c91bca4a6b79c5ffe33eeece1e03fad85265d831')

build() {
    cd "${pkgname}-${pkgver}"

    python -m venv venv
    source venv/bin/activate

    pip install --upgrade pip
    pip install --upgrade -r requirements-dev.txt -r requirements.txt

    pyinstaller -y \
        --add-data 'venv/__yolo_v3_qr_detector/:__yolo_v3_qr_detector/' \
        --onefile \
        --name extract_otp_secrets \
        src/extract_otp_secrets.py

    deactivate
    rm -rf venv
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 dist/extract_otp_secrets "${pkgdir}/usr/bin/extract-otp-secrets"
}
