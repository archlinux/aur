# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='extract-otp-secrets'
pkgver='2.8.3'
pkgrel=1
pkgdesc='Extract one time password secrets from QR codes exported by two-factor authentication apps'
arch=('x86_64')
url='https://github.com/scito/extract_otp_secrets'
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'libice' 'libsm' 'mpdecimal' 'tk' 'zbar' 'zlib')
makedepends=('git' 'python')

source=("${pkgname}-${pkgver}::git+https://github.com/scito/extract_otp_secrets.git#tag=v${pkgver}")
b2sums=('ce86da0e7bbab3b74865b819cd55473e3bcdc85d7ad3a5558ef171074ef26f8256825dc6312280ab06d3b65eb510981ea30c73869ca9633e04eee46f6cb6a8d7')

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
