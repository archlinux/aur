# Maintainer: taotieren <admin@taotieren.com>

pkgbase=yami4
pkgname=(libyami4
    python-libyami4
    yami4-core)
pkgver=2.0.0
pkgrel=0
pkgdesc="YAMI4 - Messaging Solution for Distributed Systems"
arch=(x86_64
    aarch64
    riscv64)
url="http://www.inspirel.com/yami4/index.html"
license=('GPL-3.0-or-later')
provides=()
conflicts=()
depends=(
    gcc-libs
    glibc)
makedepends=(
    gawk
    git
    python)
backup=()
options=()
source=("http://www.inspirel.com/${pkgbase}/files/${pkgbase}-gpl-${pkgver}.zip")
sha256sums=('dd599c8d72f08e344c563057d007ff57841910f931bba184dccfa3ad7e9041f1')

build() {
    cd "${srcdir}/${pkgbase}-gpl-${pkgver}/src"

    python_version=$(python --version 2>&1)
    python_version=${python_version#Python }
    python_version=$(echo "$python_version" | awk -F'.' '{print $1"."$2}')
    awk -v python_version="$python_version" '{ gsub("python3.9", "python" python_version); print }' Makefile.common > Makefile.common.tmp
    mv Makefile.common.tmp Makefile.common

    make build
}


package_yami4-core() {
    pkgdesc+=" (core)"
    provides+=(${pkgname})

    cd "${srcdir}/${pkgbase}-gpl-${pkgver}"

    install -Dm0644 lib/libyamicore-fPIC.a -t ${pkgdir}/usr/lib/
    install -Dm0644 lib/libyamicore.a -t ${pkgdir}/usr/lib/
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/ \
    ${pkgdir}/usr/include/
    cp -rv doc/core/* ${pkgdir}/usr/share/doc/${pkgname}/
    cp -rv include/yami4-core ${pkgdir}/usr/include/

    cd src/services/
    install -Dm0755 broker/yami4broker -t ${pkgdir}/usr/bin/
    install -Dm0755 broker/yami4broker.cfg -t ${pkgdir}/etc/${pkgname}/
    install -Dm0755 names/yami4names -t ${pkgdir}/usr/bin/
    install -Dm0755 names/yami4names.cfg -t ${pkgdir}/etc/${pkgname}/
}

package_libyami4() {
    pkgdesc+=" (lib)"
    provides+=(${pkgname})

    cd "${srcdir}/${pkgbase}-gpl-${pkgver}/"

    install -Dm0644 lib/libyamicpp-fPIC.a -t ${pkgdir}/usr/lib/
    install -Dm0644 lib/libyamicpp.a -t ${pkgdir}/usr/lib/
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/ \
    ${pkgdir}/usr/include/
    cp -rv doc/cpp/* ${pkgdir}/usr/share/doc/${pkgname}/
    cp -rv include/yami4-cpp ${pkgdir}/usr/include/
}

package_python-libyami4() {
    pkgdesc+=" (python)"
    provides+=(${pkgname})
    conflicts=()
    depends=(python)

    cd "${srcdir}/${pkgbase}-gpl-${pkgver}/"
    install -Dm0644 lib/libyami4py.so -t ${pkgdir}/usr/lib/
    install -Dm0644 lib/yami.py -t ${pkgdir}/usr/lib/
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
    cp -rv doc/python3/* ${pkgdir}/usr/share/doc/${pkgname}/
}
