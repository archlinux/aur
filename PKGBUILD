# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='extract-otp-secrets'
pkgver='2.13.0'
pkgrel=2
pkgdesc='Extract one time password secrets from QR codes exported by two-factor authentication apps'
arch=('x86_64')
url='https://github.com/scito/extract_otp_secrets'
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'libice' 'libsm' 'mpdecimal' 'tk' 'zbar' 'zlib')
makedepends=('python')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scito/extract_otp_secrets/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ffeb20a75ab062c698ed23de65ae82b4e135bf7e4abc85a1dad1265adf622f996c4ce75b622fa55fd53131ce2b605f4d3f4f6b06ae0f387e5c869203cba9e7fb')

build() {
    cd "extract_otp_secrets-${pkgver}"

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
    cd "extract_otp_secrets-${pkgver}"

    install -Dm755 dist/extract_otp_secrets "${pkgdir}/usr/bin/extract-otp-secrets"
}
