# Maintainer: William Varmus <0@willvar.tw>

pkgname=ossfs2-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="A High Performance OSS POSIX Client for Alibaba Cloud Object Storage Service"
arch=('x86_64')
url="https://www.alibabacloud.com/help/en/oss/developer-reference/ossfs"
license=('LicenseRef-AlibabaCloud')
depends=('glibc')
makedepends=('patchelf')
provides=('ossfs2')
conflicts=('ossfs')
source=("ossfs2_${pkgver}_linux_x86_64.rpm::https://gosspublic.alicdn.com/ossfs/ossfs2_${pkgver}_linux_x86_64.rpm"
        "LICENSE")
sha256sums=('75d21162db5fca746db09d45ac6e47504dd2e1e8ebb2a6ccedf8cdee6aca56c1'
            'SKIP')

prepare() {
    cd "${srcdir}"
    # Extract RPM contents using bsdtar
    bsdtar -xf "ossfs2_${pkgver}_linux_x86_64.rpm"
}

package() {
    cd "${srcdir}"

    # Install binary
    install -Dm755 usr/local/bin/ossfs2 "${pkgdir}/usr/bin/ossfs2"

    # Install bundled fuse3 library
    install -Dm755 usr/local/lib64/ossfs2/libfuse3.so.3 "${pkgdir}/usr/lib/ossfs2/libfuse3.so.3"

    # Patch RPATH to find bundled libfuse3
    patchelf --set-rpath '/usr/lib/ossfs2' "${pkgdir}/usr/bin/ossfs2"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
