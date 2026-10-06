# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154
pkgname=wallpaperd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Session wallpaper daemon with image, video, shader and Wallpaper Engine backends'
arch=('x86_64')
url='https://github.com/mengdehong/Misari'
license=('GPL-3.0-or-later' 'BSD-3-Clause' 'LicenseRef-Chromium')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'libcups' 'libgcc' 'libglvnd' 'libpulse' 'libstdc++' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
  'mesa' 'mpv' 'nspr' 'nss' 'pango' 'shaderc' 'systemd-libs' 'wayland'
  'pulse-native-provider' 'ttf-font'
  # These libraries are loaded at runtime and are absent from ELF NEEDED entries.
  'libmpv.so=2-64' 'libEGL.so=1-64' 'libGLESv2.so=2-64'
)
provides=("wallpaperd=$pkgver")
conflicts=('wallpaperd')
makedepends=('python')
options=('!debug' '!strip')
source=("https://github.com/mengdehong/Misari/releases/download/wallpaperd-v0.1.0/wallpaperd-0.1.0-1-x86_64.pkg.tar.zst")
sha256sums=('9f5c705e64e7876b1228801630786fe774b0d60da838b1712782075fa850030a')

_check_runtime() {
  python - "$@" <<'PY'
import ctypes
import os
from pathlib import Path
import subprocess
import sys

binary, runtime = (Path(arg).resolve() for arg in sys.argv[1:])
for name in (
    "libcef.so", "libvk_swiftshader.so", "libvulkan.so.1",
    "chrome_100_percent.pak", "chrome_200_percent.pak", "resources.pak",
    "icudtl.dat", "v8_context_snapshot.bin", "vk_swiftshader_icd.json",
    "chrome-sandbox", "locales/en-US.pak", "LICENSE.txt", "CREDITS.html",
):
    if not (runtime / name).is_file():
        sys.exit(f"missing CEF runtime file: {runtime / name}")

mpv = ctypes.CDLL("libmpv.so.2")
mpv.mpv_client_api_version.argtypes = []
mpv.mpv_client_api_version.restype = ctypes.c_ulonglong
version = mpv.mpv_client_api_version()
if version >> 16 != 2:
    sys.exit(f"libmpv client API must be 2.x, found {version >> 16}.{version & 0xffff}")
for library, symbol in (
    ("libEGL.so.1", "eglGetProcAddress"),
    ("libGLESv2.so.2", "glGetString"),
    ("libpulse.so.0", "pa_get_library_version"),
    ("libpulse-simple.so.0", "pa_simple_new"),
):
    getattr(ctypes.CDLL(library), symbol)

env = os.environ.copy()
env.pop("LD_LIBRARY_PATH", None)
env.pop("LD_PRELOAD", None)
for path in (binary, runtime / "libcef.so"):
    linked = subprocess.run(
        ["ldd", str(path)], env=env, check=True, capture_output=True, text=True,
    ).stdout
    if "not found" in linked:
        sys.exit(f"unresolved runtime dependencies for {path}:\n{linked}")
# CEF is loaded with dlopen on demand, so it has no ELF NEEDED entry.
# Match the runtime search used by we-web and verify that CEF can load.
if binary.parent == runtime:
    located = binary.parent / "libcef.so"
else:
    located = binary.parent / "../lib/wallpaperd/web/libcef.so"
if located.resolve() != runtime / "libcef.so":
    sys.exit(f"unexpected CEF runtime layout: {located}")
cef = ctypes.CDLL(str(runtime / "libcef.so"))
getattr(cef, "cef_execute_process")
subprocess.run([str(binary), "--help"], env=env, check=True, stdout=subprocess.DEVNULL)
print(f"wallpaperd runtime OK: libmpv {version >> 16}.{version & 0xffff}, EGL/GLES, PulseAudio, CEF")
PY
}

check() {
  _check_runtime "$srcdir/usr/bin/wallpaperd" "$srcdir/usr/lib/wallpaperd/web"
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/wallpaperd" "$pkgdir/usr/share/licenses/$pkgname"
  _check_runtime "$pkgdir/usr/bin/wallpaperd" "$pkgdir/usr/lib/wallpaperd/web"
}
