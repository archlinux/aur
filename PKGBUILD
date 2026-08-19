# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jicofo
_tag=1196
_version=1.0+1196

pkgname=${_basename}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="JItsi Meet COnference FOcus nightly build"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime-openjdk=17" "bash")
optdepends=("prosody")
makedepends=(
        "git"
        "java-environment-openjdk=17"
        "unzip" "maven"
)
options=('!strip')
backup=(
  "etc/${pkgname}/config"
  "etc/${pkgname}/logging.properties"
  "etc/${pkgname}/jicofo.conf"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jicofo#tag=${_tag}"
       	"jicofo.conf"
        "config"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
install=install

build() {
        cd "$pkgname"
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
        export PATH=$JAVA_HOME/bin:$PATH
        mvn -DskipTests -Dassembly.skipAssembly=true clean package install
        mvn dependency:copy-dependencies -DincludeScope=runtime
}

package() {
        cd "$srcdir/$pkgname"
        
        DESTDIR="${pkgdir}/usr/lib/${pkgname}"
        CONFDIR="${pkgdir}/etc/${pkgname}"

        install -Dm644 -t "${DESTDIR}/lib" jicofo/target/dependency/*
        install -Dm644 jicofo/target/jicofo*.jar "${DESTDIR}/jicofo.jar"

        install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" "lib/logging.properties"
        install -Dm600 "jicofo/src/main/resources/reference.conf" "${CONFDIR}/jicofo_default.conf"
        install -Dm600 "jicofo-common/src/main/resources/reference.conf" "${CONFDIR}/jicofo_default_common.conf"
        install -Dm600 "jicofo-selector/src/main/resources/reference.conf" "${CONFDIR}/jicofo_default_selector.conf"
        install -Dm755 -t "${DESTDIR}" "resources/jicofo.sh"
        sed -i 's@/var/log/jitsi@/var/log/'${pkgname}'@' "${CONFDIR}/logging.properties"

        cd "$srcdir"
        install -Dm600 -t "${CONFDIR}" "config"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

        install -Dm600 "jicofo.conf" "${CONFDIR}/jicofo.conf"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('8f51649381efd28ead7662d0459641a97806c5095a0f02765b11a8bb7d6650ab'
            '77f2e2d62e9fe38188f41b063496cc10970cc989ed620a64a2251d986d6ac253'
            'c258808de5031c0d72df0aedfd521d07e6c442cd152e75737bdc1d758545521e'
            '548d307aa9f4ffae64b4c9c3e891f4332a8454bd7b271e5b76932c705697ee74'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'a8e5ff30f3737da564f61e7d00cc6e0a8b243da54aa02f94095deaa2f4cceb66')
