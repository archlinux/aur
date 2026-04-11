# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=spacedrive-clean
pkgver=0.4.3
pkgrel=4
pkgdesc="A file manager from the future - powered by a virtual distributed filesystem. Cleaner Arch repack of the official Linux binary."
arch=('x86_64')
url="https://www.spacedrive.com"
license=('AGPL-3.0-only')

depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'dbus'
    'xdotool'
    'glibc'
)

makedepends=(
    'patchelf'
)

provides=('spacedrive')
conflicts=('spacedrive' 'spacedrive-bin' 'spacedrive-git')

source=("${pkgname}-${pkgver}.deb::https://github.com/spacedriveapp/spacedrive/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb")
sha256sums=('30b0801cd2c9ffd6dd0812c106cb2ba64f7cbaf2937c7b3d606c66c49d75fe86')

options=(!strip)

package() {
    cd "${srcdir}"

    # Extrai o .deb
    bsdtar -xf "${pkgname}-${pkgver}.deb"

    # Encontra o payload do pacote Debian
    local data_archive
    data_archive="$(find . -maxdepth 1 -type f \( -name 'data.tar.xz' -o -name 'data.tar.gz' -o -name 'data.tar.zst' \) | head -n1)"

    [[ -n "${data_archive}" ]] || {
        echo "Arquivo data.tar.* não encontrado dentro do .deb"
        return 1
    }

    # Extrai os arquivos reais do app
    bsdtar -xf "${data_archive}" -C "${pkgdir}"

    # Ajuste de case, se necessário
    if [[ -d "${pkgdir}/usr/lib/Spacedrive" ]]; then
        mv "${pkgdir}/usr/lib/Spacedrive" "${pkgdir}/usr/lib/spacedrive"
    fi

    # Permissões
    if [[ -f "${pkgdir}/usr/bin/spacedrive" ]]; then
        chmod 755 "${pkgdir}/usr/bin/spacedrive"
    fi

    # Corrige o soname esperado pelo binário
    patchelf --replace-needed libxdo.so.3 libxdo.so.4 "${pkgdir}/usr/bin/spacedrive"
}
