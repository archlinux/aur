# Maintainer: Regaan <regaan48@gmail.com>
pkgname=wshawk
_pkgname=wshawk
pkgver=3.0.1
pkgrel=2
pkgdesc="Enterprise-grade WebSocket security scanner & Web Penetration Testing Toolkit"
arch=('x86_64' 'aarch64')
url="https://github.com/noobforanonymous/wshawk"
license=('ISC')
depends=('python' 'python-aiohttp' 'python-websockets' 'python-socketio' 'python-fastapi' 'python-cryptography' 'python-dnspython' 'python-whois' 'python-yaml' 'uvicorn' 'nodejs' 'electron')
makedepends=('git' 'npm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('wshawk-desktop')
conflicts=('wshawk-git' 'wshawk-bin')
source=("git+https://github.com/noobforanonymous/wshawk.git#tag=v$pkgver")
sha256sums=('SKIP')


build() {
  cd "$_pkgname"

  # 1. Create a temporary venv to run PyInstaller (skips broken system compilers)
  echo "[*] Setting up build environment..."
  python -m venv build-env
  ./build-env/bin/pip install --upgrade pip
  ./build-env/bin/pip install pyinstaller build setuptools wheel

  # 2. Build the Python package wheel
  echo "[*] Building Python wheel..."
  ./build-env/bin/python -m build --wheel --no-isolation

  # 3. Build the Python bridge binary using PyInstaller
  echo "[*] Compiling Python Bridge Sidecar..."
  PYTHONPATH=. ./build-env/bin/pyinstaller wshawk-bridge.spec --noconfirm

  # 4. Build the Desktop App Frontend
  cd desktop
  echo "[*] Installing Node dependencies..."
  npm install
}

package() {
  cd "$_pkgname"

  # 1. Install Python Library/CLI
  python -m installer --destdir="$pkgdir" dist/*.whl 2>/dev/null || python setup.py install --root="$pkgdir" --optimize=1

  # 2. Install Desktop App Assets
  install -dm755 "$pkgdir/usr/lib/$_pkgname-desktop"
  # Copy necessary files for the Electron app
  cp -r desktop/* "$pkgdir/usr/lib/$_pkgname-desktop/"
  
  # 3. Install the Compiled Bridge Binary (Sidecar)
  # WSHawk looks for it in desktop/bin/
  install -dm755 "$pkgdir/usr/lib/$_pkgname-desktop/bin"
  install -m755 "dist/wshawk-bridge" "$pkgdir/usr/lib/$_pkgname-desktop/bin/wshawk-bridge"

  # 4. Create Launcher Script
  install -dm755 "$pkgdir/usr/bin"
  printf "#!/bin/sh\nelectron /usr/lib/$_pkgname-desktop \"\$@\"\n" > "$pkgdir/usr/bin/wshawk-desktop"
  chmod +x "$pkgdir/usr/bin/wshawk-desktop"

  # 5. Icons & Desktop Entry
  install -Dm644 "desktop/src/assets/logo.jpg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wshawk.png"
  
  install -dm755 "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/wshawk.desktop"
[Desktop Entry]
Name=WSHawk
Exec=wshawk-desktop
Icon=wshawk
Type=Application
Categories=Development;Security;
Terminal=false
Comment=Enterprise WebSocket & Web Penetration Testing Toolkit
EOF
}
