# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — daemon + CLI + themes + systemd unit. Listeners
# ship as separate per-listener packages (see PKGBUILD-listener-*-bin)
# or via the meta-package `awob-listeners-all`.
#
# 0.1.2 and 8f344b5f63c15e1c826375317ad83f42f8da5d5742e910750fe779b595a41ca5 are filled in at publish time by the release
# workflow (see .github/workflows/release.yml).

pkgname=awob-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Another Wayland Overlay Bar — daemon + CLI."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
provides=('awob' 'awob-daemon')
conflicts=('awob' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8f344b5f63c15e1c826375317ad83f42f8da5d5742e910750fe779b595a41ca5')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"

    # Daemon + CLI.
    install -Dm755 -t "${pkgdir}/usr/bin" \
        bin/awob \
        bin/awob-daemon

    # Stock themes + shared palettes — daemon's themes_dir defaults to
    # ~/.config/awob/themes, but having a system-wide fallback under
    # /usr/share/awob/themes lets fresh users pick a theme without
    # copying any files.
    install -dm755 "${pkgdir}/usr/share/awob"
    cp -r share/awob/themes "${pkgdir}/usr/share/awob/"

    # systemd user unit. Enable per-user with:
    #   systemctl --user daemon-reload
    #   systemctl --user enable --now awob.service
    install -Dm644 lib/systemd/user/awob.service \
        "${pkgdir}/usr/lib/systemd/user/awob.service"
    # The shipped unit defaults to %h/.cargo/bin/awob-daemon for users
    # who `cargo install`. The Arch package installs to /usr/bin, so
    # rewrite the path here.
    sed -i 's|^ExecStart=%h/.cargo/bin/awob-daemon$|ExecStart=/usr/bin/awob-daemon|' \
        "${pkgdir}/usr/lib/systemd/user/awob.service"

    # Licence + readme.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
