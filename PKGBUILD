#Maintainer: Nick Cottrell <RadioLogic>
pkgname=powershell-empire
pkgver=5.5.4
pkgrel=1
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('dotnet-sdk-6.0' 'powershell' 'openssl' 'python-docopt' 'python-prompt_toolkit' 'python-terminaltables' 'python-requests' python-socketio python-humanize python-setuptools python-pyperclip uvicorn python-fastapi python-sqlalchemy python-jose python-passlib python-sqlalchemy-utc python-pymysql)
optdepends=(
    'mysql: stager data can be placed in database'
    'xar: enables generating .dmg stagers'
    'bomutils: enables generating .dmg stagers'
    'jdk-openjdk: enables generating .jar stager'
    'nim: enables generating nim stagers'
    'mingw: enables generating nim stagers'
)
license=('BSD-3-Clause')
provides=("${pkgname}")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BC-SECURITY/Empire/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b013f533b71a86fba8a8d79eebabda30c68e88cdf86ce7b4d5041adccc34f71d20c366cb00e5af4236f5f5d034b2fcd3c74c1aa67f17cb8d659c5c324b97c3df')

build() {
    chmod +x "${srcdir}/Empire-${pkgver}/empire.py"
    # grab openssl certs
    cd "${srcdir}/Empire-${pkgver}/setup/"
    bash ./cert.sh
}
package() {
    # Installing into opt
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/Empire-${pkgver}/empire/" "${pkgdir}/opt/${pkgname}/"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"
    install -m755 "${srcdir}/Empire-${pkgver}/empire.py" "${pkgdir}/opt/${pkgname}/empire.py"
    chmod -R 766 "${pkgdir}/opt/${pkgname}/empire/client/downloads/"
    chmod -R 766 "${pkgdir}/opt/${pkgname}/empire/server/downloads/"

    # Installing executable
    mkdir -p "${pkgdir}/usr/bin/"
    echo -e "#!/bin/bash\ncd /opt/${pkgname}/\npython3 ./empire.py \$@" > "${pkgdir}/usr/bin/powershell-empire"
    chmod +x "${pkgdir}/usr/bin/powershell-empire"

    # Installing license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "${srcdir}/Empire-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
