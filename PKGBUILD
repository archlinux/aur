# Maintainer: Your Name <your-email@example.com>
pkgname=xjtutoolbox
pkgver=v1.2.3
pkgrel=1
pkgdesc="仙交百宝箱：西安交通大学一站式校园服务工具（包含课表、成绩、评教、自动抢课助手等）"
arch=('any')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')

# 核心依赖说明：
# python-pyside6: GUI 界面
# python-requests: 网络请求
# python-beautifulsoup4 & python-lxml: 网页解析
# python-cryptography: 处理学校登录系统的加密
# python-pillow: 验证码显示与图像处理
# python-keyring: 安全存储保存的密码
depends=(
    'python'
    'pyside6'
    'python-requests'
    'python-cryptography'
    'python-beautifulsoup4'
    'python-lxml'
    'python-pillow'
    'python-keyring'
    'python-numpy'
)

makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/yan-xiaoo/XJTUToolBox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"

  # 创建目录
  install -dm755 "$pkgdir/opt/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # 拷贝源码
  cp -r * "$pkgdir/opt/$_pkgname/"

  # 启动脚本
  cat <<EOF > "$pkgdir/usr/bin/xjtutoolbox"
#!/bin/sh
cd /opt/$_pkgname
exec python main.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/xjtutoolbox"

  # 图标处理：根据仓库实际路径，通常图标在 assets 目录下
  # 尝试匹配常见的 logo 文件名
  if [ -f "assets/logo.png" ]; then
    install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
  elif [ -f "assets/icon.png" ]; then
    install -Dm644 "assets/icon.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
  fi

  # Desktop 文件
  cat <<EOF > "$pkgdir/usr/share/applications/xjtutoolbox.desktop"
[Desktop Entry]
Name=XJTUToolBox
GenericName=XJTU Toolkit
Comment=西安交通大学一站式校园服务工具
Exec=xjtutoolbox
Icon=xjtutoolbox
Type=Application
Terminal=false
Categories=Utility;Education;Qt;
StartupNotify=true
EOF
}
