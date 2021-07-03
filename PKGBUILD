# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-debugserver-bin
pkgver=V5.10.13_20210416
pkgrel=1
epoch=
pkgdesc="C-Sky Debugger Server"
arch=('x86_64')
url="https://occ.t-head.cn/community/download?id=616215132330000384"
license=('BSD')
groups=()
depends=('bash')
makedepends=("tar")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1618899426711/CSKY-DebugServer-linux-${arch}-${pkgver/_/-}.sh.tar.gz"
        "https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1588909480730/C-Sky+Debugger+Server+User+Guide_v5.10.pdf")
noextract=()
sha256sums=('6d58cb0cbf77e3b5ba74277fa7a0dfc65df2dd1b22d574c13fa3fc445784e355'
            '6a004189c409a66f550c676990c637b08cbad5f928fed6e0309caf95fe1e62c2')
#validpgpkeys=()

prepare(){
# Decrypt gzexe encrypted shell script
# Origin file 92 Line: tail -n  +$LNUM $0 > tmp.tar.gz
    tail -n +277 "${srcdir}/CSKY-DebugServer-linux-${arch}-${pkgver/_/-}.sh" > "${srcdir}/${pkgname}-${pkgver}.gz"
}

build(){
# Extract the installation file
    tar -xf "${srcdir}/${pkgname}-${pkgver}.gz"
    echo "${srcdir}/C-Sky_DebugServer" > csky-debug.conf
}

package() {
    install -dm0755 "${pkgdir}/opt/t-head"
    cp -r "${srcdir}/C-Sky_DebugServer" "${pkgdir}/opt/t-head"
    cp -r "${srcdir}/C-Sky+Debugger+Server+User+Guide_v5.10.pdf" "${pkgdir}/opt/t-head/C-Sky_DebugServer"

    install -Dm0644 "${srcdir}/csky-debug.conf" "${pkgdir}/etc/ld.so.conf.d/csky-debug.conf"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/env bash
export PATH=/opt/t-head/C-Sky_DebugServer:\$PATH
DebugServerConsole.elf \$@
EOF
}
