# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=jicofo-git
pkgver=1.0.741+0+gadaedbfd
pkgrel=1
pkgdesc="JItsi Meet COnference FOcus git build"
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
        "$pkgname::git+https://github.com/jitsi/jicofo"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
install=install

pkgver() {
    cd "$pkgname"
    printf "1.0.%s" "$(git describe --exclude jitsi-meet_\* --long | sed 's/-/+/g')"
}

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
            'a77c51abdb9467d76e5f17cb9417f901c657838169de8462876c8b4fb9245910'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            'b09f9d1f4193452dc6ef89e80eb1fc67d42b17687af6e8c327de4ad1aa7d7ed2'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'b678d6312313b73dabc590f846cbd38de251ba4fd33ae0d523e4e8722f54c0ac')
