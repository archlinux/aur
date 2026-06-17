# Maintainer: Your Name <your.email@example.com>
pkgbase=xjtutoolbox
pkgname=xjtutoolbox
pkgver=1.3.2
pkgrel=1
pkgdesc="仙交百宝箱：西安交通大学一站式校园服务工具（混合依赖模式：Official + AUR + Venv）"
arch=('any')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('GPL3')

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
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yan-xiaoo/XJTUToolBox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a15dda40dfff0b314fe1b1398bc100e842fdeaebc58dd2b24e67e5f602619129')

package() {
  cd "XJTUToolBox-${pkgver}"

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
  python -m venv --system-site-packages "$pkgdir/opt/$pkgbase/venv"
  
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
