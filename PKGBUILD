# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154
pkgname=wallpaperd-git
pkgver=0.1.0.r17.gb9c5c01
pkgrel=1
pkgdesc='Session wallpaper daemon with image, video, shader and Wallpaper Engine backends'
arch=('x86_64')
url='https://github.com/mengdehong/Misari'
_srcname=misari
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
provides=("wallpaperd=${pkgver%%.r*}")
conflicts=('wallpaperd')
makedepends=('git' 'rust>=1.96' 'pkgconf' 'python' 'cmake' 'ninja')
# Keep the prebuilt CEF libraries intact; Cargo strips the application debug info.
# Cargo controls Rust LTO; GCC LTO objects cannot be linked by rustc's lld.
options=('!debug' '!strip' '!lto')
_cef_archive='cef_binary_154.0.33+ga03e714+chromium-154.0.8037.94_linux64_minimal'
_cef_sha1='9794ecf85ccd4dfcca42bfaac7a7666004f051e8'
# Keep this archive in sync with cef-dll-sys in Cargo.lock.
source=(
  "misari::git+https://github.com/mengdehong/Misari.git#branch=main"
  "https://cef-builds.spotifycdn.com/${_cef_archive}.tar.bz2"
)
sha256sums=(
  'SKIP'
  'cd89e366055d4412942fa25334a9fc98a5b69ff5b0abf6209c94e2d9e38005a2'
)

pkgver() {
  cd "$srcdir/$_srcname" || return
  local version
  version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' tools/wallpaperd/Cargo.toml | head -n1)
  printf '%s.r%s.g%s\n' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  local cef="$srcdir/$_cef_archive"
  python - "$srcdir/$_srcname/tools/wallpaperd/Cargo.lock" "$_cef_archive" <<'PY'
import sys
import tomllib
with open(sys.argv[1], "rb") as source:
    packages = tomllib.load(source)["package"]
version = next(p["version"] for p in packages if p["name"] == "cef-dll-sys").split("+", 1)[1]
if not sys.argv[2].startswith(f"cef_binary_{version}+"):
    sys.exit(f"PKGBUILD CEF archive does not match Cargo.lock ({version}); update archive and checksums")
PY
  # Use the layout expected by cef-dll-sys without downloading during compilation.
  cp -a "$cef/Release/." "$cef/"
  cp -a "$cef/Resources/." "$cef/"
  printf '{"name":"%s.tar.bz2","sha1":"%s","type":"minimal"}\n' \
    "$_cef_archive" "$_cef_sha1" > "$cef/archive.json"
  cd "$srcdir/$_srcname/tools/wallpaperd" || return
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir=."
  export CFLAGS="${CFLAGS} -ffile-prefix-map=$srcdir=."
  export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=$srcdir=."
  cd "$srcdir/$_srcname/tools/wallpaperd" || return
  CEF_PATH="$srcdir/$_cef_archive" SHADERC_LIB_DIR=/usr/lib \
    cargo build --frozen --release --features web --bin wallpaperd \
      --target-dir "$srcdir/target-wallpaperd"
}

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
  _check_runtime "$srcdir/target-wallpaperd/release/wallpaperd" "$srcdir/target-wallpaperd/release"
}

package() {
  local release="$srcdir/target-wallpaperd/release"
  local runtime="$pkgdir/usr/lib/wallpaperd/web"
  install -Dm755 "$release/wallpaperd" "$pkgdir/usr/bin/wallpaperd"
  install -d "$runtime"
  cp -a "$release"/lib*.so* "$release"/*.pak "$release"/*.bin \
    "$release"/*.dat "$release"/*.json "$release/locales" \
    "$release/LICENSE.txt" "$release/CREDITS.html" "$runtime/"
  install -m755 "$release/chrome-sandbox" "$runtime/chrome-sandbox"

  install -Dm644 "$srcdir/$_srcname/tools/wallpaperd/configs/wallpaperd.service" \
    "$pkgdir/usr/lib/systemd/user/wallpaperd.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/wallpaperd serve|' \
    "$pkgdir/usr/lib/systemd/user/wallpaperd.service"
  install -Dm644 "$srcdir/$_srcname/tools/wallpaperd/README.md" "$pkgdir/usr/share/doc/wallpaperd/README.md"
  install -Dm644 "$srcdir/$_srcname/niri/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$release/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/CEF-LICENSE.txt"
  install -Dm644 "$release/CREDITS.html" "$pkgdir/usr/share/licenses/$pkgname/CREDITS.html"
  # Validate the installed layout, including the relative path used by the CEF loader.
  _check_runtime "$pkgdir/usr/bin/wallpaperd" "$runtime"
}
