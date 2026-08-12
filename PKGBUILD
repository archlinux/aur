# Maintainer: Kaley Burdow <kaleidox@comroid.org>

pkgname=bedrock-connect-git
pkgver=0.1
pkgrel=2
pkgdesc="BedrockConnect as an AUR package (Not affiliated with the Developer)"
arch=('any')
url="https://github.com/Pugmatt/BedrockConnect"
license=('GPL-3.0')
makedepends=('maven' 'xq' 'java-environment-common')
checkdepends=('java-environment-common')
depends=('java-runtime-common')
source=("git+https://github.com/Pugmatt/BedrockConnect.git" "bedrockconnect.service" "bedrockconnect.sysusers")
md5sums=('SKIP' 'SKIP' 'SKIP')
options+=("!strip")

build() {
    cd BedrockConnect/serverlist-server
    mvn package
}

check() {
    cd BedrockConnect/serverlist-server
    mvn test
}

package() {
    cd BedrockConnect/serverlist-server
    version="$(cat pom.xml | xq -x '/project/version')"
    install -Dm644 "target/BedrockConnect-$version.jar" "$pkgdir/var/lib/bedrockconnect/BedrockConnect.jar"
    install -Dm644 "$srcdir/bedrockconnect.service" "$pkgdir/usr/lib/systemd/system/bedrockconnect.service"
    install -Dm644 "$srcdir/bedrockconnect.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    chown -R bedrockconnect "$pkgdir/var/lib/bedrockconnect"
}
