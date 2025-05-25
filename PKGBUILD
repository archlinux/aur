# Maintainer: taotieren <admin@taotieren.com>

pkgname=reader-pro-bin
pkgver=3.2.14
pkgrel=1
epoch=
pkgdesc="Read 3 Server Edition"
arch=(any)
url="https://github.com/hectorqin/reader"
license=('GPL-3.0-or-later')
groups=()
depends=(sh
    java-runtime)
makedepends=()
checkdepends=()
optdepends=()
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
backup=(usr/share/java/reader-pro/conf/application.properties)
options=('!debug')
install=
changelog=
source=("reader-server-${pkgver}.zip::${url}/releases/download/v${pkgver}/reader-server-${pkgver}.zip"
    reader-pro.sh
    reader-pro.sysusers
    reader-pro.tmpfiles
    reader-pro-single.service
    reader-pro-multi.service)
noextract=(reader-server-${pkgver}.zip)
sha256sums=('78fcc3cae13703b39c1e20f112a849f49aacdaf4f339da77e25ae391bfee8f23'
            '20ec09cb6a0938212df8dabf5509f595f8f7c0f73394dbee3bf6b77f84509a6e'
            '059e68054efc84a19644366a3006c0501ac75cc5d5db9e2a3b8fac476bac3d8c'
            '250551acd0680c5ea1082803341524316a461c21e3576daa2da666fcd9c71f0c'
            '2c5e488e2ec6231eb8028f2e0438b3cca21057bbeb9ab8f73fa3926087d7de40'
            '1071efb65cfd86dae0a854242a755bf340ef5cb0e4a7c76ef09c653b73b9e94d')
#validpgpkeys=()
build() {
    mkdir -pv ${srcdir}/reader-server-${pkgver}
    bsdtar -xf ${srcdir}/reader-server-${pkgver}.zip -C ${srcdir}/reader-server-${pkgver}
}

package() {
    install -Dm0755 "${srcdir}/reader-pro.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm0644 "${srcdir}/reader-pro.sysusers" "${pkgdir}/usr/lib/sysusers.d/reader-pro.conf"
    install -Dm0644 "${srcdir}/reader-pro.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/reader-pro.conf"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/reader-pro-single.service"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/reader-pro-multi.service"
    install -dm0755 "${pkgdir}/var/lib/reader-pro/" \
        "${pkgdir}/var/log/reader-pro/"

    cd "${srcdir}/reader-server-${pkgver}"
    install -Dm0755 target/reader-pro-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
    install -Dm0644 conf/application.properties "${pkgdir}/usr/share/java/${pkgname%-bin}/conf/application.properties"
    rm -rf ${srcdir}/reader-server-${pkgver}
}
