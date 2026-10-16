# Maintainer: Matvei <w3ar3boys@gmail.com>
pkgname=lorgarctl-bin
pkgver=2.3.4
pkgrel=1
pkgdesc="Linux CLI controller, background daemon & DKMS kernel driver for LORGAR MSA10W mouse (prebuilt binary release)"
arch=('x86_64')
url="https://github.com/Sqrilizz/lorgarctl"
license=('MIT' 'Apache-2.0' 'GPL-2.0-or-later')
depends=('hidapi' 'systemd-libs' 'dbus' 'glib2')
optdepends=(
    'dkms: to build and manage the hid-lorgar kernel module for native UPower battery'
    'linux-headers: required if compiling the DKMS module'
    'plasma-workspace: for the KDE Plasma 6 battery widget'
)
provides=('lorgarctl' 'lorgard' 'hid-lorgar-dkms')
conflicts=('lorgarctl' 'lorgarctl-git')
source=("https://github.com/Sqrilizz/lorgarctl/releases/download/v${pkgver}/lorgar-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('70d75aecd803a12dde4dcf050504bd28014bcf129c233bb85e037a7a67969d99')

package() {
    cd "$srcdir/lorgar-v${pkgver}-linux-x86_64"

    # Binaries
    install -Dm755 bin/lorgarctl "$pkgdir/usr/bin/lorgarctl"
    install -Dm755 bin/lorgard "$pkgdir/usr/bin/lorgard"

    # Systemd user service
    install -Dm644 systemd/lorgard.service "$pkgdir/usr/lib/systemd/user/lorgard.service"

    # Udev rules
    install -Dm644 udev/99-lorgar-msa10w.rules "$pkgdir/usr/lib/udev/rules.d/99-lorgar-msa10w.rules"
    install -Dm644 udev/70-lorgar-uhid-optional.rules "$pkgdir/usr/lib/udev/rules.d/70-lorgar-uhid-optional.rules"

    # Shell completions
    install -Dm644 completions/lorgarctl.bash "$pkgdir/usr/share/bash-completion/completions/lorgarctl"
    install -Dm644 completions/_lorgarctl "$pkgdir/usr/share/zsh/site-functions/_lorgarctl"
    install -Dm644 completions/lorgarctl.fish "$pkgdir/usr/share/fish/vendor_completions.d/lorgarctl.fish"

    # KDE Plasma 6 widget
    mkdir -p "$pkgdir/usr/share/plasma/plasmoids"
    cp -r plasmoid/org.lorgar.battery "$pkgdir/usr/share/plasma/plasmoids/"

    # DKMS module sources
    local _dkms_ver
    _dkms_ver="$(sed -n 's/^PACKAGE_VERSION="\([^"]*\)"/\1/p' kernel/dkms.conf)"
    local _dkms_dir="$pkgdir/usr/src/hid-lorgar-${_dkms_ver}"
    mkdir -p "$_dkms_dir"
    install -Dm644 kernel/*.c kernel/*.h kernel/Makefile kernel/dkms.conf "$_dkms_dir/"

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
