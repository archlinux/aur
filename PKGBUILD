#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=powershell-empire-git
_name=Empire
pkgver=5.1.2
pkgrel=1
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('dotnet-sdk-6.0' 'powershell' 'openssl' 'python-docopt' 'python-prompt_toolkit' 'python-terminaltables' 'python-requests' python-socketio python-humanize python-setuptools python-pyperclip python-uvicorn python-fastapi python-sqlalchemy python-jose python-passlib python-sqlalchemy-utc python-pymysql)
optdepends=(
    'mysql: stager data can be placed in database'
    'xar: enables generating .dmg stagers'
    'bomutils: enables generating .dmg stagers'
    'jdk-openjdk: enables generating .jar stager'
    'nim: enables generating nim stagers'
    'mingw: enables generating nim stagers'
)
license=('BSD-3-Clause')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/BC-SECURITY/Empire.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    chmod +x "$srcdir/${pkgname%-git}/empire.py"
    # grab openssl certs
    cd "$srcdir/${pkgname%-git}/setup/"
    bash ./cert.sh
}
package() {
    mkdir -p "$pkgdir/opt/${pkgname%-git}"
    cp -r "$srcdir/${pkgname%-git}/empire" "$pkgdir/opt/${pkgname%-git}/"
    chmod -R 755 "$pkgdir/opt/${pkgname%-git}"
    install -m755 "$srcdir/${pkgname%-git}/empire.py" "$pkgdir/opt/${pkgname%-git}/empire.py"
    chmod -R 766 "$pkgdir/opt/${pkgname%-git}/empire/client/downloads/"
    chmod -R 766 "$pkgdir/opt/${pkgname%-git}/empire/server/downloads/"

    mkdir -p "$pkgdir/usr/bin/"
    echo -e "#!/bin/bash\ncd /opt/${pkgname%-git}/\npython3 ./empire.py \$@" > "$pkgdir/usr/bin/powershell-empire"
    chmod +x "$pkgdir/usr/bin/powershell-empire"
}
