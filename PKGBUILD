pkgname=password-depot-bin
pkgver=19.0.2
pkgrel=2
pkgdesc="Password Depot from AceBIT GmbH for Linux (official binary repackaged from Debian package)"
arch=('x86_64')
url="https://www.password-depot.de/en/"
license=('custom')

provides=('password-depot')
conflicts=('password-depot')
replaces=('password-depot')

options=(!strip !debug)

depends=(
  alsa-lib
  gcc-libs
  glibc
  hicolor-icon-theme
  libx11
  libxcb
  libxext
  libxi
  libxrender
  libxtst
  wayland
  xdg-utils
  zlib
)
makedepends=(
  python
  unzip
  zip
)


provides=('password-depot')
conflicts=('password-depot')

source=("pdepot19.deb::https://www.password-depot.de/download/v19/linux/pdepot19.deb")
sha256sums=('9d49680d05c945fcce0553e29ca709e3d7aed73b67e61a5157b652da88c46c86')

package() {
  cd "$srcdir"

  local debdir="$srcdir/deb"
  rm -rf "$debdir"
  mkdir -p "$debdir"
  cd "$debdir"

  ar x "$srcdir/pdepot19.deb"

  local data_archive
  data_archive="$(find . -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  [[ -n "$data_archive" ]] || {
    echo "ERROR: could not find data.tar.* inside the Debian package" >&2
    return 1
  }

  tar --zstd -xf "$data_archive" -C "$pkgdir"

  local appdir="$pkgdir/opt/password-depot-19"
  local appjar="$appdir/lib/app/PasswordDepotLinux-${pkgver}-all.jar"

  [[ -f "$appjar" ]] || {
    echo "ERROR: expected app jar not found: $appjar" >&2
    return 1
  }

  # Patch the embedded native library so it no longer requests an executable stack.
  local tmpdir
  tmpdir="$(mktemp -d)"

  (
    cd "$tmpdir" || exit 1

    unzip -q "$appjar" native-libs/libnative-lib.so || exit 1

    python - <<'PY'
import struct
from pathlib import Path

path = Path("native-libs/libnative-lib.so")
data = bytearray(path.read_bytes())

EI_CLASS = data[4]
EI_DATA = data[5]

if EI_CLASS == 1:
    is_64 = False
elif EI_CLASS == 2:
    is_64 = True
else:
    raise SystemExit("Unsupported ELF class")

if EI_DATA == 1:
    endian = "<"
elif EI_DATA == 2:
    endian = ">"
else:
    raise SystemExit("Unsupported ELF endianness")

PT_GNU_STACK = 0x6474E551
PF_X = 0x1

if is_64:
    e_phoff = struct.unpack_from(endian + "Q", data, 32)[0]
    e_phentsize = struct.unpack_from(endian + "H", data, 54)[0]
    e_phnum = struct.unpack_from(endian + "H", data, 56)[0]

    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        p_type = struct.unpack_from(endian + "I", data, off)[0]
        if p_type == PT_GNU_STACK:
            p_flags = struct.unpack_from(endian + "I", data, off + 4)[0]
            p_flags &= ~PF_X
            struct.pack_into(endian + "I", data, off + 4, p_flags)
            break
    else:
        raise SystemExit("PT_GNU_STACK not found")
else:
    e_phoff = struct.unpack_from(endian + "I", data, 28)[0]
    e_phentsize = struct.unpack_from(endian + "H", data, 42)[0]
    e_phnum = struct.unpack_from(endian + "H", data, 44)[0]

    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        p_type = struct.unpack_from(endian + "I", data, off)[0]
        if p_type == PT_GNU_STACK:
            p_flags_off = off + 24
            p_flags = struct.unpack_from(endian + "I", data, p_flags_off)[0]
            p_flags &= ~PF_X
            struct.pack_into(endian + "I", data, p_flags_off, p_flags)
            break
    else:
        raise SystemExit("PT_GNU_STACK not found")

path.write_bytes(data)
PY

    zip -q -u "$appjar" native-libs/libnative-lib.so || exit 1
  ) || {
    rm -rf "$tmpdir"
    echo "ERROR: failed to patch embedded native-libs/libnative-lib.so" >&2
    return 1
  }

  rm -rf "$tmpdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf '/opt/password-depot-19/bin/Password Depot 19' "$pkgdir/usr/bin/password-depot"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 \
    "$appdir/lib/password-depot-19-Password_Depot_19.desktop" \
    "$pkgdir/usr/share/applications/password-depot.desktop"

  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/password-depot|' \
    -e 's|^Icon=.*|Icon=password-depot|' \
    "$pkgdir/usr/share/applications/password-depot.desktop"

  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -m644 \
    "$appdir/lib/Password_Depot_19.png" \
    "$pkgdir/usr/share/pixmaps/password-depot.png"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 \
    "$appdir/share/doc/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
