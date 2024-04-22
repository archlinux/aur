#Maintainer: Nick Cottrell <RadioLogic>
pkgname=powershell-empire
pkgver=5.9.5
pkgrel=1
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('dotnet-sdk-6.0' 'powershell' 'openssl')
makedepends=('python-poetry')
optdepends=(
    'mysql: stager data can be placed in database'
    'xar: enables generating .dmg stagers'
    'bomutils: enables generating .dmg stagers'
    'jdk-openjdk: enables generating .jar stager'
    'nim: enables generating nim stagers'
    'mingw-w64: enables generating nim stagers'
)
license=('BSD-3-Clause')
provides=("${pkgname}")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BC-SECURITY/Empire/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('887501d162fa82d349a803129bd88c090a0f169cf14eeb23babccc5af3a1b37014152632e18ddc1eb54b88c13e4d0c8010f002ff09ff0575711e15d50966f343')

build() {
    # Creating virtualenv with dependencies
    cd "${srcdir}/Empire-${pkgver}/"
    virtualenv -p python3 env
    source "${srcdir}/Empire-${pkgver}/env/bin/activate"
    poetry install --no-root --compile
    deactivate

    chmod +x "${srcdir}/Empire-${pkgver}/empire.py"
    # grab openssl certs
    cd "${srcdir}/Empire-${pkgver}/setup/"
    bash ./cert.sh
}

package() {
    # Installing into opt
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/Empire-${pkgver}/empire/" "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/Empire-${pkgver}/env/" "${pkgdir}/opt/${pkgname}/"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"
    install -m755 "${srcdir}/Empire-${pkgver}/empire.py" "${pkgdir}/opt/${pkgname}/empire.py"
    chmod -R 766 "${pkgdir}/opt/${pkgname}/empire/client/downloads/"
    chmod -R 766 "${pkgdir}/opt/${pkgname}/empire/server/downloads/"

    # Installing executable
    mkdir -p "${pkgdir}/usr/bin/"
    echo -e "#!/bin/bash\ncd /opt/${pkgname}/\nsource /opt/${pkgname}/env/bin/activate\npython3 ./empire.py \$@" > "${pkgdir}/usr/bin/powershell-empire"
    chmod +x "${pkgdir}/usr/bin/powershell-empire"

    # Installing license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "${srcdir}/Empire-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
