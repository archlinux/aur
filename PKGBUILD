# Maintainer: czyt <czytcn@gmail.com>
pkgname=delta-app-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="Delta - AI-native code editor"
arch=('x86_64' 'aarch64')
url="https://delta.dev"
license=('custom')
depends=('glibc')
provides=('delta')
conflicts=('delta')
options=('!strip' '!debug')
# Upstream serves a small JSON manifest that points at the versioned tarball.
source_x86_64=("delta-linux-x86_64.tar.gz::https://releases.delta.dev/releases/stable/${pkgver}/delta-linux-x86_64.tar.gz")
source_aarch64=("delta-linux-aarch64.tar.gz::https://releases.delta.dev/releases/stable/${pkgver}/delta-linux-aarch64.tar.gz")
sha256sums_x86_64=('2ebc897ed73941da2c20868c9ee5ff3c372a5dedc61f23926d87d7d19ba10813')
sha256sums_aarch64=('d9bfea1ad2c45d74c33cb21f6fa6a3234902ba4571b3688e0e3d58f5468a3e49')

package() {
    local _arch="x86_64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="aarch64"

    install -dm755 "${pkgdir}/opt/delta"
    bsdtar -xf "${srcdir}/delta-linux-${_arch}.tar.gz" \
        -C "${pkgdir}/opt/delta" --strip-components=1

    # Bundled libraries are resolved through RPATH=$ORIGIN/../lib
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/delta/bin/delta-app "${pkgdir}/usr/bin/delta-app"
    ln -s /opt/delta/bin/delta "${pkgdir}/usr/bin/delta"

    # Desktop entry: upstream rewrites "Exec=delta " to the absolute CLI path
    install -Dm644 "${pkgdir}/opt/delta/share/applications/dev.zed.Delta.desktop" \
        "${pkgdir}/usr/share/applications/dev.zed.Delta.desktop"
    sed -i 's|^Exec=delta |Exec=/usr/bin/delta |' \
        "${pkgdir}/usr/share/applications/dev.zed.Delta.desktop"

    install -Dm644 "${pkgdir}/opt/delta/share/icons/hicolor/512x512/apps/dev.zed.Delta.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.zed.Delta.png"

    rm -rf "${pkgdir}/opt/delta/share/applications" "${pkgdir}/opt/delta/share/icons" \
           "${pkgdir}/opt/delta/install.sh"

    # Upstream tarball carries the builder's uid; pacman packages must be root-owned
    chown -R root:root "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
