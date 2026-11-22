# Maintainer: Taxin <taxin404@duck.com>
# Contributor: Mehedi Shakeel <contact at getbongo dot app>

pkgname=bongo-bin
pkgver=1.2.1
pkgrel=3
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
    'fcitx5'
    'fcitx5-configtool'
)
optdepends=(
    'ibus: IBus input method engine (recommended for GNOME)'
)
provides=('bongo' 'fcitx5-bongo' 'ibus-bongo')
conflicts=('bongo' 'bongo-git')
options=('!strip' '!debug')
install=bongo-bin.install

_tarball_x86_64="Bongo-${pkgver}-linux-x86_64.tar.gz"
_tarball_aarch64="Bongo-${pkgver}-linux-aarch64.tar.gz"

# The prebuilt tarball ships no license files or converter.py, so fetch them
# from the release tag. The patches are the same downstream fixes the bongo
# source package carries.
source=(
    "LICENSE::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/LICENSE"
    "THIRD_PARTY_NOTICES.md::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/THIRD_PARTY_NOTICES.md"
    "MPL-2.0.txt::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/licenses/MPL-2.0.txt"
    "converter.py::https://raw.githubusercontent.com/mehedishakeel/Bongo/v${pkgver}/platforms/common/converter.py"
    'bongo-converter-path.patch'
    'bongo-input-settings.patch'
    'bongo-gtk4-label-wrap.patch'
)
source_x86_64=("https://github.com/mehedishakeel/Bongo/releases/download/v${pkgver}/${_tarball_x86_64}")
source_aarch64=("https://github.com/mehedishakeel/Bongo/releases/download/v${pkgver}/${_tarball_aarch64}")
sha256sums=(
    '645383fa697d3e355bdd7d41488b23738a5a90b8b4aeb031811ddec299919161'
    'f76a0b3880898a16a3d628b5db59889699cef768d8c4a3d032612ca161475e67'
    '0a758ee03f5392c03c1166e1bcb2e4263b98a9d08a08d5b4a56bb5219a732cd8'
    '244071627e991013e7b660fab095c1d89054cc5fdf48ab7ab7339046722b1ce5'
    '12bd34e75816b03264effeee2dfc9acbecfa600b55291a73d4cd080462c43417'
    '23c44411c726978bbd56626df1295c9e7cb00069fb204d1029fcdb48992a443d'
    'c6627a673d41f93a26cf4a3b7c704aafa126a3b62b547fbfdd2a9ee93dd6439e'
)
sha256sums_x86_64=('8ae73ffce291d794e2ff1dd20a85968d44d28cbdd09e9bb39495f941200852f8')
sha256sums_aarch64=('08b7d3c83b6005e217cb88db286eef57758cb1c4babd9620e43690cab0d0fedd')

prepare() {
    # The bundle has no source tree, so give the patches the layout they
    # expect and point it at the prebuilt scripts.
    local _tree="${srcdir}/patchtree"
    rm -rf "${_tree}"
    install -d "${_tree}/platforms/linux/ui" "${_tree}/platforms/linux/ibus"
    install -m644 \
        "${srcdir}/Bongo-${pkgver}-linux-${CARCH}/payload/bin/bongo-settings" \
        "${_tree}/platforms/linux/ui/bongo_settings.py"
    install -m644 \
        "${srcdir}/Bongo-${pkgver}-linux-${CARCH}/payload/libexec/bongo-ibus-engine" \
        "${_tree}/platforms/linux/ibus/bongo_ibus_engine.py"

    cd "${_tree}"
    # See bongo-converter-path.patch. Upstream ships no converter.py at all.
    patch -Np1 -i "${srcdir}/bongo-converter-path.patch"
    # Downstream fix for "Open Input Settings..." opening the file manager.
    # Upstream: https://github.com/mehedishakeel/Bongo/pull/19
    patch -Np1 -i "${srcdir}/bongo-input-settings.patch"
    # GTK4 startup crash in the 1.2.1 converters tab (set_line_wrap).
    patch -Np1 -i "${srcdir}/bongo-gtk4-label-wrap.patch"
}

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

    # Install the patched scripts from prepare().
    install -Dm755 "${srcdir}/patchtree/platforms/linux/ui/bongo_settings.py" \
        "${pkgdir}/usr/bin/bongo-settings"
    install -Dm755 "${srcdir}/patchtree/platforms/linux/ibus/bongo_ibus_engine.py" \
        "${pkgdir}/usr/libexec/bongo-ibus-engine"

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
}
