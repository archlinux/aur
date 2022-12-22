# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="nzbhydra2-bin"
pkgver=4.7.6
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers."
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
provides=('nzbhydra2')
conflicts=('nzbhydra2')
depends=('python' 'java-runtime-headless<=17' 'java-runtime-headless>=8')
optdepends=('jackett: torrent indexer proxy')
source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
        'nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers'
        'nzbhydra2.sh'
        'wrapper-remove-base-path-checks.patch'
        'wrapper-remove-update-support.patch')

sha256sums=('14a0f457e5f28abb8b0852b2b4980be8d24896ee073f3efaf46b4ad6c105313e'
            '2fae64a1c5979d9f7b508f1e15d0f013b7cca1f2bbbdae56f546f4c362146b68'
            'a9ceeed2b50d55c5e554c0d4c615e855fe4d3889eb118e37908fa04ffb7cb003'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a'
            '57b65e56459324a7665d3642a04bb9c3ddff96659511c07f995b6158531a3b58'
            'fd6ba3e8b22f3f90c19d9903445b2539837dca1c12df49863b2e8d1085d88b0e'
            'f302b8dc8ed95ce18d67305a0460b1e62a4e4586fba0f77d3dd980a77cfba3d4')

prepare() {
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-base-path-checks.patch"
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-update-support.patch"
}

package() {
    install -D -m 755 "${srcdir}/nzbhydra2.sh" "${pkgdir}/usr/bin/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2wrapperPy3.py" "${pkgdir}/usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py"
    install -D -m 644 "${srcdir}/lib/core-${pkgver}-exec.jar" "${pkgdir}/usr/share/java/nzbhydra2/core-${pkgver}-exec.jar"
    install -D -m 644 "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/nzbhydra2/readme.md"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}
