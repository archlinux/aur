# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — daemon + CLI + themes + systemd unit. Listeners
# ship as separate per-listener packages (see PKGBUILD-listener-*-bin)
# or via the meta-package `awob-listeners-all`.
#
# 0.1.7 and e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2 are filled in at publish time by the release
# workflow (see .github/workflows/release.yml).

pkgname=awob-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Another Wayland Overlay Bar — daemon + CLI."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
provides=('awob' 'awob-daemon')
conflicts=('awob' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"

    # Daemon + CLI.
    install -Dm755 -t "${pkgdir}/usr/bin" \
        bin/awob \
        bin/awob-daemon

    # Stock themes + shared palettes. /usr/share/awob/themes is on the
    # daemon's theme search path (via $XDG_DATA_DIRS), so fresh users
    # can pick a theme without copying any files; anything under
    # ~/.config/awob/themes shadows these by name.
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
