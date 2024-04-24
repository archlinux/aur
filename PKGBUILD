#Maintainer: Nick Cottrell <RadioLogic>
pkgname=powershell-empire
pkgver=5.9.5
pkgrel=3
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('python' 'dotnet-sdk-6.0' 'powershell' 'openssl')
makedepends=('tar' 'python-poetry' 'findutils' 'coreutils' 'openssl')
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
backup=("opt/${pkgname}/empire/client/config.yaml" "opt/${pkgname}/empire/server/config.yaml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BC-SECURITY/Empire/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('887501d162fa82d349a803129bd88c090a0f169cf14eeb23babccc5af3a1b37014152632e18ddc1eb54b88c13e4d0c8010f002ff09ff0575711e15d50966f343')

build() {
    # Creating virtualenv with dependencies
    cd "${srcdir}/Empire-${pkgver}/"

    # Setting poetry settings and install
    poetry config --local virtualenvs.in-project true
    poetry config --local virtualenvs.prefer-active-python true
    poetry install --no-root --compile

    # grab openssl certs
    cd "${srcdir}/Empire-${pkgver}/setup/"
    bash ./cert.sh
}

package() {
    # Installing into opt
    cd "${srcdir}/Empire-${pkgver}/"
    find {.venv,empire}/ -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \; \
        -or -path '.venv/*' -type f -exec install -D {} "${pkgdir}/opt/${pkgname}/{}" \; \
        -or -path 'empire/*' -type f -exec install -Dm644 {} "${pkgdir}/opt/${pkgname}/{}" \; \
        -or -type l -exec cp -a {} "${pkgdir}/opt/${pkgname}/{}" \;
    install -dm766 "${pkgdir}/opt/${pkgname}/empire"/{client,server}/downloads/
    install -Dm755 "${srcdir}/Empire-${pkgver}/empire.py" "${pkgdir}/opt/${pkgname}/empire.py"

    # Installing docs
    cd "${srcdir}/Empire-${pkgver}/docs/"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

    # Installing executable
    echo -e "#!/bin/bash\ncd /opt/${pkgname}/\n.venv/bin/python3 empire.py \$@" > "${srcdir}/powershell-empire"
    install -Dm755 "${srcdir}/powershell-empire" "${pkgdir}/usr/bin/powershell-empire"

    # Installing license
    install -Dm644 "${srcdir}/Empire-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Adding link to configs
    install -dm755 "${pkgdir}/etc/"
    ln -s "/opt/${pkgname}/empire/client/config.yaml" "${pkgdir}/etc/empire_client.yml"
    ln -s "/opt/${pkgname}/empire/server/config.yaml" "${pkgdir}/etc/empire_server.yml"
}
