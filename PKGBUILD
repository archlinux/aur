# Maintainer: Wensheng Tang <sp3478 at gmail dot com>
pkgname=bisheng-compiler15
pkgver=3.2.0.1
pkgrel=1
pkgdesc="毕昇编译器 3.2：华为基于 LLVM 15 的 C/C++/Fortran 工具链（clang/flang/lld）"
arch=('x86_64')
url="https://www.hikunpeng.com/developer/devkit/compiler/bisheng"
license=('Apache-2.0 WITH LLVM-exception' 'custom')
depends=('gcc-libs' 'zlib')
options=('!strip' 'staticlibs' '!debug')
conflicts=()
# 上游只提供预编译二进制（Kunpeng 归档 x86 tarball），无从源码构建流程
source=("BiShengCompiler-${pkgver}-x86-linux.tar.gz::https://mirrors.huaweicloud.com/kunpeng/archive/compiler/bisheng_compiler/BiShengCompiler-${pkgver}-x86-linux.tar.gz")
sha256sums=('7b6268a45ef0a9ca5af970718fa1ffd58d7d64960130c3c9bf42b749b2a0f43a')

_prefix="/opt/bisheng-compiler15"
_srcdir="BiShengCompiler-${pkgver}-x86-linux"

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}${_prefix%/*}"
    cp -a "${_srcdir}" "${pkgdir}${_prefix}"
    # 上游 tarball 内文件权限为 0550/0640（无 other 位），非 root 用户无法执行；
    # 放开 group/other 的读与执行（可执行文件 0555、普通文件 0644）
    chmod -R go+rX "${pkgdir}${_prefix}"

    # 环境脚本（二进制含 RPATH \$ORIGIN/../lib，仅需设 PATH）
    install -Dm644 /dev/stdin "${pkgdir}${_prefix}/env.sh" <<EOF
# source 本文件以使用毕昇编译器 ${pkgver}（LLVM 15）
# 注意：会把 bisheng 的 clang 放到 PATH 最前，与系统 clang / bisheng-compiler 互斥
export BISHENG_COMPILER_ROOT="${_prefix}"
export PATH="\${BISHENG_COMPILER_ROOT}/bin:\${PATH}"
export MANPATH="\${BISHENG_COMPILER_ROOT}/share/man:\${MANPATH}"
EOF

    install -Dm644 "${pkgdir}${_prefix}/include/llvm/Support/LICENSE.TXT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
}
