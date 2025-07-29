# Maintainer: OrPudding <t3164473115@163.com>
pkgname=astro-box
pkgver=1.1.0
pkgrel=4
pkgdesc="A multifunctional toolbox designed for Xiaomi Vela wearable devices"
arch=('x86_64')
url="https://astrobox.online/"
license=('AGPL3')
depends=('webkit2gtk' 'gtk3' 'jq')

# 定义蓝奏云链接和密码变量 (方便更新)
_share_url="https://searchstars.lanzoue.com/iDIyw3231wxa"
_pwd="db62"

options=('!debug')
# 使用固定的API响应文件名并跳过校验
source=("api-response.json::https://api.dwo.cc/api/zhi?type=down&url=${_share_url}&pwd=${_pwd}")
# 跳过 API 响应的校验
sha256sums=('SKIP')

# 定义 deb 包的校验和
_deb_sha256sum='df347eee8a7877a8d6c7dcdc5553e81c82aedc6de7b048272fbb7a8ea6bdad4e'

prepare() {
  # 解析API响应获取直链
  direct_url="$(jq -r '.data.url' "api-response.json")"
  
  # 下载deb包
  echo "获取直链: $direct_url"
  curl -L -o "AstroBox_${pkgver}_amd64.deb" "$direct_url"
  
  # 检查文件完整性
  echo "正在验证文件完整性..."
  if ! echo "${_deb_sha256sum}  AstroBox_${pkgver}_amd64.deb" | sha256sum -c --quiet; then
    echo "错误：文件校验和不匹配！"
    return 1
  fi

  # 提取deb包中的数据
  ar x "AstroBox_${pkgver}_amd64.deb"
  tar -xf data.tar.gz
}

package() {
  # 复制主程序
  install -Dm755 usr/bin/Astro-Box "$pkgdir/usr/bin/Astro-Box"

  # 复制桌面文件
  install -Dm644 usr/share/applications/AstroBox.desktop \
    "$pkgdir/usr/share/applications/AstroBox.desktop"

  # 复制图标
  for size in 32x32 128x128 256x256@2; do
    install -Dm644 usr/share/icons/hicolor/$size/apps/Astro-Box.png \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/Astro-Box.png"
  done
}
