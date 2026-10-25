# Maintainer: lubuoren <lubuoren@users.noreply.github.com>
# 从 VAIKYRIE.exe 逆向后重写的 Linux 版：.NET 10 + Avalonia。
# 说明：
#   * 构建期需要联网做一次 NuGet 还原（Avalonia 11.3.22 等），这是 .NET 项目的常态；
#   * 用 self-contained 发布，装完不依赖 dotnet-runtime，代价是体积大一些；
#   * 运行时按需：udisks2（LCD 换背景要挂载 U 盘）、parec/pw-cat（音频电平灯效）。

pkgname=vk-sagittarius
pkgver=1.0.7
pkgrel=1
pkgdesc="VK Sagittarius control center (LCD telemetry, ARGB lighting, 4-channel fan curves) for Linux"
arch=('x86_64')
url="https://github.com/lubuoren/vk-sagittarius"
license=('MIT')
depends=(
  'glibc'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libx11'
  'libice'
  'libsm'
  'libxext'
  'libxrandr'
  'libxi'
  'libxcursor'
  'mesa'
)
makedepends=('dotnet-sdk')
optdepends=(
  'udisks2: LCD 换背景时自动挂载设备切出的 U 盘'
  'pulseaudio: parec 提供音频电平（声显频谱灯效）'
  'pipewire: pw-cat 提供音频电平（声显频谱灯效）'
)
options=('!strip')          # .NET 程序 strip 后会损坏调试信息与部分元数据
source=("$pkgname-$pkgver.tar.gz::https://github.com/lubuoren/vk-sagittarius/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('582401b07f34071cf4433b98e151abad0cfa45254a36828bef4199e43d2670a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

  # 单测先跑一遍，挂了就别打包
  dotnet test dotnet/tests/VkSagittarius.Tests/VkSagittarius.Tests.csproj -c Release

  # 先发布后台守护进程，再发布 GUI；两者共用同一个自包含运行时目录
  dotnet publish dotnet/src/VkSagittarius.Daemon/VkSagittarius.Daemon.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:ContinuousIntegrationBuild=true \
    -p:DeterministicSourcePaths=true \
    -p:DebugType=none \
    -p:DebugSymbols=false \
    -p:PathMap="$srcdir=/build" \
    -o "$srcdir/out"

  dotnet publish dotnet/src/VkSagittarius.App/VkSagittarius.App.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:ContinuousIntegrationBuild=true \
    -p:DeterministicSourcePaths=true \
    -p:DebugType=none \
    -p:DebugSymbols=false \
    -p:PathMap="$srcdir=/build" \
    -o "$srcdir/out"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/out/." "$pkgdir/opt/$pkgname/"
  chmod +x "$pkgdir/opt/$pkgname/VkSagittarius.App" "$pkgdir/opt/$pkgname/VkSagittarius.Daemon"
  ln -sf "VkSagittarius.Daemon" "$pkgdir/opt/$pkgname/vksagd"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/VkSagittarius.App" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/vksagd" "$pkgdir/usr/bin/vksagd"

  # udev：让 /dev/hidraw* 对当前登录用户可写，免 sudo
  install -Dm644 packaging/99-vk-sagittarius.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-vk-sagittarius.rules"

  # desktop 入口：Exec/Icon 改成包内路径
  install -d "$pkgdir/usr/share/applications"
  sed -e 's|^Exec=.*|Exec=/usr/bin/vk-sagittarius|' \
      -e 's|^Icon=.*|Icon=vk-sagittarius|' \
      packaging/vk-sagittarius.desktop \
      > "$pkgdir/usr/share/applications/vk-sagittarius.desktop"

  install -Dm644 packaging/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/vk-sagittarius.png"

  # 只跑心跳、不开窗口的常驻模式
  install -Dm644 packaging/vk-sagittarius.service \
    "$pkgdir/usr/lib/systemd/user/vk-sagittarius.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
