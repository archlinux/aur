# Maintainer: nathawat <nathawat[at]noreply[dot] codeberg[dot]org>

pkgname=3utools-desktop-bin
pkgver=9.02.009
pkgrel=1
pkgdesc="Apple Device Management Tool"
arch=('x86_64')
depends=('glibc' 'gcc-libs' 'zlib' 'nss' 'alsa-lib' 'freetype2' 'usbmuxd' 'libx11' 'libxext' 'libxfixes' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrender' 'libxrandr' 'libxi' 'libxtst' 'libxau' 'libxdmcp' 'libxcb' 'xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'glib2' 'fontconfig' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11')
optdepends=('xorg-xwayland: for running on Wayland sessions')
url="https://www.3u.com/"
license=('custom')
options=('!debug' '!strip')
provides=("3utools")
replaces=("3utools-bin")
source=("${pkgname}-${pkgver}.deb::https://dl.3u.com/update/v900/dl/linux/x64/com.3u.3utools_${pkgver}_amd64.deb")
b2sums=("6f94cc3e2509ab256e8c731db655cd92fea2597996a12aed0abbf016fad7d428bad15983ce6efe783fda3ea77d2504f558a0694bc97c4f8a04f74f2688c69301")

package() {
  # The .deb is automatically unpacked by makepkg, yielding data.tar.xz
  tar xf data.tar.xz -C "${pkgdir}"

  # Fix directory permissions to match Arch Linux standards (755)
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # Create a symlink in /usr/bin for easy access
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/apps/com.3u.3utools/run.sh "${pkgdir}/usr/bin/3utools"

  # Fix desktop file name
  sed -i 's/^Name=com.3u.3utools/Name=3uTools/' "${pkgdir}/usr/share/applications/com.3u.3utools.desktop"
  sed -i 's/^GenericName=com.3u.3utools/GenericName=3uTools/' "${pkgdir}/usr/share/applications/com.3u.3utools.desktop"

  # Optimize and clean up the bundled run.sh script
  cat << 'EOF' > "${pkgdir}/opt/apps/com.3u.3utools/run.sh"
#!/bin/bash

if [ $# -eq 0 ]; then
    cd "$(dirname "$(readlink -f "$0")")" || exit 1
    export QT_XCB_GL_INTEGRATION=none
    exec ./3uTools
elif [ $# -eq 1 ]; then
    # Safely restart usbmuxd (Arch Linux standard way)
    if command -v systemctl >/dev/null 2>&1; then
        systemctl restart usbmuxd || true
    else
        killall -9 usbmuxd 2>/dev/null || true
        usbmuxd --user usbmux || true
    fi
else
    PID_USBMUX="$1"
    shift
    mycommand="$1"
    shift

    kill -9 "$PID_USBMUX" 2>/dev/null || true
    exec "$mycommand" "$@"
fi
EOF
  chmod +x "${pkgdir}/opt/apps/com.3u.3utools/run.sh"

  # Replace bundled core system libraries with symlinks to system libraries
  # This fixes Wayland/Mesa crashes (GLIBC_ABI_DT_RELR) and satisfies 3uTools' strict RPATH
  local syslibs=(
    "ld-linux-x86-64.so.2" "libc.so.6" "libstdc++.so.6" "libm.so.6" "libdl.so.2" "librt.so.1" "libpthread.so.0" "libgcc_s.so.1"
    "libresolv.so.2" "libglib-2.0.so.0" "libfontconfig.so.1" "libfreetype.so.6" "libsystemd.so.0" "libudev.so.1" "libz.so.1"
    "libX11.so.6" "libX11-xcb.so.1" "libXext.so.6" "libXfixes.so.3" "libXdamage.so.1" "libXcomposite.so.1"
    "libXcursor.so.1" "libXrender.so.1" "libXrandr.so.2" "libXi.so.6" "libXtst.so.6" "libXau.so.6" "libXdmcp.so.6"
    "libxcb.so.1" "libxcb-glx.so.0" "libxcb-icccm.so.4" "libxcb-image.so.0" "libxcb-keysyms.so.1" "libxcb-randr.so.0"
    "libxcb-render-util.so.0" "libxcb-render.so.0" "libxcb-shape.so.0" "libxcb-shm.so.0" "libxcb-sync.so.1"
    "libxcb-util.so.1" "libxcb-xfixes.so.0" "libxcb-xinerama.so.0" "libxcb-xkb.so.1"
    "libxkbcommon.so.0" "libxkbcommon-x11.so.0"
  )

  for lib in "${syslibs[@]}"; do
    if [ -f "${pkgdir}/opt/apps/com.3u.3utools/lib/${lib}" ] || [ -L "${pkgdir}/opt/apps/com.3u.3utools/lib/${lib}" ]; then
      rm -f "${pkgdir}/opt/apps/com.3u.3utools/lib/${lib}"
      ln -s "/usr/lib/${lib}" "${pkgdir}/opt/apps/com.3u.3utools/lib/${lib}"
    fi
  done
}
