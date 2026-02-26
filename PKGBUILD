# Maintainer: Your Name <your-email@example.com>
pkgbase=xjtutoolbox
pkgname=xjtutoolbox-git
pkgver=1.2.3
pkgrel=23
pkgdesc="仙交百宝箱：西安交通大学一站式校园服务工具（混合依赖模式：Official + AUR + Venv）"
arch=('any')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')

# 1. 官方仓库依赖 (Official Repos)
depends=(
    'python>=3.10'
    'python-pyqt5'             # 核心 GUI 框架
    'python-requests'
    'python-urllib3'
    'python-idna'
    'python-certifi'
    'python-charset-normalizer'
    'python-cryptography'
    'python-pycryptodome'      # Crypto 模块
    'python-pyjwt'             # jwt 模块
    'python-beautifulsoup4'
    'python-lxml'              # 解析核心
    'python-pillow'
    'python-keyring'
    'python-numpy'
    'python-icalendar'
    'python-peewee'
    'python-tqdm'
    'python-pytz'
    'python-markdown'
    'python-colorama'
    'libnotify'                # 系统通知支持
    'qt5-base'
    'qt5-svg'
    'qt5-wayland'
)

# 2. AUR 依赖 (AUR Packages)
# 注意：构建前需确保这些包已安装，否则 makepkg 会报错
depends+=(
    'python-fake-useragent'
    'python-plyer'
    'python-darkdetect'
)

makedepends=('git' 'python-pip')
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("git+https://github.com/yan-xiaoo/XJTUToolBox.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/XJTUToolBox"

  # --- 目录准备 ---
  install -dm755 "$pkgdir/opt/$pkgbase"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # --- 源码拷贝 ---
  cp -r . "$pkgdir/opt/$pkgbase/"
  rm -rf "$pkgdir/opt/$pkgbase/.git"
  rm -rf "$pkgdir/opt/$pkgbase/docs"
  rm -f "$pkgdir/opt/$pkgbase/uv.lock"

  # --- 构建隔离环境 (Venv) ---
  # 仅处理你在 AUR 找不到或版本敏感的库
  # --system-site-packages 是关键：让 venv 能看见系统装好的 pyqt5 和 lxml
  python -m venv --system-site-packages "$pkgdir/opt/$pkgbase/venv"
  
  # --- 补充安装缺失库 ---
  # 仅安装 PyQt-Fluent-Widgets
  # 强制禁用字节码编译，规避 Python 3.14 marshal 错误
  export PYTHONDONTWRITEBYTECODE=1
  "$pkgdir/opt/$pkgbase/venv/bin/pip" install \
    --no-cache-dir \
    --no-compile \
    PyQt-Fluent-Widgets

  # --- 清理与修正 ---
  find "$pkgdir/opt/$pkgbase" -name "*.pyc" -delete
  find "$pkgdir/opt/$pkgbase" -name "__pycache__" -delete
  find "$pkgdir/opt/$pkgbase/venv" -type f -exec sed -i "s|$pkgdir||g" {} +

  # --- 启动脚本 ---
  cat <<EOF > "$pkgdir/usr/bin/xjtutoolbox"
#!/bin/sh
export PYTHONDONTWRITEBYTECODE=1
cd /opt/$pkgbase
exec /opt/$pkgbase/venv/bin/python app.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/xjtutoolbox"

  # --- 资源文件 ---
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