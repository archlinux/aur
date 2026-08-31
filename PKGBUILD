# Maintainer: Wensheng Tang <sp3478 at gmail dot com>
pkgname=bisheng-compiler
pkgver=4.2.0
_hce=hce3
pkgrel=1
pkgdesc="毕昇编译器：华为基于 LLVM 17 的 C/C++/Fortran 工具链（clang/flang/lld）"
arch=('x86_64')
url="https://www.hikunpeng.com/developer/devkit/compiler/bisheng"
license=('Apache-2.0 WITH LLVM-exception' 'custom')
depends=('gcc-libs' 'zlib')
options=('!strip' 'staticlibs' '!debug')
# 上游只提供预编译二进制（HCE yum rpm），无从源码构建流程
source=("bisheng-compiler-${pkgver}-1.${_hce}.x86_64.rpm::https://repo.huaweicloud.com/hce/3.0/os/x86_64/Packages/bisheng-compiler-${pkgver}-1.${_hce}.x86_64.rpm")
sha256sums=('1e7be43315d960515d6527b60c57528d0a645bcaef95cc00d7cb495baeae4502')
noextract=("bisheng-compiler-${pkgver}-1.${_hce}.x86_64.rpm")

_prefix="/opt/bisheng-compiler"

package() {
    cd "${srcdir}"
    # 只取工具链本体，丢弃 HCE 的 /etc/dim /etc/ima 完整性清单
    bsdtar -xf "bisheng-compiler-${pkgver}-1.${_hce}.x86_64.rpm" ./usr/local/bisheng-compiler

    install -dm755 "${pkgdir}${_prefix%/*}"
    cp -a "usr/local/bisheng-compiler" "${pkgdir}${_prefix}"

    # 环境脚本（二进制含 RPATH \$ORIGIN/../lib，无需 LD_LIBRARY_PATH，仅设 PATH）
    install -Dm644 /dev/stdin "${pkgdir}${_prefix}/env.sh" <<EOF
# source 本文件以使用毕昇编译器 ${pkgver}（LLVM 17）
# 注意：会把 bisheng 的 clang 放到 PATH 最前，与系统 clang 互斥
export BISHENG_COMPILER_ROOT="${_prefix}"
export PATH="\${BISHENG_COMPILER_ROOT}/bin:\${PATH}"
export MANPATH="\${BISHENG_COMPILER_ROOT}/share/man:\${MANPATH}"
EOF

    install -Dm644 "${pkgdir}${_prefix}/include/llvm/Support/LICENSE.TXT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
}
