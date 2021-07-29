# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-debugserver-bin
pkgver=5.12.1
pkgrel=2
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
source=(
        "${pkgname}-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1626764200205/T-Head-DebugServer-linux-x86_64-V5.12.1-20210716.sh.tar.gz"
        "DebugServer User Guide_v5.10.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1588909480730/C-Sky+Debugger+Server+User+Guide_v5.10.pdf"
        "DebugServer User Guide v5.6.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1588916696490/C-Sky+Debugger+Server+User+Guide+v5.6.pdf")
noextract=()
sha256sums=('054dd396aaf13adf409e31e2ad64e408843f27b892ed5175625bc1a3c781ff75'
            '6a004189c409a66f550c676990c637b08cbad5f928fed6e0309caf95fe1e62c2'
            '6a004189c409a66f550c676990c637b08cbad5f928fed6e0309caf95fe1e62c2')
#validpgpkeys=()

prepare(){
# Decrypt gzexe encrypted shell script
# Origin file 92 Line: tail -n  +$LNUM $0 > tmp.tar.gz
    tail -n +282 "${srcdir}"/*.sh > "${srcdir}/${pkgname}-${pkgver}.gz"
}

package() {
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"
    tar -xf "${srcdir}/${pkgname}-${pkgver}.gz" --no-same-owner --no-same-permissions --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/ld.so.conf.d/${pkgname%-bin}.conf" << EOF
/opt/t-head/${pkgname%-bin}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/env bash
export PATH=/opt/t-head/${pkgname%-bin}:\$PATH
DebugServerConsole.elf "\$@"
EOF
}
