# Maintainer: Yury Zhelezko <yzhelezko@users.noreply.github.com>
pkgname=ferrisscope-bin
pkgver=1.0.40
pkgrel=1
pkgdesc="Rust-native, open-source desktop IDE for Kubernetes"
arch=('x86_64')
url="https://github.com/dzcorp/FerrisScope"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=('kubectl: required for embedded terminal exec/kubectl tabs')
provides=('ferrisscope')
conflicts=('ferrisscope' 'ferrisscope-git')
source=("${pkgname}-${pkgver}.deb::https://github.com/dzcorp/FerrisScope/releases/download/v${pkgver}/FerrisScope_1.0.40_amd64-linux-x64.deb")
sha256sums=('5394e2a44793727bcc73f6a459ba8232c1d8cb0a1368bdc8cab3e1cc076490b4')

package() {
    # Tauri's .deb is a standard ar archive containing
    # debian-binary, control.tar.*, data.tar.*. bsdtar handles
    # ar natively so we don't need dpkg.
    cd "${srcdir}"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xpf data.tar.* -C "${pkgdir}"

    # Sanity check: bail loudly if the deb didn't ship the
    # binary at /usr/bin/ferrisscope. Tauri's bundler keys the
    # binary name off mainBinaryName in tauri.conf.json — if
    # that ever drifts back to productName ("FerrisScope"),
    # ${pkgname} would publish an empty package on AUR,
    # which is exactly the bug this guard exists to prevent.
    if [[ ! -x "${pkgdir}/usr/bin/ferrisscope" ]]; then
        echo "::error::deb did not install /usr/bin/ferrisscope" >&2
        echo "Contents of ${pkgdir}/usr/bin/:" >&2
        ls -la "${pkgdir}/usr/bin/" 2>&1 >&2 || true
        return 1
    fi
}
