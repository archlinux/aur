# Maintainer: Nlsdt <nlsdt@nlsdt.cc>

# SPDX-License-Identifier: 0BSD
# Copyright (c) 2025 Nlsdt <nlsdt@nlsdt.cc>

# 包元数据
_pkgname=aviator
# https://github.com/killme2008/aviatorscript
pkgname=aviator-shell-bin
pkgver=5.4.3
pkgrel=1
pkgdesc='AviatorScript is a lightweight, high performance scripting language hosted on the JVM (and Android platform). It compiles script to java byte code and evaluate it on the fly.|| AviatorScript 是一门高性能、轻量级寄宿于 JVM （包括 Android 平台）之上的脚本语言。'
# AviatorScript 是一门高性能、轻量级寄宿于 JVM （包括 Android 平台）之上的脚本语言。
arch=('any')
url='https://github.com/killme2008/aviatorscript'
license=('EPL-1.0' 'LGPL-3.0-only')

depends=(
    'java-runtime>=8'
    'bash'
)
provides=('aviator-shell')
conflicts=('aviator-shell')

# 资源获取
source=(
    "$_pkgname::$url/raw/master/bin/$_pkgname"
    "$_pkgname-$pkgver.jar::$url/raw/master/downloads/$_pkgname-$pkgver.jar"
    "LICENSE-aviator::$url/raw/master/licenses.txt"
)

sha256sums=(
    "16eddd657fdb4f8a46a70ac3f8100a3db9801349e9c2003e079c8ff8735c25fd"
    "4d92f5102da1f78de12acd89c38e2597d1a9b822c8f3deca66a66b4974b2597c"
    "da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768"
)

package() {
    # 安装原始脚本
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/_aviator"

    # 安装jar包到self-install
    install -Dm644 "$srcdir/$_pkgname-$pkgver.jar" "$pkgdir/usr/share/aviator_shell/self-installs/$_pkgname-$pkgver.jar"

    # 安装许可证文件
    install -Dm644 "$srcdir/LICENSE-aviator" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # 使用 EOF 安装并创建 wrapper 脚本
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << 'EOF'
#!/bin/bash
#
# SPDX-License-Identifier: CC0-1.0
# Written by <Nlsdt>, dedicated to the public domain.
# See: https://creativecommons.org/publicdomain/zero/1.0/
#
# 用于包装 aviator_shell 启动脚本的包装脚本
# 此脚本拦截会修改安装状态的命令，并为程序设置系统级路径，同时将用户依赖项保留在其主目录中。

# 拦截 upgrade 和 self-install, 这些操作应由 pacman 管理
if [[ "$1" == "self-install" || "$1" == "upgrade" ]]; then
    printf "Error: The '%s' command is managed by the package manager.\n" "$1"
    printf "错误：'%s' 命令由包管理器管理。\n" "$1"
    printf "Please use an AUR helper (e.g. yay, paru) to upgrade this package.\n"
    printf "请使用 AUR 助手 (例如 yay, paru) 升级此软件包。\n"
    exit 1
fi

# 为应用程序的核心文件 (JAR) 设置系统级的 HOME 目录。
export AVIATOR_HOME="/usr/share/aviator_shell"

# 将依赖目录指回用户的主目录，以遵循原始脚本的约定。
export AVIATOR_DEPS="${AVIATOR_DEPS:-$HOME/.aviatorscript/deps}"

# 如果用户依赖目录不存在，则创建它以避免潜在的错误。
mkdir -p "$AVIATOR_DEPS"

# 使用所有原始参数执行位于 /usr/bin/_aviator 的上游脚本。
exec /usr/bin/_aviator "$@"
EOF
}