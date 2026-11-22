# Maintainer: Taxin <taxin404@duck.com>
# Contributor: Mehedi Shakeel <contact at getbongo dot app>

pkgname=bongo-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Modern Bangla phonetic & Bijoy keyboard with native Fcitx5 and IBus support"
arch=('x86_64' 'aarch64')
url="https://getbongo.app"
license=('MPL-2.0')
depends=(
    'glibc>=2.39'
    'gtk4'
    'python'
    'python-gobject'
    'hicolor-icon-theme'
)
optdepends=(
    'fcitx5: Native Fcitx5 input method addon (recommended for KDE, Hyprland, Omarchy, Sway)'
    'fcitx5-configtool: Graphical Fcitx5 configuration tool used by "Open Input Settings"'
    'ibus: IBus input method engine (recommended for GNOME)'
)
provides=('bongo' 'fcitx5-bongo' 'ibus-bongo')
conflicts=('bongo' 'bongo-git')
options=('!strip' '!debug')
install=bongo-bin.install

_tarball_x86_64="Bongo-${pkgver}-linux-x86_64.tar.gz"
_tarball_aarch64="Bongo-${pkgver}-linux-aarch64.tar.gz"

# The prebuilt tarball ships no license files or converter.py, so fetch them
# from the release tag.
source=(
    "LICENSE::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/LICENSE"
    "THIRD_PARTY_NOTICES.md::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/THIRD_PARTY_NOTICES.md"
    "MPL-2.0.txt::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/licenses/MPL-2.0.txt"
    "converter.py::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/platforms/common/converter.py"
)
source_x86_64=("https://github.com/mehedishakeel/Bongo/releases/download/v${pkgver}/${_tarball_x86_64}")
source_aarch64=("https://github.com/mehedishakeel/Bongo/releases/download/v${pkgver}/${_tarball_aarch64}")
sha256sums=(
    '645383fa697d3e355bdd7d41488b23738a5a90b8b4aeb031811ddec299919161'
    'f76a0b3880898a16a3d628b5db59889699cef768d8c4a3d032612ca161475e67'
    '0a758ee03f5392c03c1166e1bcb2e4263b98a9d08a08d5b4a56bb5219a732cd8'
    '244071627e991013e7b660fab095c1d89054cc5fdf48ab7ab7339046722b1ce5'
)
sha256sums_x86_64=('8ae73ffce291d794e2ff1dd20a85968d44d28cbdd09e9bb39495f941200852f8')
sha256sums_aarch64=('08b7d3c83b6005e217cb88db286eef57758cb1c4babd9620e43690cab0d0fedd')

package() {
    local _dir="Bongo-${pkgver}-linux-${CARCH}"
    cd "${srcdir}/${_dir}"

    install -d "${pkgdir}/usr"
    cp -a payload/* "${pkgdir}/usr/"

    # The bundle carries an empty Debian multiarch directory that is not used on Arch.
    rmdir "${pkgdir}/usr/lib/${CARCH}-linux-gnu" 2>/dev/null || true

    # Place fcitx5 addon in Arch standard addon directory (/usr/lib/fcitx5)
    if [ -f fcitx5/libbongo.so ]; then
        install -Dm755 fcitx5/libbongo.so "${pkgdir}/usr/lib/fcitx5/libbongo.so"
    fi

    # Ensure executable permissions for binaries and libraries
    chmod 755 "${pkgdir}/usr/bin/bongo-settings" \
              "${pkgdir}/usr/bin/bongo-fcitx5-setup" \
              "${pkgdir}/usr/libexec/bongo-ibus-engine" \
              "${pkgdir}/usr/lib/bongo/libbongo_engine.so"

    # The prebuilt tarball does not include license files.
    install -Dm644 "${srcdir}/LICENSE" \
                   "${srcdir}/THIRD_PARTY_NOTICES.md" \
                   "${srcdir}/MPL-2.0.txt" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # The bundle also ships no converter.py, which bongo-settings and the IBus
    # engine import for the Bijoy/Unicode converters, sandhi and the full
    # autocorrect table. Without it they silently fall back to no-op stubs.
    install -Dm644 "${srcdir}/converter.py" \
        "${pkgdir}/usr/share/bongo/converter.py"
    python3 - "${pkgdir}/usr/bin/bongo-settings" "${pkgdir}/usr/libexec/bongo-ibus-engine" <<'PY'
import pathlib
import sys

old = '''COMMON_DIR = Path(__file__).resolve().parent.parent.parent / "common"
if COMMON_DIR.is_dir() and str(COMMON_DIR) not in sys.path:
    sys.path.insert(0, str(COMMON_DIR))'''
new = '''COMMON_DIRS = [
    Path(__file__).resolve().parent.parent.parent / "common",
    Path("/usr/share/bongo"),
]
for COMMON_DIR in COMMON_DIRS:
    if COMMON_DIR.is_dir() and str(COMMON_DIR) not in sys.path:
        sys.path.insert(0, str(COMMON_DIR))'''

for name in sys.argv[1:]:
    path = pathlib.Path(name)
    text = path.read_text()
    if old not in text:
        raise SystemExit(f"converter path block not found in {name}")
    path.write_text(text.replace(old, new, 1))
PY
}
