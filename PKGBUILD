#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=powershell-empire
_name=Empire
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
source=("${pkgname%-git}-${pkgver}.tar.gz::https://github.com/BC-SECURITY/Empire/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1cf87ca1a84c807c64d665d4781b885551a45ded877f7e8f575535af6d6c3cd0')

build() {
    chmod +x "$srcdir/Empire-${pkgver}/empire.py"
    # grab openssl certs
    cd "$srcdir/Empire-${pkgver}/setup/"
    bash ./cert.sh
}
package() {
    mkdir -p "$pkgdir/opt/${pkgname}"
    cp -r "$srcdir/Empire-${pkgver}/empire" "$pkgdir/opt/${pkgname}/"
    chmod -R 755 "$pkgdir/opt/${pkgname}"
    install -m755 "$srcdir/Empire-${pkgver}/empire.py" "$pkgdir/opt/${pkgname}/empire.py"
    chmod -R 766 "$pkgdir/opt/${pkgname}/empire/client/downloads/"
    chmod -R 766 "$pkgdir/opt/${pkgname}/empire/server/downloads/"

    mkdir -p "$pkgdir/usr/bin/"
    echo -e "#!/bin/bash\ncd /opt/${pkgname}/\npython3 ./empire.py \$@" > "$pkgdir/usr/bin/powershell-empire"
    chmod +x "$pkgdir/usr/bin/powershell-empire"
}
