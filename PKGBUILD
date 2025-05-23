# Maintainer: Jack Mechem <mechemjack@gmail.com>
pkgname=midirun-config
pkgver=0.1.2.beta
pkgrel=2
pkgdesc="TOML configuration genorator for Midirun"
arch=('x86_64')
url="https://github.com/JackMechem/midirun-config"
license=('MIT')
options=('!debug')
depends=('gtkmm-4.0' 'rtmidi' 'systemd' 'tomlplusplus' 'bash' 'libevdev')
makedepends=('meson' 'ninja' 'git' 'pkgconf')
source=(
    "git+https://github.com/JackMechem/midirun-config.git#tag=v0.1.2-beta"
    "99-midirun-config-uinput.rules"
    "99-midirun-config-uinput.hook"
    "midirun-config-udevadm-control-trigger"
    "midirun-config.install"
)
install=midirun-config.install
md5sums=('74f905e4a3092e00583025a833fa512a'
         'e762209dded072f5a3a756b12efce890'
         '722e3f658a371145d7e076979c8b7fc8'
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
    install -Dm755 "$srcdir/midirun-config-udevadm-control-trigger" "$pkgdir/usr/bin/midirun-config-udevadm-control-trigger"
}
