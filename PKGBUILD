# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='extract-otp-secrets'
pkgver='2.11.0'
pkgrel=1
pkgdesc='Extract one time password secrets from QR codes exported by two-factor authentication apps'
arch=('x86_64')
url='https://github.com/scito/extract_otp_secrets'
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'libice' 'libsm' 'mpdecimal' 'tk' 'zbar' 'zlib')
makedepends=('git' 'python')

source=("${pkgname}-${pkgver}::git+https://github.com/scito/extract_otp_secrets.git#tag=v${pkgver}")
b2sums=('8327d93e200ac20c43af56ac698d8cf4bf197770fe32d046951ce8b12e1d099feee207faf1c038d40edae652ff5eb24397feb4716cc380d2bcae0949bb1d7dba')

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
