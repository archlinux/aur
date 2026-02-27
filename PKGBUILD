# Maintainer: Your Name <your.email@example.com>
_pkgname=xjtutoolbox
pkgname=xjtutoolbox-git
pkgver=1.2.5
pkgrel=1
pkgdesc="仙交百宝箱：西安交通大学一站式校园服务工具（Git 最新源码版）"
arch=('any')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

# 1. 官方仓库与 AUR 依赖 (混合依赖)
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
    'qt5-base'
    'qt5-svg'
    'qt5-wayland'
    'python-fake-useragent'
    'python-plyer'
    'python-darkdetect'
)

makedepends=('git' 'python-pip')

source=("git+https://github.com/yan-xiaoo/XJTUToolBox.git")
sha256sums=('SKIP')

# 动态生成版本号
pkgver() {
  cd "XJTUToolBox"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

package() {
  cd "XJTUToolBox"

  # --- 目录准备 ---
  # 注意：这里全部改为了 $_pkgname，确保安装到 /opt/xjtutoolbox
  install -dm755 "$pkgdir/opt/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # --- 源码拷贝 ---
  cp -r . "$pkgdir/opt/$_pkgname/"
  rm -rf "$pkgdir/opt/$_pkgname/.git"
  rm -rf "$pkgdir/opt/$_pkgname/docs"
  rm -f "$pkgdir/opt/$_pkgname/uv.lock"

  # --- 构建隔离环境 (Venv) ---
  python -m venv --system-site-packages "$pkgdir/opt/$_pkgname/venv"
  
  export PYTHONDONTWRITEBYTECODE=1
  "$pkgdir/opt/$_pkgname/venv/bin/pip" install \
    --no-cache-dir \
    --no-compile \
    PyQt-Fluent-Widgets

  # --- 清理与修正 ---
  find "$pkgdir/opt/$_pkgname" -name "*.pyc" -delete
  find "$pkgdir/opt/$_pkgname" -name "__pycache__" -delete
  find "$pkgdir/opt/$_pkgname/venv" -type f -exec sed -i "s|$pkgdir||g" {} +

  # --- 启动脚本 ---
  cat <<EOF > "$pkgdir/usr/bin/xjtutoolbox"
#!/bin/sh
export PYTHONDONTWRITEBYTECODE=1
cd /opt/$_pkgname
exec /opt/$_pkgname/venv/bin/python app.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/xjtutoolbox"

  # --- 资源文件 ---
  echo "正在处理图标..."
  if [ -f "assets/icons/main_icon.ico" ]; then
    python -c "from PIL import Image; Image.open('assets/icons/main_icon.ico').save('xjtutoolbox.png', format='PNG')"
    install -Dm644 "xjtutoolbox.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
  else
    if [ -f "assets/logo.png" ]; then
      install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/xjtutoolbox.png"
    fi
  fi

  # --- Desktop 桌面快捷方式 ---
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
StartupWMClass=xjtutoolbox
EOF
}
