# Conditional PKGBUILD - works for both binary (CI/CD) and source (AUR) builds
# Set AUR_BUILD=1 environment variable for AUR source builds

if [[ "${AUR_BUILD}" == "1" ]]; then
  # AUR git package configuration
  pkgname=system-bridge-git
  pkgver=r0.0.0.0
  pkgrel=1
  pkgdesc="A bridge between your systems (git version)"
  makedepends=('git' 'go' 'bun-bin')
  source=("$pkgname::git+https://github.com/timmo001/system-bridge.git")
  md5sums=('SKIP')
else
  # Binary package configuration (CI/CD)
  pkgname=system-bridge
  pkgver=${ARCH_PKGVER}
  pkgrel=1
  pkgdesc="A bridge between your systems"
  source=('system-bridge' 'system-bridge.desktop' 'system-bridge.svg' 'system-bridge-16.png' 'system-bridge-32.png' 'system-bridge-48.png' 'system-bridge-128.png' 'system-bridge-256.png' 'system-bridge-512.png' 'LICENSE')
fi

# Common configuration
arch=('x86_64')
url="https://github.com/timmo001/system-bridge"
license=('Apache-2.0')
depends=('libx11' 'libxtst' 'libxkbcommon' 'libxkbcommon-x11')
provides=('system-bridge')
conflicts=('system-bridge')

# AUR-specific functions
pkgver() {
  if [[ "${AUR_BUILD}" == "1" ]]; then
    if [[ -d "$pkgname" ]]; then
      cd "$pkgname"
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    else
      # Fallback for when source dir doesn't exist (e.g., during --printsrcinfo)
      echo "r0.0.0.0"
    fi
  fi
}

build() {
  if [[ "${AUR_BUILD}" == "1" ]]; then
    cd "$pkgname"
    
    # Use the same build process as your Makefile
    export STATIC_EXPORT=true
    export CGO_ENABLED=1
    
    # Build web client
    make build_client
    
    # Build Go application
    local version="5.0.0-dev+$(git rev-parse --short HEAD)"
    go build -v -ldflags="-X 'github.com/timmo001/system-bridge/version.Version=${version}'" -o "system-bridge" .
  fi
}

package() {
  # Create directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  if [[ "${AUR_BUILD}" == "1" ]]; then
    # AUR source build - files are in the git repo directory
    cd "$srcdir/$pkgname"
    
    # Install binary (built in build() function)
    install -Dm755 system-bridge "$pkgdir/usr/bin/system-bridge"

    # Install files from repo
    install -Dm644 .scripts/linux/system-bridge.desktop "$pkgdir/usr/share/applications/system-bridge.desktop"
    install -Dm644 .resources/system-bridge-dimmed.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/system-bridge.svg"
    install -Dm644 .resources/system-bridge-dimmed-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/system-bridge.png"
    install -Dm644 .resources/system-bridge-dimmed-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/system-bridge.png"
    install -Dm644 .resources/system-bridge-dimmed-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/system-bridge.png"
    install -Dm644 .resources/system-bridge-dimmed-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/system-bridge.png"
    install -Dm644 .resources/system-bridge-dimmed-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/system-bridge.png"
    install -Dm644 .resources/system-bridge-dimmed-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/system-bridge.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    # Binary build - files are copied to srcdir by create-arch.sh
    cd "$srcdir"
    
    # Install binary
    install -Dm755 system-bridge "$pkgdir/usr/bin/system-bridge"

    # Install desktop file and assets
    install -Dm644 system-bridge.desktop "$pkgdir/usr/share/applications/system-bridge.desktop"
    install -Dm644 system-bridge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/system-bridge.svg"
    install -Dm644 system-bridge-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/system-bridge.png"
    install -Dm644 system-bridge-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/system-bridge.png"
    install -Dm644 system-bridge-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/system-bridge.png"
    install -Dm644 system-bridge-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/system-bridge.png"
    install -Dm644 system-bridge-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/system-bridge.png"
    install -Dm644 system-bridge-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/system-bridge.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
