# Maintainer: Jack Mechem <mechemjack@gmail.com>
pkgname=midirun-config
pkgver=0.1.1.beta
pkgrel=1
pkgdesc="TOML configuration genorator for Midirun"
arch=('x86_64')
url="https://github.com/JackMechem/midirun-config"
license=('MIT')
options=('!debug')
depends=('gtkmm-4.0' 'rtmidi' 'systemd' 'tomlplusplus' 'bash' 'libevdev')
makedepends=('meson' 'ninja' 'git' 'pkgconf')
source=(
    "git+https://github.com/JackMechem/midirun-config.git#tag=v0.1.1-beta"
    "99-midirun-config-uinput.rules"
    "99-midirun-config-uinput.hook"
    "udevadm-control-trigger"
    "midirun-config.install"
)
install=midirun-config.install
md5sums=('a84bb079b8dfe7b8576fba2f232775ae'
         'e762209dded072f5a3a756b12efce890'
         '42861b0e3e0610fbee5f1c2ed30a93a9'
         '51d20ccd440519405ed7a25a5bcf444e'
         '6447bf182d41f620a95d3c4ece3d01f7')
build() {
    cd "$srcdir/$pkgname"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}
package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" meson install -C build
    cd "$srcdir"

    install -Dm644 "$srcdir/99-midirun-config-uinput.rules" "$pkgdir/usr/lib/udev/rules.d/99-midirun-config-uinput.rules"
    install -Dm644 "$srcdir/99-midirun-config-uinput.hook" "$pkgdir/usr/share/libalpm/hooks/99-midirun-config-uinput.hook"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/udevadm-control-trigger" "$pkgdir/usr/bin/udevadm-control-trigger"
}
