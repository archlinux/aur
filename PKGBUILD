# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=Amethyst-Mod-Manager
pkgname=amethyst-mod-manager
pkgver=2.4.0
pkgrel=1
pkgdesc='A Linux native mod manager for a variety of games'
arch=('any')
url='https://github.com/ChrisDKN/Amethyst-Mod-Manager'
license=('GPL-3.0-only')
depends=(
    'python'

    # UI
    'pyside6'
    'python-gobject'
    'python-pillow'
    'shiboken6'

    # Networking
    'python-certifi'
    'python-requests'

    # Secret store
    'python-keyring'
    'python-secretstorage'

    # Cryptography
    'python-cryptography'

    # DBus
    'python-jeepney' # Also handling file dialog

    # Serialization
    'python-msgpack'

    # Archive
    'python-lz4'
    'python-py7zr'
    'python-zstandard'
    'python-rarfile'

    # Modding tools
    'python-libloot'

    'python-bsdiff4'

    # Native amethyst_filegraph
    'glibc'
    'libgcc'
)
optdepends=(
    'zenity: fallback native dialog (prefer to use XDG portal instead)'
    'kdialog: fallback native dialog (prefer to use XDG portal instead)'
)
makedepends=(
    'cargo'
    'meson'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChrisDKN/Amethyst-Mod-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fc041eef8b5ffa0a69d0d730c2c856748613b912404e307babde04e14b790ba')

prepare() {
    cd "${_pkgname}-${pkgver}"

    sed -i 's/import LOOT.loot as loot/import loot/' 'src/LOOT/loot_sorter.py'

    pushd "native/amethyst_filegraph"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    popd
}

build() {
    cd "${_pkgname}-${pkgver}"

    # Build amethyst_filegraph
    pushd "native/amethyst_filegraph"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    cp -f "${CARGO_TARGET_DIR}/release/libamethyst_filegraph.so" "../../src/amethyst_filegraph.abi3.so"
    popd

    # Build amethyst laucher
    arch-meson ./ build
    meson compile -C build
}

package() {
    cd "${_pkgname}-${pkgver}"

    meson install -C build --destdir "$pkgdir"

    # Fix meson.build dumping everything into `site-packages`
    echo "Correcting install path..."

    local site_packages=$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))")
    local src_root="${pkgdir}${site_packages}"
    local target_dir="${src_root}/${pkgname}"

    mv "${src_root}" "${src_root}-temp"
    mkdir -p "${src_root}"
    mv "${src_root}-temp" "${target_dir}"

    echo "${pkgname}" > "${src_root}/${pkgname}.pth"

    # Amend launch scripts
    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}"
    echo 'exec /usr/bin/python3 -m '"${pkgname}"'.run_qt "$@"' >> "$pkgdir/usr/bin/${pkgname}"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}-cli"
    echo 'exec /usr/bin/python3 -m '"${pkgname}"'.cli "$@"' >> "$pkgdir/usr/bin/${pkgname}-cli"
}
