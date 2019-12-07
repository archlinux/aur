# Maintainer: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Contributor: Bertrand Ciroux <bertrand.ciroux@gmail.com>
pkgname=blynk-server-bin
pkgver=0.41.12
pkgrel=1
pkgdesc="Blynk server for the Blynk IoT platform"
arch=('any')
url="https://www.blynk.cc/"
license=('GPL3')
depends=('java-runtime-headless>=10')

backup=('etc/blynk/server.properties'
        'etc/blynk/mail.properties'
        'etc/blynk/sms.properties')
install="${pkgname}.install"

source=("server-${pkgver}.jar::https://github.com/blynkkk/blynk-server/releases/download/v${pkgver}/server-${pkgver}.jar"
        "server.properties::https://raw.githubusercontent.com/blynkkk/blynk-server/master/server/core/src/main/resources/server.properties"
        "blynk.service"
        "blynk-server-bin.install"
        "blynk-start.sh"
        "mail.properties.example"
        "sms.properties.example")

noextract=("server-${pkgver}.jar")

sha256sums=("b621be2c5329817e7a0f8bd654db9f8eb37eacc524095177c9cd05889fd3147e"
            "13a711243520d270d8f612d77ec229d21718369426f97e5c4134e6a81c213618"
            "298b02167fec72ac884541f63a660e3e5505afe220084bb72b032d24374a1846"
            "140aefbac5fbfe38c886353079ddca35fbc071d01b7895ea772e7a14fb02fdf0"
            "be2d3b0201ad52baa2bfd4173dc7a6948d67b67e3531379bd92bc0cf390bd97b"
            "7f9c55179c35e4c5c81e068f104c977d2cdb728103a9fef6506780f306c563c1"
            "276644e9d2e68654ae947830b8c048b885d843d7d22c8520abb178e9caba8309")

prepare() {
    sed -ri 's#^(data.folder=).*$#\1/var/lib/blynk#' server.properties 
    sed -ri 's#^(logs.folder=).*$#\1/var/log/blynk#' server.properties 
}

package() {
    install -d ${pkgdir}/{etc,usr/share,var/lib,var/log}/blynk
    install -d ${pkgdir}/usr/bin
    install -Dm644 blynk.service ${pkgdir}/usr/lib/systemd/system/blynk.service
    install -Dm644 server-${pkgver}.jar ${pkgdir}/usr/share/blynk/blynk-server.jar
    install -Dm644 server.properties ${pkgdir}/etc/blynk/
    install -Dm755 blynk-start.sh ${pkgdir}/usr/bin/
}
