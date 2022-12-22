# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="nzbhydra2"
pkgver=4.7.6
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers."
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
depends=('python' 'java-runtime-headless<=17' 'java-runtime-headless>=8')
makedepends=('maven' 'java-environment=11')
optdepends=('jackett: torrent indexer proxy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/theotherp/nzbhydra2/archive/refs/tags/v${pkgver}.tar.gz"
        'nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers'
        'nzbhydra2.sh'
        'wrapper-remove-base-path-checks.patch'
        'wrapper-remove-update-support.patch'
        'disable-update-checks.patch'
        'skip-unneeded-builds.patch')

sha256sums=('2c99b92ef1685731116300f2d643c0084fa0f9338fa6b494b0e8dcf7843e5882'
            '2fae64a1c5979d9f7b508f1e15d0f013b7cca1f2bbbdae56f546f4c362146b68'
            'a9ceeed2b50d55c5e554c0d4c615e855fe4d3889eb118e37908fa04ffb7cb003'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a'
            '57b65e56459324a7665d3642a04bb9c3ddff96659511c07f995b6158531a3b58'
            'fd6ba3e8b22f3f90c19d9903445b2539837dca1c12df49863b2e8d1085d88b0e'
            'f302b8dc8ed95ce18d67305a0460b1e62a4e4586fba0f77d3dd980a77cfba3d4'
            '83b4071b2fe02e9a302fda5b9b0de97e7531b6032cdbcb8148e2f0b1fc566a22'
            '693c834e641b54fd940490e522dba49d3f7a9846554181e2d284acdd81d87c38')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/wrapper-remove-base-path-checks.patch"
    patch -p1 < "${srcdir}/wrapper-remove-update-support.patch"
    patch -p1 < "${srcdir}/disable-update-checks.patch"
    patch -p1 < "${srcdir}/skip-unneeded-builds.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    mvn -Dmaven.test.skip -pl core -am clean package
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    mvn -pl core -am test
}

package() {
    install -D -m 755 "${srcdir}/nzbhydra2.sh" "${pkgdir}/usr/bin/nzbhydra2"
    install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/other/wrapper/nzbhydra2wrapperPy3.py" "${pkgdir}/usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py"
    install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/core/target/core-${pkgver}-exec.jar" "${pkgdir}/usr/share/java/nzbhydra2/core-${pkgver}-exec.jar"
    install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/readme.md" "${pkgdir}/usr/share/doc/nzbhydra2/readme.md"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}
