# Maintainer: Lloyd <lloydzhou@qq.com>
# Contributor: Lloyd <lloydzhou@qq.com>

pkgname=bash-agent
pkgver=4.2.6
pkgrel=1
pkgdesc="A lightweight coding agent that runs in your terminal - Bash/Go/Rust/C editions + tcode tmux UI"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/bash-agent"
license=('MIT')
depends=('bash' 'curl' 'gawk')
makedepends=('go' 'rust' 'make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lloydzhou/bash-agent/archive/refs/tags/v${pkgver}.tar.gz"
        "tcode::https://github.com/lloydzhou/bash-agent/releases/download/v${pkgver}/tcode")
sha256sums=('67a3ce26cb8e850994d875a04091068d5ef1c09a69848ee63a5f51c637d9c64c'
            '74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7')
options=('!strip')

build() {
  cd "${srcdir}/bash-agent-${pkgver}"

  # 1. Build Bash edition (all-in-one script)
  mkdir -p dist
  bash scripts/build.sh dist/agent.sh

  # 2. Build Go edition
  mkdir -p go/.gocache go/.gomodcache
  export GOCACHE="${srcdir}/bash-agent-${pkgver}/go/.gocache"
  export GOMODCACHE="${srcdir}/bash-agent-${pkgver}/go/.gomodcache"
  go -C go mod download
  go -C go build -ldflags="-s -w" -trimpath -o "${srcdir}/bash-agent-${pkgver}/dist/goagent" ./cmd/goagent
  # Go 模块文件默认只读，会导致 makepkg/yaourt 清理临时目录时报权限错误
  chmod -R u+w "${srcdir}/bash-agent-${pkgver}/go/.gomodcache"

  # 3. Build Rust edition
  # makepkg.conf 的 CFLAGS 包含 -flto=auto，会导致 GCC 编译 ring 的 C/汇编代码时
  # 生成 GCC LTO IR 格式的 .o 文件，与 Rust 的 LLVM LTO 冲突，产生 undefined symbol 错误。
  # 必须在 cargo build 前清除 CFLAGS 以避免此问题。
  export CC=gcc
  export CFLAGS=""
  export CXXFLAGS=""
  cd rust
  cargo build --release -j "$(nproc)"
  cd "${srcdir}/bash-agent-${pkgver}"
  cp rust/target/release/rustagent dist/rustagent

  # 4. Build C edition (cagent)
  # -Wno-stringop-truncation / -Wno-format-truncation: gcc 误报，buffer 大小实际够用
  cd c
  make CFLAGS="-std=c11 -Wall -Wextra -Wno-unused-parameter -Wno-stringop-truncation -Wno-format-truncation -O2 -g -D_GNU_SOURCE -Ivendor/linenoise"
  cd "${srcdir}/bash-agent-${pkgver}"
}

package() {
  cd "${srcdir}/bash-agent-${pkgver}"

  # Bash agent (renamed from agent.sh to bash-agent)
  install -Dm755 dist/agent.sh "${pkgdir}/usr/bin/bash-agent"

  # Go agent
  install -Dm755 dist/goagent "${pkgdir}/usr/bin/goagent"

  # Rust agent
  install -Dm755 dist/rustagent "${pkgdir}/usr/bin/rustagent"

  # C agent
  install -Dm755 dist/cagent "${pkgdir}/usr/bin/cagent"

  # ccagent symlink (cagent alias)
  ln -sf cagent "${pkgdir}/usr/bin/ccagent"

  # tcode tmux UI wrapper
  install -Dm755 "${srcdir}/tcode" "${pkgdir}/usr/bin/tcode"

  # Documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/bash-agent/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/bash-agent/CHANGELOG.md"
}
