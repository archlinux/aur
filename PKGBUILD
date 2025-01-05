# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-debugserver-bin
pkgver=5.18.3
pkgrel=2
epoch=
pkgdesc="C-Sky Debugger Server"
arch=('x86_64')
url="https://www.xrvm.cn/community/download?id=4380347564587814912"
license=('BSD')
groups=()
depends=(
    sh
    gcc-libs
    glibc
    libusb
)
makedepends=(libarchive)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
install=
changelog=
source=(
    "${pkgname}-${pkgver}.sh.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1732244327178/XuanTie-DebugServer-linux-x86_64-V5.18.3-20241119.sh.tar.gz"
    "DebugServer User Guide_v5.18.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1732244783846/Debugger+Server+User+Guide%28ZH-CN%29_20241122.pdf"
)
noextract=()
sha256sums=('7f4de8c22050a8a591677b4cb5d783b47e53c213fd5fd5c2d93952704c578bfc'
            'e6161264c76f5028b55e34d48cbcaeb21829d73dbe94548cdb7b55f1d87de4b9')
#validpgpkeys=()

package() {
    tail -n +285 "${srcdir}"/*${pkgver}*.sh >"${srcdir}/${pkgname}-${pkgver}.tar.gz"

    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner --no-same-permissions --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}"

    install -Dm0644 "${srcdir}"/*.pdf -t "${pkgdir}/opt/t-head/${pkgname%-bin}"

    #     install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" <<EOF
    # setenv PATH "${PATH}:/opt/t-head/${pkgname%-bin}"
    # EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/env bash
export PATH=/opt/t-head/${pkgname%-bin}:\$PATH
cd /opt/t-head/${pkgname%-bin}
exec DebugServerConsole.elf "\$@"
EOF
}
