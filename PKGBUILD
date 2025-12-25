# Maintainer: Overl1te Overl1teGithub@yandex.ru

pkgname=chronodash
pkgver=2.2.0.r$(git rev-list --count HEAD 2>/dev/null || echo 0).$(git rev-parse --short HEAD 2>/dev/null || echo unknown)
pkgrel=1
pkgdesc="Transparent always-on-top desktop widgets (clocks, weather etc) - latest from crossplatform-Linux branch"
arch=('x86_64')
url="https://github.com/Overl1te/ChronoDash"
license=('GPL3')
depends=('python' 'qt6-base' 'qt6-svg' 'libx11' 'tk' 'glibc')
makedepends=('git' 'python-pip' 'python-wheel' 'python-setuptools')
provides=('chronodash')
conflicts=('chronodash-bin' 'chronodash-git')
source=("git+https://github.com/Overl1te/ChronoDash.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ChronoDash"
  local count=$(git rev-list --count HEAD 2>/dev/null || echo 0)
  local hash=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)
  printf "2.1.0.r%s.%s" "$count" "$hash"
}

prepare() {
  cd "${srcdir}/ChronoDash"
  python -m venv venv
  source venv/bin/activate
  pip install --no-cache-dir --upgrade pip
  pip install --no-cache-dir -r requirements.txt || { echo "Pip install failed!"; exit 1; }
  deactivate
}

build() {
  cd "${srcdir}/ChronoDash"
  source venv/bin/activate
  bash build_arch.sh || { echo "build_arch.sh failed! Check logs."; exit 1; }
  deactivate
}

package() {
  cd "${srcdir}/ChronoDash"

  install -dm755 "$pkgdir/opt/chronodash"
  if [[ -d "dist/ChronoDash" ]]; then
    cp -r dist/ChronoDash/* "$pkgdir/opt/chronodash/"
  elif [[ -d "dist" && -n "$(ls dist/ 2>/dev/null)" ]]; then
    cp -r dist/* "$pkgdir/opt/chronodash/"
  else
    echo "Error: dist/ not found after build!"
    exit 1
  fi

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/chronodash" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH=/opt/chronodash/lib:$LD_LIBRARY_PATH
exec /opt/chronodash/ChronoDash "$@"
EOF
  chmod +x "$pkgdir/usr/bin/chronodash"

  # Иконка
  install -dm755 "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  for icon in assets/icons/{chronodash,logo,app,icon}.png; do
    if [[ -f "$icon" ]]; then
      install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/64x64/apps/chronodash.png"
      break
    fi
  done

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/chronodash.desktop" << EOF
[Desktop Entry]
Name=ChronoDash
Comment=Transparent desktop widgets manager (clocks, weather, metrics)
Exec=chronodash %U
Icon=chronodash
Terminal=false
Type=Application
Categories=Utility;System;
StartupNotify=true
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
