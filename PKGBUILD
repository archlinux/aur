# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>
# Based on the PKGBUILD from eloaders <eloaders at linux dot pl>

pkgname=i-nex
pkgver=7.6.1
pkgrel=8
pkgdesc="System information tool like hardinfo, sysinfo"
arch=('i686' 'x86_64')
url="http://i-nex.linux.pl/"
license=('LGPL3')
depends=('gambas3-runtime'
         'gambas3-gb-image'
         'gambas3-gb-form'
         'gambas3-gb-desktop'
         'gambas3-gb-qt5'
         'gambas3-gb-desktop-x11'
         'libcpuid'
         'lsb-release'
         'curl'
)
makedepends=('gambas3-dev-tools' 'gcc' 'imagemagick')
source=("https://github.com/i-nex/I-Nex/archive/${pkgver}.tar.gz"
        "Fix-error-if-proc-mtrr-doesn-t-exist.patch"
        "Fix-libcpuid-SOVERSION.patch"
        "Adapt-for-new-libcpuid-structure.patch"
        "Fix-for-gambas-compiler-change.patch"
        "Hack-for-weird-json-issue.patch"
)
sha256sums=('81236eb729fbd29b356762c0883fe295cf1181cc7d14f00b1dfcceb517b47960'
            '5c812da66cf8627e1749722d8e98f0871e6b3dbc30efbce29b785912ff39e96b'
            'a6cee05fcf07c2d2ddbabd4012a3975178c07e0f9d1e876425567d9504eb99cd'
            'fb286cf3bc0b1104e59219e0ba9a236129b20db52b70cd44d65f578404a93cbe'
            'ed09156fda0e85f9135e4cb60a93b2462ed2f7d42326b3349fd7e5abade8b85e'
            '377a045e13f3cdbc4c107cdaaa5cfe373788a0b716f3cbd728cd30b23e8f7233')
conflicts=('i-nex-git')

prepare() {
    cd "${srcdir}/I-Nex-${pkgver}"

    patch -Np1 -i "${srcdir}/Fix-error-if-proc-mtrr-doesn-t-exist.patch"
    patch -Np1 -i "${srcdir}/Fix-libcpuid-SOVERSION.patch"
    patch -Np1 -i "${srcdir}/Adapt-for-new-libcpuid-structure.patch"
    patch -Np1 -i "${srcdir}/Fix-for-gambas-compiler-change.patch"
    patch -Np1 -i "${srcdir}/Hack-for-weird-json-issue.patch"

    sed -i -e 's|^STATIC.*|STATIC = false|' i-nex.mk
    sed -i -e 's|^UDEV_RULES_DIR.*|UDEV_RULES_DIR = /usr/lib/udev/rules.d|' i-nex.mk
    cd "I-Nex"
    autoreconf -i
}

build() {
    cd "${srcdir}/I-Nex-${pkgver}"
    cd "I-Nex"
    ./configure --prefix=/usr
    cd ..
    MAGICK_OCL_DEVICE=OFF make -j1
}

package() {
    cd "${srcdir}/I-Nex-${pkgver}"
    MAGICK_OCL_DEVICE=OFF make -j1 DESTDIR="${pkgdir}/" install
}
