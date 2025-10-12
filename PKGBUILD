# Maintainer: Pulsar33550336 <pulsar33550336@163.com>
# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname='muon-ssh'
pkgver=3.0.0
pkgrel=1
pkgdesc='Graphical SFTP client and terminal emulator (SSH) with helpful utilities.'
arch=('any')
url="https://github.com/devlinx9/muon-ssh"
license=('GPL-3.0-only')
depends=('java-runtime>=21' 'hicolor-icon-theme' 'bash')
makedepends=('java-environment=21' 'maven' 'git')
conflicts=('muon')
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "${pkgname}-git::git+https://github.com/devlinx9/muon-ssh#tag=v${pkgver}"
    "muon-jediterm::git+https://github.com/devlinx9/muon-jediterm#commit=a47b976"
)
sha256sums=('374479a35bd6cce746a8492107eac4c14fd257fb0e1aa79b5af4677e117c4e45'
            '290b17b7eedc7695c059190d6b967151b5d99d68146c498cc5420ff0a3ea659f'
            'SKIP'
            'SKIP')

build() {

    export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"

    cd muon-jediterm

    ./gradlew publishToMavenLocal

    cd ..

    cd ${pkgname}-git/

    mvn clean install
}

package() {
    install -Dm644 "${pkgname}-git/muon-app/target/muonssh_${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${pkgname}-git/muon-app/src/main/resources/muon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/muon-ssh.png"
}
