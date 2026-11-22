# Maintainer: czyt <czytcn@gmail.com>
pkgname=saber-note-bin
pkgver=1.38.0
pkgrel=1
pkgdesc="The cross-platform open-source notes app built for handwriting"
arch=('x86_64' 'aarch64')
url="https://saber.adil.hanney.org/"
license=('GPL-3.0-only')
depends=('gtk3' 'libsecret' 'webkit2gtk-4.1')
provides=('saber')
conflicts=('saber' 'saber-bin')
options=('!strip' '!debug')
# Upstream ships one archive per architecture with the same layout:
#   saber, data/, lib/, share/
source_x86_64=("Saber_v${pkgver}_Linux_x86_64.tar.gz::https://github.com/saber-notes/saber/releases/download/v${pkgver}/Saber_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("Saber_v${pkgver}_Linux_arm64.tar.gz::https://github.com/saber-notes/saber/releases/download/v${pkgver}/Saber_v${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d24491bd140c4481b7f722eed4157a90197a19a0665f08a3b48fb93ebdbf517f')
sha256sums_aarch64=('51f04c42ad80554976aa735fdd7526b2d660d7b0baeb84094ae34bb6a7ab33c4')

package() {
    local _dir="saber-note"
    local _arch="x86_64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="arm64"

    install -dm755 "${pkgdir}/usr/lib/${_dir}"
    bsdtar -xf "${srcdir}/Saber_v${pkgver}_Linux_${_arch}.tar.gz" \
        -C "${pkgdir}/usr/lib/${_dir}"

    # Launcher: upstream desktop file expects "saber" on PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/saber" <<'EOF'
#!/bin/bash
exec /usr/lib/saber-note/saber "$@"
EOF

    # Desktop entry, metainfo and icons keep the upstream app id so that
    # Icon=com.adilhanney.saber still resolves.
    install -Dm644 "${pkgdir}/usr/lib/${_dir}/share/applications/com.adilhanney.saber.desktop" \
        "${pkgdir}/usr/share/applications/saber.desktop"
    install -Dm644 "${pkgdir}/usr/lib/${_dir}/share/metainfo/com.adilhanney.saber.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/saber.metainfo.xml"
    install -Dm644 "${pkgdir}/usr/lib/${_dir}/share/icons/hicolor/scalable/apps/com.adilhanney.saber.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.adilhanney.saber.svg"

    rm -rf "${pkgdir}/usr/lib/${_dir}/share"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
