# Maintainer: li0shang <li0shang@163.com>
pkgname="zed-cn"
pkgver="20260111"
pkgrel=1
pkgdesc=" zed-loc (Zed 汉化) github-TC999/zed-loc"
arch=('x86_64')
license=("custom:Copyright (c) 2015 Abner Lee All Rights Reserved.")
url="https://github.com/TC999/zed-loc"
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TC999/zed-loc/releases/download/20260111/zed-linux-x86_64.tar.gz")
sha512sums=('20a0ce82992d8c1111a1d9f56a4e5960dfb6849902900bc601cabf7d9cec935b7d741a19ba4beda0d37a938d3fc94ff202edafe2de963a9fe7e68138727f25be')

# 解压源码包
prepare() {
  tar -xzf "$pkgname-$pkgver.tar.gz"
}

# 安装到 /opt
package() {
  # 创建目标目录
  install -d "$pkgdir/opt/$pkgname"

  # 复制所有文件到 /opt/软件名
  cp -r "$srcdir/zed-dev.app/"* "$pkgdir/opt/$pkgname/"

  # 设置权限（可选）
  # find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} \;
  # find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} \;

  # 如果需要：添加可执行文件到系统路径
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/zed" "$pkgdir/usr/bin/zed"

  # 安装图标文件
  _icon_sizes=("512x512" "1024x1024")
  for size in "${_icon_sizes[@]}"; do
    if [ -f "$srcdir/zed-dev.app/share/icons/hicolor/$size/apps/zed.png" ]; then
      install -Dm644 "$srcdir/zed-dev.app/share/icons/hicolor/$size/apps/zed.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/zed-cn.png"
    fi
  done

  # 如果需要：桌面文件
  install -Dm644 "$srcdir/zed-dev.app/share/applications/zed-dev.desktop" "$pkgdir/usr/share/applications/zed-cn.desktop"

  # 移除调试符号（避免生成debug包）
  find "$pkgdir" -name "*.debug" -delete
  strip --strip-all "$pkgdir/opt/$pkgname/bin/zed" 2>/dev/null || true
  strip --strip-all "$pkgdir/opt/$pkgname/libexec/zed-editor" 2>/dev/null || true

}
# 明确指定不构建debug包
options=('!debug')
