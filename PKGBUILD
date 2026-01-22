# Maintainer: rzhli <tayuebuliuhen@gmail.com>
pkgname=longbridge-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="Longbridge Desktop trading platform"
arch=("x86_64")
url="https://longbridge.com/desktop/"
license=("custom")
depends=(
  "glibc" "gtk3" "nss" "alsa-lib" "libxss" "libxtst" "xdg-utils" "libxcrypt-compat"
)
provides=("longbridge")
conflicts=("longbridge")
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://assets.lbctrl.com/github/release/longbridge-desktop/stable/longbridge-v${pkgver}-linux-x86_64.deb")
sha256sums=('5b2c477867f7c0b4bdcfee64a10cdf4c918f8e367308694e279f728145ca501b')

prepare() {
  # 每次构建前清理之前的解压残留，防止重复叠加
  [ -d "data" ] && rm -rf data
  mkdir -p data
  # 预解压 data.tar 到专门的目录
  bsdtar -xf data.tar.* -C data
}

package() {
  # 1. 进入 prepare 阶段准备好的目录
  cd "$srcdir/data"

  # 2. 修正路径并安装到 pkgdir
  # 逻辑：如果存在 usr/local，将其内容整合到 usr
  if [[ -d "usr/local" ]]; then
    # 创建必要的目录结构
    mkdir -p "$pkgdir/usr"
    # 移动 local 下的所有子目录到 usr
    cp -a usr/local/* "$pkgdir/usr/"
  fi

  # 3. 处理可能不在 local 下的其他文件（如果有的话）
  # 有些包会同时存在 usr/bin 和 usr/local/bin
  if [[ -d "usr/share/applications" ]]; then
    cp -a usr/share "$pkgdir/usr/"
  fi

  # 4. 确保主程序可执行
  chmod +x "$pkgdir/usr/bin/longbridge"

  # 5. 按照 Arch 规范安装许可证 (假设文件名为 LICENSE)
  # 如果找不到具体文件，可以指向其官网说明或跳过
  install -Dm644 "$pkgdir/usr/share/doc/longbridge/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
