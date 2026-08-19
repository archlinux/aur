# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jicofo
_tag=1189
_version=1.0.1189

pkgname=${_basename}
pkgver=${_version}
pkgrel=2
pkgdesc="JItsi Meet COnference FOcus"
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
sha256sums=('405bcfb8fd1a3e0af21787fbb09afd2f408dc1af5f719c59989273cc030c67f7'
            '77f2e2d62e9fe38188f41b063496cc10970cc989ed620a64a2251d986d6ac253'
            'b69f9485ba55b53fe6d1a8b5e4a37c542641cb205c6f5c0b2cf89d236cc6b562'
            '902229d135e9b949da318f539cbe8f266bdd4e32e514f37d8782ad4562dc791b'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            '9f6fb4759099feefaee6fd44cac5854401e58f7ce929949cbc3994faaa3487d3')
