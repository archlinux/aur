# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Space Bunny Free.

pkgname=ingenic-cloner-bin
pkgver=2.5.80.1
pkgrel=2
pkgdesc='USB download tool for the Ingenic SoCs — prebuilt binary, upstream provides no source code'
arch=('x86_64')
url='https://github.com/guglovich/Ingenic-Cloner'
license=('LicenseRef-Unfree')
options=('!strip' '!debug')
depends=('libx11' 'fontconfig' 'freetype2' 'zlib' 'systemd-libs' 'glib2')
optdepends=('android-tools: bundled adb support for connected targets')
install=ingenic-cloner-bin.install

source=("cloner-$pkgver-ubuntu_alpha.tar.gz::https://github.com/guglovich/Ingenic-Cloner/releases/download/v$pkgver/cloner-$pkgver-ubuntu_alpha.tar.gz")
sha256sums=('8951251f348269cb54cb04a1b75e153a786466dfb521fc69bea745b0f6befb86')

package() {
    local src="cloner-$pkgver-ubuntu_alpha"
    local dest="$pkgdir/usr/share/ingenic-cloner"

    install -d "$dest"
    cp -a "$src"/bin "$src"/configs "$src"/ddrs "$src"/firmwares \
          "$src"/lib "$src"/scripts "$src"/security "$src"/securitytool \
          "$dest/"
    install -Dm644 "$src/qm_cn.qm" "$dest/qm_cn.qm"

    # Upstream ships several data files with mode 0600, and the security tooling
    # contains RSA private keys. Normalise the readable data, but keep the private
    # keys restricted: those tools are meant to run as root.
    find "$dest" -type d -exec chmod 755 {} +
    find "$dest" -type f -exec chmod 644 {} +
    find "$dest/bin" -type f -exec chmod 755 {} +
    find "$dest/security" "$dest/securitytool" -type f -exec chmod 600 {} +
    find "$dest/security" "$dest/securitytool" -type d -exec chmod 700 {} +

    # Bundled adb: prefer it when present, but it is not required
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -a "$src"/adb/unix "$pkgdir/usr/lib/$pkgname/" 2>/dev/null || true

    # udev access rules shipped as a package file.
    # Upstream writes these via sudo tee at every launch, which a package must not do.
    # GROUP is "uucp": it is defined by systemd's sysusers.d and therefore always
    # present. "plugdev" is NOT guaranteed to exist (udev silently drops rules whose
    # group does not resolve), which left the device inaccessible.
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/50-ingenic-cloner.rules" <<'EOF'
# Ingenic SoC USB devices used by Cloner (vendor a108).
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="d002", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="1000", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4775", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4785", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="4780", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="c309", MODE="0660", GROUP="uucp"
SUBSYSTEM=="usb", ATTR{idVendor}=="a108", ATTR{idProduct}=="eaef", MODE="0660", GROUP="uucp"
EOF

    # Launcher replacing upstream's ./cloner script.
    #
    # Upstream's script installs a permanent sudoers credential cache
    # (timestamp_timeout=-1) and renames /etc/ld.so.preload. A package must not
    # modify the system that way, so the subcommands are implemented here instead.
    #
    # Installed as "cloner" (project name), not as the AUR package name.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/cloner" <<'EOF'
#!/bin/bash
set -euo pipefail

CLONER_DIR=/usr/share/ingenic-cloner

bits=$(getconf LONG_BIT)
case "$bits" in
    64) arch=64 ;;
    32) arch=32 ;;
    *) echo "$0: unsupported architecture word size: $bits" >&2; exit 1 ;;
esac

BINDIR="$CLONER_DIR/bin/${arch}bit"
GUIBIN="$BINDIR/cloner_${arch}"
COREBIN="$BINDIR/core_${arch}"

export LD_LIBRARY_PATH="$CLONER_DIR/lib/${arch}bit${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

if [[ -x "/usr/lib/ingenic-cloner-bin/unix/${arch}bit/adb" ]]; then
    export PATH="/usr/lib/ingenic-cloner-bin/unix/${arch}bit:$PATH"
fi

# The GUI spawns a "core_<arch>" helper and uses Qt shared-memory IPC for
# single-instance detection. Both survive a crash: an orphaned core_64 makes
# the next launch print "Find another core_64 is running" and die with SIGSEGV,
# and stale /tmp/qipc_*ingenicburner* IPC files do the same. Upstream masked
# this with "sudo killall" in its launcher script; here we clean up only our own
# leftovers, matching the resolved executable path and the file owner so that
# nothing else is ever touched.
stale=()
for pid in $(pgrep -f "$COREBIN" 2>/dev/null || true); do
    if [[ "$(readlink -f "/proc/$pid/exe" 2>/dev/null || true)" == "$COREBIN" ]]; then
        stale+=("$pid")
    fi
done

if (( ${#stale[@]} )); then
    echo "$0: removing stale core_${arch} (pid: ${stale[*]})" >&2
    kill "${stale[@]}" 2>/dev/null || true
    for _ in {1..20}; do
        kill -0 "${stale[0]}" 2>/dev/null || break
        sleep 0.1
    done
    kill -9 "${stale[@]}" 2>/dev/null || true
    sleep 0.5
fi

# Stale single-instance IPC markers left behind by a previous crash.
for f in /tmp/qipc_*ingenicburner*; do
    [[ -e "$f" ]] || continue
    owner=$(stat -c %u "$f" 2>/dev/null || echo 0)
    [[ "$owner" == "$(id -u)" || $EUID -eq 0 ]] || continue
    rm -f "$f" 2>/dev/null || true
done

# The tool resolves configs/, ddrs/ and firmwares/ relative to the working directory.
cd "$CLONER_DIR"

# Since 2.5.80 the core program enumerates USB devices itself at startup and
# needs raw access to the device node: libusb has to claim the interface and
# detach the kernel driver, which requires privileges. Upstream therefore always
# ran the binaries through sudo. Without them the board is not listed at all.
# Upstream additionally installed a permanent sudoers credential cache
# (timestamp_timeout=-1); a package must not do that, so the password is simply
# asked for when it is needed.
run() {
    if [[ $EUID -ne 0 ]] && command -v sudo >/dev/null 2>&1; then
        exec sudo env "LD_LIBRARY_PATH=$LD_LIBRARY_PATH" "$@"
    else
        exec env "LD_LIBRARY_PATH=$LD_LIBRARY_PATH" "$@"
    fi
}

case "${1:-}" in
    no-gui)
        shift
        run "$COREBIN" "$@"
        ;;
    factory)
        shift
        run "$BINDIR/USBClonerFactoryTool_${arch}" "$@"
        ;;
    cfgcli)
        shift
        run "$BINDIR/cfgcli_${arch}" "$@"
        ;;
    help|-h|--help)
        echo "Usage: cloner [command] [options]"
        echo
        echo "  cloner              Start the graphical USBCloner interface (default)"
        echo "  cloner no-gui       Run the core program without the interface"
        echo "  cloner factory      Start the USBCloner factory tool"
        echo "  cloner cfgcli ...   Run the configuration command line tool"
        exit 0
        ;;
    *)
        if [[ ! -x "$GUIBIN" ]]; then
            echo "$0: missing $GUIBIN" >&2
            exit 1
        fi
        run "$GUIBIN" "$@"
        ;;
esac
EOF
}