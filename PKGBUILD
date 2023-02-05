# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="nzbhydra2-bin"
pkgver=5.1.2
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers."
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
provides=('nzbhydra2')
conflicts=('nzbhydra2')
depends=('python' 'java-runtime-headless=17')
optdepends=('jackett: torrent indexer proxy')
source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-generic.zip"
        'nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers'
        'nzbhydra2.sh'
        'wrapper-remove-base-path-checks.patch'
        'wrapper-remove-update-support.patch'
        'wrapper-remove-release-type-detection.patch')

sha256sums=('d23578489cb22a71234df27a737ad34814942d6afc19d35501100c0dc98ab9e0'
            '2fae64a1c5979d9f7b508f1e15d0f013b7cca1f2bbbdae56f546f4c362146b68'
            'a9ceeed2b50d55c5e554c0d4c615e855fe4d3889eb118e37908fa04ffb7cb003'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a'
            '2b1a23614959c2402e367891177fc10a3d9aa3b4cce13219a8b4edf44670d398'
            '5660f26303826a0b8bf3f7c198c39e345e87b799e2304a79db5a77992d09cda4'
            '35100f4e7ab5a480f5554d9abd32e8abac20d56f873f82ecbc906d0b3fdadc73'
            'defb77e7b19c6abfc8380cd175bc04062a0c52d1042b8e02173133367152c8e2')

prepare() {
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-base-path-checks.patch"
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-update-support.patch"
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-release-type-detection.patch"
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
