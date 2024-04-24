#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=powershell-empire-git
pkgver=5.9.5.r0.gdc5840e
pkgrel=2
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('python' 'dotnet-sdk-6.0' 'powershell' 'openssl')
makedepends=('git' 'python-poetry' 'findutils' 'coreutils' 'sed' 'openssl')
optdepends=(
    'mysql: stager data can be placed in database'
    'xar: enables generating .dmg stagers'
    'bomutils: enables generating .dmg stagers'
    'jdk-openjdk: enables generating .jar stager'
    'nim: enables generating nim stagers'
    'mingw-w64: enables generating nim stagers'
)
license=('BSD-3-Clause')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("opt/${pkgname%-git}/empire/client/config.yaml" "opt/${pkgname%-git}/empire/server/config.yaml")
source=("${pkgname%-git}::git+https://github.com/BC-SECURITY/Empire.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    # Creating virtualenv with dependencies
    cd "${srcdir}/${pkgname%-git}/"

    # Setting poetry settings and install
    poetry config --local virtualenvs.in-project true
    poetry config --local virtualenvs.prefer-active-python true
    poetry install --no-root --compile

    # grab openssl certs
    cd "${srcdir}/${pkgname%-git}/setup/"
    bash ./cert.sh
}
package() {
    # Installing into opt
    cd "${srcdir}/${pkgname%-git}/"
    find {.venv,empire}/ -type d -exec install -dm755 "${pkgdir}/opt/${pkgname%-git}/{}" \; \
        -or -path '.venv/*' -type f -exec install -D {} "${pkgdir}/opt/${pkgname%-git}/{}" \; \
        -or -path 'empire/*' -type f -exec install -Dm644 {} "${pkgdir}/opt/${pkgname%-git}/{}" \; \
        -or -type l -exec cp -a {} "${pkgdir}/opt/${pkgname%-git}/{}" \;
    install -dm766 "${pkgdir}/opt/${pkgname%-git}/empire"/{client,server}/downloads/
    install -Dm755 "${srcdir}/${pkgname%-git}/empire.py" "${pkgdir}/opt/${pkgname%-git}/empire.py"

    # Installing docs
    cd "${srcdir}/${pkgname%-git}/docs/"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname%-git}/{}" \;

    # Installing executable
    echo -e "#!/bin/bash\ncd /opt/${pkgname%-git}/\n.venv/bin/python3 empire.py \$@" > "${srcdir}/${pkgname%-git}/powershell-empire"
    install -Dm755 "${srcdir}/${pkgname%-git}/powershell-empire" "${pkgdir}/usr/bin/powershell-empire"

    # Installing license
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

    # Adding link to configs
    install -dm755 "${pkgdir}/etc/"
    ln -s "/opt/${pkgname%-git}/empire/client/config.yaml" "${pkgdir}/etc/empire_client.yml"
    ln -s "/opt/${pkgname%-git}/empire/server/config.yaml" "${pkgdir}/etc/empire_server.yml"
}
