# Maintainer: Your Name <your-email@example.com>
pkgbase=xjtutoolbox
pkgname=xjtutoolbox-git
pkgver=1.2.3
pkgrel=22
pkgdesc="仙交百宝箱：西安交通大学一站式校园服务工具"
arch=('any')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')

depends=(
    'python>=3.10'
    'python-pyqt5'
    'python-requests'
    'python-urllib3'
    'python-idna'
    'python-certifi'
    'python-charset-normalizer'
    'python-cryptography'
    'python-pycryptodome'
    'python-pyjwt'
    'python-beautifulsoup4'
    'python-lxml'
    'python-pillow'
    'python-keyring'
    'python-numpy'
    'python-icalendar'
    'python-peewee'
    'python-tqdm'
    'python-pytz'
    'python-markdown'
    'python-colorama'
    'libnotify'
    # AUR 包 (paru 会自动安装)
    'python-fake-useragent'
    'python-plyer'
    'python-darkdetect'
    'python-pyqt-fluent-widgets'
)

# 加入 python-pillow 用于打包时转换图标
makedepends=('git' 'python-pip' 'python-pillow')
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("git+https://github.com/yan-xiaoo/XJTUToolBox.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/XJTUToolBox"

  # 1. 目录准备
  install -dm755 "$pkgdir/opt/$pkgbase"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # 2. 拷贝源码
  cp -r . "$pkgdir/opt/$pkgbase/"
  rm -rf "$pkgdir/opt/$pkgbase/.git"
  rm -rf "$pkgdir/opt/$pkgbase/docs"
  rm -f "$pkgdir/opt/$pkgbase/uv.lock"

  # 3. 启动脚本
  cat <<EOF > "$pkgdir/usr/bin/xjtutoolbox"
#!/bin/sh
export PYTHONDONTWRITEBYTECODE=1
cd /opt/$pkgbase
exec /usr/bin/python app.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/xjtutoolbox"

  # 4. 图标处理 (核心修复)
  echo "正在处理图标..."
  if [ -f "assets/icons/main_icon.ico" ]; then
    # 使用 Python Pillow 将 ico 转为 png，兼容性 MAX
    python -c "from PIL import Image; Image.open('assets/icons/main_icon.ico').save('xjtutoolbox.png', format='PNG')"
    install -Dm644 "xjtutoolbox.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
  else
    echo "⚠️ 警告：未找到 main_icon.ico，尝试使用备用图标..."
    # 备用方案
    if [ -f "assets/logo.png" ]; then
      install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
    fi
  fi

  # 5. 生成 Desktop Entry
  # Icon=xjtutoolbox 会自动去 /usr/share/pixmaps 找 xjtutoolbox.png
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