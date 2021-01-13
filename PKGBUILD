# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jicofo
_tag=695
_version=1.0+695

pkgname=${_basename}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="JItsi Meet COnference FOcus nightly build"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
optdepends=("prosody")
makedepends=(
        "java-environment"
        "unzip" "maven"
)
options=('!strip')
backup=(
  "etc/${pkgname}/config"
  "etc/${pkgname}/logging.properties"
  "etc/${pkgname}/sip-communicator.properties"
  "etc/${pkgname}/jicofo.conf"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jicofo#tag=${_tag}"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)

build() {
        cd "$pkgname"
        mvn clean
        mvn package -DskipTests -Dassembly.skipAssembly=true
        mvn dependency:copy-dependencies -DincludeScope=runtime
}

package() {
        cd "$srcdir/$pkgname"
        
        DESTDIR="${pkgdir}/usr/lib/${pkgname}"
        CONFDIR="${pkgdir}/etc/${pkgname}"

        install -Dm644 -t "${DESTDIR}/lib" target/dependency/*
        install -Dm644 target/jicofo*.jar "${DESTDIR}/jicofo.jar"

	install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" "lib/logging.properties"
        install -Dm600 "src/main/resources/reference.conf" "${CONFDIR}/jicofo.conf"
        install -Dm755 -t "${DESTDIR}" "resources/jicofo.sh"
        sed -i 's@/var/log/jitsi@/var/log/'${pkgname}'@' "${CONFDIR}/logging.properties"

        cd "$srcdir"
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            '8a4d4812f56e1e9b4c2754dc75c8525074aff9e90b1b8888a9982718e8edf287'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            'b187cec31a1f5db1456fa282b38c366df45e8bfdee2ef3ac6128cb5ee3be3f7b'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'a8e5ff30f3737da564f61e7d00cc6e0a8b243da54aa02f94095deaa2f4cceb66')
