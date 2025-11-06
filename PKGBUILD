# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr-bin
_realname=sunsetr
pkgver=0.11.0
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')

_github_asset_filename="${_realname}-v${pkgver}-x86_64-linux.tar.gz"
_extracted_dir_name="${_realname}-v${pkgver}"

_local_tarball_name="${_realname}-${pkgver}-x86_64-linux.tar.gz"

source=("${_local_tarball_name}::${url}/releases/download/v${pkgver}/${_github_asset_filename}")
sha256sums=('9b4a61f758960eec616cef31e7258b89a8de05a79ad652197f5c1f64e50251f5')

package() {

    # Install the binary
    install -Dm755 "${srcdir}/${_extracted_dir_name}/${_realname}" \
                    "${pkgdir}/usr/bin/${_realname}"

    # Install the license file
    install -Dm644 "${srcdir}/${_extracted_dir_name}/LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the systemd user service file
    install -Dm644 "${srcdir}/${_extracted_dir_name}/${_realname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${_realname}.service"

    # Install README
    install -Dm644 "${srcdir}/${_extracted_dir_name}/README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

post_install() {
    echo ":: Sleep/resume detection is handled automatically via D-Bus"
}

post_upgrade() {
    # Clean up old sleep hook from previous versions (< 0.8.0)
    if [ -f "/usr/lib/systemd/system-sleep/${_realname}-resume" ]; then
        echo ":: Removing deprecated sleep hook (sleep/resume now handled via D-Bus)"
        rm -f "/usr/lib/systemd/system-sleep/${_realname}-resume"
    fi
}

# vim:set ts=4 sw=4 et:
