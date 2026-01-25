# Maintainer: Pasical <pasicalyang@gmail.com>
pkgname=everywhere-git
pkgver=r1092.a94a1ad
pkgrel=1
pkgdesc="Context-aware AI assistant for your desktop. Ready to respond intelligently, seamlessly integrating multiple LLMs and MCP tools."
arch=('x86_64')
url="https://github.com/DearVa/Everywhere"
license=('BSL-1.1')
depends=('dotnet-runtime' 'fontconfig' 'libx11' 'libice' 'libsm' 'hicolor-icon-theme') 
makedepends=('git' 'git-lfs' 'dotnet-sdk') 
provides=('everywhere')
conflicts=('everywhere')

source=("git+https://github.com/DearVa/Everywhere.git#branch=dev-linux")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Everywhere"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Everywhere"
  
  echo "Fixing git remote for LFS..."
  git remote set-url origin "https://github.com/DearVa/Everywhere.git"
  echo "Fetching LFS objects..."
  git lfs install --local
  git lfs pull
  
  echo "Initializing and updating submodules..."
  git submodule update --init --recursive

  echo "Restoring Watchdog for linux-x64..."
  dotnet restore "src/Everywhere.Watchdog/Everywhere.Watchdog.csproj" -r linux-x64

  echo "Restoring Everywhere.Linux for linux-x64..."
  dotnet restore "src/Everywhere.Linux/Everywhere.Linux.csproj" -r linux-x64
}

build() {
  cd "$srcdir/Everywhere"
  
  local _commit_count=$(git rev-list --count HEAD)
  local _dotnet_version="0.6.0.$_commit_count"
  
  echo "Building with Dotnet Version: $_dotnet_version"

  dotnet publish "src/Everywhere.Linux/Everywhere.Linux.csproj" \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    --no-restore \
    -o "bin/publish" \
    /p:Version="$_dotnet_version"
}

package() {
  cd "$srcdir/Everywhere"

  install -d "$pkgdir/usr/lib/everywhere"
  cp -r "bin/publish/"* "$pkgdir/usr/lib/everywhere/"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/everywhere" <<EOF
#!/bin/sh
export LC_CTYPE=en_US.UTF-8
exec /usr/lib/everywhere/Everywhere "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/everywhere"

  install -Dm644 "img/Everywhere-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.Sylinko.Everywhere.png"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/everywhere.desktop" <<EOF
[Desktop Entry]
Name=Everywhere
Comment=Context-aware AI assistant for your desktop.
Exec=everywhere
Icon=com.Sylinko.Everywhere
Type=Application
Categories=Utility;AI;
EOF
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
