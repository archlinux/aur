# Maintainer: Lloyd <lloydzhou@qq.com>
# Contributor: Lloyd <lloydzhou@qq.com>

pkgname=bash-agent
pkgver=4.3.5
pkgrel=1
pkgdesc="A lightweight coding agent that runs in your terminal - Bash/Go/Rust/C editions + tcode tmux UI"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/bash-agent"
license=('MIT')
depends=('bash' 'curl' 'gawk')
makedepends=('go' 'rust' 'make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lloydzhou/bash-agent/archive/refs/tags/v${pkgver}.tar.gz"
        "tcode::https://github.com/lloydzhou/bash-agent/releases/download/v${pkgver}/tcode")
sha256sums=('2dd14ecbe503066dc6f2a5882c2751d8b26fd131302b57896bd1a24143240403'
            'b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2')
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

  # 3.5 Build Web agent（与 rust 段共用已清空的 CFLAGS，避免 ring 的 LTO 冲突）
  cd "${srcdir}/bash-agent-${pkgver}/webagent"
  cargo build --release -j "$(nproc)"
  cd "${srcdir}/bash-agent-${pkgver}"
  cp webagent/target/release/webagent dist/webagent

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

  # Web agent
  install -Dm755 dist/webagent "${pkgdir}/usr/bin/webagent"

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
