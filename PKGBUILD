# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname='extract-otp-secrets'
pkgver='2.8.2'
pkgrel=1
pkgdesc='Extract one time password secrets from QR codes exported by two-factor authentication apps'
arch=('x86_64')
url='https://github.com/scito/extract_otp_secrets'
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'libice' 'libsm' 'mpdecimal' 'tk' 'zbar' 'zlib')
makedepends=('git' 'python')

source=("${pkgname}-${pkgver}::git+https://github.com/scito/extract_otp_secrets.git#tag=v${pkgver}")
b2sums=('ffd92567ed8debe1418ba05d0c6be3f2462e70dc8fd4ef5736ebf2379a76eb73517597e3dfec575675362cb22411769e4bc88176bbde8743cdbd98a2cc22a76f')

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
