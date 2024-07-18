# Maintainer: Thomas Holden <thomas@tholden.no>
# Contributor: Paul <paul@mirliton.io>
pkgname=zenbook-sound-fix-ux3405ma
pkgver=r14.d14e262
pkgrel=2
pkgdesc="SSDT Patch to fix missing speakers sound in Linux on Asus Zenbook 14 UX3405MA (2024) and latest BIOS"
arch=("x86_64")
url="https://github.com/smallcms/asus_zenbook_ux3405ma"
license=("unknown")
install="asus_zenbook_ux3405ma.install"
optdepends=("grub")
makedepends=("git" "acpica")
source=(
    "git+https://github.com/smallcms/asus_zenbook_ux3405ma.git"
    mkinitcpio_zenbook_ux3405ma.conf
)
md5sums=('SKIP'
         'e0bf81584f54c895b1ca5bf770883333')
sha256sums=('SKIP'
            '1c8caf87b37cde3f1e46e5a061acdcc6159bca26b291cfd5913ef8e985de9dd1')

build() {
    iasl -tc $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.dsl
}

pkgver() {
    cd asus_zenbook_ux3405ma        

    # Use the number of revisions since beginning of the history
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    # GRUB systems
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.aml $pkgdir/boot/ssdt-csc3551.aml
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/01_acpi $pkgdir/etc/grub.d/01_acpi

    # systemd-boot
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.aml $pkgdir/etc/initcpio/acpi_override/ssdt-csc3551.aml
    install -Dm755 $srcdir/mkinitcpio_zenbook_ux3405ma.conf $pkgdir/etc/mkinitcpio.conf.d/zenbook_ux3405ma.conf

    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/pipewire/media-session.d/alsa-monitor.conf $pkgdir/etc/pipewire/media-session.d/alsa-monitor.conf
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/pipewire/pipewire.conf.d/pwrate.conf $pkgdir/etc/pipewire/pipewire.conf.d/pwrate.conf
    
    # Wireplumber >= 0.5
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/wireplumber/wireplumber.conf.d/51-disable-suspension.conf $pkgdir/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.conf
    
    # Wireplumber < 0.5
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/wireplumber/main.lua.d/51-disable-suspension.lua $pkgdir/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.lua
}
