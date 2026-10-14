# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Space Bunny Free.

pkgname=cloner-bin
pkgver=2.5.36.1
pkgrel=1
pkgdesc='USB download/flashing tool for Ingenic SoCs — prebuilt binary, upstream provides no source code'
arch=('x86_64')
url='https://github.com/Ingenic-community/Cloner'
license=('LicenseRef-Unfree')
options=('!strip' '!debug')
depends=('libx11' 'fontconfig' 'freetype2' 'zlib' 'systemd-libs' 'glib2')
optdepends=('android-tools: bundled adb support for connected targets')
install=cloner-bin.install

source=("cloner-$pkgver-ubuntu_alpha.tar.gz::https://github.com/Ingenic-community/Cloner/releases/download/v2.5.36/cloner-2.5.36.1-ubuntu_alpha.tar.gz")
sha256sums=('87438a0a8aa8af32bc4833c8b3adc7b80dda3e592d00a387957ad5c7b38f854a')

package() {
    local src="cloner-$pkgver-ubuntu_alpha"
    local dest="$pkgdir/usr/share/cloner"

    install -d "$dest"
    cp -a "$src"/bin "$src"/configs "$src"/ddrs "$src"/firmwares \
          "$src"/lib "$src"/scripts "$src"/securitytool \
          "$dest/"

    install -Dm644 "$src/docs/English/USBCloner The Burn tool Quick Guide.pdf" \
        "$pkgdir/usr/share/doc/$pkgname/quick-guide.pdf"
    install -Dm644 "$src/docs/English/USBCloner_Tool_Description_Document_V2.pdf" \
        "$pkgdir/usr/share/doc/$pkgname/tool-description.pdf"

    # Bundled adb: prefer it when present, but it is not required
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -a "$src"/adb/unix "$pkgdir/usr/lib/$pkgname/" 2>/dev/null || true

    # udev access rules shipped as a package file.
    # Upstream writes these via sudo tee at every launch, which a package must not do.
    # GROUP is plugdev (upstream used $LOGNAME, which is invalid in udev rules).
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/50-cloner.rules" <<'EOF'
# Ingenic SoC USB devices used by Cloner (vendor a108).
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="d002", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="1000", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4775", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4785", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4780", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="c309", MODE="0660", GROUP="plugdev"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="eaef", MODE="0660", GROUP="plugdev"
EOF

    # Launcher replacing upstream's ./cloner script, which installs udev rules and
    # ld.so.conf entries through sudo on every run and chowns its own directory.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
set -euo pipefail

CLONER_DIR=/usr/share/cloner

bits=$(getconf LONG_BIT)
case "$bits" in
    64) arch=64 ;;
    32) arch=32 ;;
    *) echo "$0: unsupported architecture word size: $bits" >&2; exit 1 ;;
esac

if [[ ! -x "$CLONER_DIR/bin/${arch}bit/cloner_${arch}" ]]; then
    echo "$0: missing $CLONER_DIR/bin/${arch}bit/cloner_${arch}" >&2
    exit 1
fi

export LD_LIBRARY_PATH="$CLONER_DIR/lib/${arch}bit${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# The tool resolves configs/, ddrs/ and firmwares/ relative to the working directory.
cd "$CLONER_DIR"

if [[ -x "/usr/lib/cloner-bin/unix/${arch}bit/adb" ]]; then
    export PATH="/usr/lib/cloner-bin/unix/${arch}bit:$PATH"
fi

exec "$CLONER_DIR/bin/${arch}bit/cloner_${arch}" "$@"
EOF
}