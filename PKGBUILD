# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Template. The version and checksums below are filled in by
# packaging/arch/make-aur-package.sh, which renders this into a publishable
# PKGBUILD + .SRCINFO. The checksums come from the release's own SHA256SUMS
# asset, so they are the published ones rather than something recomputed here.

pkgname=sdme-bin
pkgver=0.17.2
pkgrel=1
pkgdesc='The systemd machine editor (prebuilt static binary)'
arch=('x86_64' 'aarch64')
url='https://sdme.io'
license=('MIT')
# systemd-nspawn and machinectl ship inside Arch's systemd package, so there is
# no separate systemd-container to depend on as there is on Debian and Fedora.
depends=('systemd>=255')
optdepends=(
    'qemu-base: QCOW2 disk image import support'
    'apparmor: security profile support'
)
provides=('sdme')
conflicts=('sdme')
backup=('etc/apparmor.d/sdme-default')
install=sdme.install
# Install the released binary byte for byte, so what lands on disk is what
# SHA256SUMS above attests to. makepkg strips by default, which rewrites the
# ELF (and would make a -debug package out of a binary that has no debug info).
options=(!strip !debug)

_rel="https://github.com/fiorix/sdme/releases/download/v$pkgver"
# LICENSE is not a release asset, so it comes from the tag itself.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/fiorix/sdme/v$pkgver/LICENSE")
source_x86_64=("sdme-$pkgver-x86_64::$_rel/sdme-x86_64-linux")
source_aarch64=("sdme-$pkgver-aarch64::$_rel/sdme-aarch64-linux")
sha256sums=('1bdeb4314572553450c1bb5d29e40f4d55f30baa6a91a0b08cc69d7d2336dd68')
sha256sums_x86_64=('7edb5eba5fbc8e80b6aedb9ad7a033baf52ffc7b69e687dce414b351112b6ad1')
sha256sums_aarch64=('b34602e8e742bd625415d2fab792bfbdf78e755fb1c86aa86831a3e762de733c')

package() {
    # Install first, then run the installed copy: makepkg symlinks sources from
    # the shared download cache, so chmod +x on "$srcdir/..." would reach through
    # and mutate the cached file.
    install -Dm755 "$srcdir/sdme-$pkgver-$CARCH" "$pkgdir/usr/bin/sdme"
    local sdme="$pkgdir/usr/bin/sdme"

    # Static musl binary built for this CARCH, so it runs here and can emit its
    # own completions and AppArmor profile.
    "$sdme" config completions bash |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/sdme"
    "$sdme" config completions zsh |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_sdme"
    "$sdme" config completions fish |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/sdme.fish"

    "$sdme" config apparmor-profile |
        install -Dm644 /dev/stdin "$pkgdir/etc/apparmor.d/sdme-default"

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
