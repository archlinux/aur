# Maintainer: czyt <czytcn@gmail.com>

pkgname=geetree-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="GPU-rendered Git client built for very large repositories"
arch=('x86_64')
url="https://geetree.app"
# Upstream publishes binaries only: the repository has no source and no
# licence text, so there is nothing to install under /usr/share/licenses.
license=('LicenseRef-proprietary')
depends=(
    'git'
    'hicolor-icon-theme'
    'libglvnd'      # libEGL, loaded at runtime
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'       # libwayland-client and libwayland-egl, loaded at runtime
)
provides=('geetree')
conflicts=('geetree')
options=('!strip' '!debug')

# Upstream names the archive without a version, so the local filename carries
# it to keep makepkg from reusing a cached download across releases.
_deb="geetree-${pkgver}-amd64.deb"
source_x86_64=("${_deb}::https://github.com/cmzy/geetree/releases/download/v${pkgver}/GeeTree_amd64.deb")
noextract=("${_deb}")
sha256sums_x86_64=('9c3cce6b8a4f1d355eb4aa265eed236cae3ed31e88fd1fdafaaebcec7d34f8ea')

package() {
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Upstream ships no licence text and the repository has no source, so this
    # records the situation instead of reproducing terms that do not exist.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/PROPRIETARY-NOTICE" <<'EOF'
GeeTree is distributed by its author as a compiled binary only. This package
redistributes nothing: it installs the unmodified release archive published at
https://github.com/cmzy/geetree/releases.

No licence text, terms of service or EULA is published for GeeTree as of
2026-11-12. The upstream repository contains no source code and no licence
file, and the project's website describes the software as free to use with no
account required. There is therefore no licence to reproduce here, and this
file grants no rights.

Upstream: https://geetree.app
EOF

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
