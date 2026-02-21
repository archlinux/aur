# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=tl866-wine-git
pkgver=r272.2ee9b87
pkgrel=1
pkgdesc="Wine USB wrapper for TL866xx Xgpro software (run official Windows software on Linux)"
arch=('x86_64')
url="https://github.com/radiomanV/TL866"
license=('GPL2')
depends=('wine' 'libusb')
makedepends=('git' 'mingw-w64-gcc' 'make')
provides=('tl866-wine')
conflicts=('tl866-wine')
options=('!debug')
source=("git+https://github.com/radiomanV/TL866.git")
sha256sums=('SKIP')

pkgver() {
  cd "TL866"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Modify Makefile to inject permissive flags for legacy code
  cd "TL866/wine64"
  sed -i 's/^DLL_CFLAGS      :=/DLL_CFLAGS      := -Wno-int-conversion -Wno-incompatible-pointer-types/' Makefile
  sed -i 's/^LAUNCHER_CFLAGS :=/LAUNCHER_CFLAGS := -Wno-int-conversion -Wno-incompatible-pointer-types/' Makefile
}

build() {
  cd "TL866/wine64"
  make
}

package() {
  cd "TL866/wine64"
  
  # Install location
  install -d "$pkgdir/usr/share/tl866-wine"
  
  # Install binaries and scripts
  install -m755 "usb-broker" "$pkgdir/usr/share/tl866-wine/"
  install -m755 "run.sh" "$pkgdir/usr/share/tl866-wine/"
  install -m644 "shim.dll" "$pkgdir/usr/share/tl866-wine/"
  install -m644 "launcher.exe" "$pkgdir/usr/share/tl866-wine/"
  
  # Install udev rules (important for usb-broker permissions)
  # Renaming to avoid conflicts with 'minipro' or 'tl866-updater-git'
  cd ..
  install -Dm644 "udev/60-minipro.rules" "$pkgdir/usr/lib/udev/rules.d/60-tl866-wine-minipro.rules"
  install -Dm644 "udev/61-minipro-uaccess.rules" "$pkgdir/usr/lib/udev/rules.d/61-tl866-wine-uaccess.rules"
  
  # Install helper script to launch
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/tl866-wine"
#!/bin/bash
usage() {
    echo "Usage: tl866-wine /path/to/Xgpro.exe"
    echo "This will launch Xgpro with the required USB wrapper."
    echo "First time setup: Run this, close Xgpro, then run it again if device is not detected."
}

if [ -z "\$1" ]; then
    usage
    exit 1
fi

export TARGET_EXE="\$1"
shift
exec /usr/share/tl866-wine/run.sh "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/tl866-wine"

  # Docs
  install -Dm644 "wine64/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
