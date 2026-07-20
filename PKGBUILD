# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Template. The version and checksums below are filled in by
# packaging/arch/make-aur-package.sh, which renders this into a publishable
# PKGBUILD + .SRCINFO. The checksums come from the release's own SHA256SUMS
# asset, so they are the published ones rather than something recomputed here.

pkgname=sdme-bin
pkgver=0.17.1
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
sha256sums_x86_64=('9c615d8be26135b3ac3bcd8feac3f551d119f62e286b1eade7900905962f468e')
sha256sums_aarch64=('68015dc59af271a2da67301143bd33a7606cd6d25710d6ad024196502145b870')

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
