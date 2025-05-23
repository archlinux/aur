# Maintainer: Jack Mechem <mechemjack@gmail.com>
pkgname=midirun
pkgver=0.2.1.beta
pkgrel=5
pkgdesc="Daemon and program to simulate key strokes from midi inputs"
arch=('x86_64')
url="https://github.com/JackMechem/midirun"
license=('MIT')
options=('!debug')
depends=('rtmidi' 'systemd' 'tomlplusplus')
makedepends=('meson' 'ninja' 'git' 'pkgconf')
source=(
    "git+https://github.com/JackMechem/midirun.git#tag=v0.2.1-beta"
    "99-midirun-uinput.rules"
    "99-midirun-uinput.hook"
    "udevadm-control-trigger"
    "midirun.install"
    "midirun.conf"
)
install=midirun.install
md5sums=('a3ff86395d15f9f67b393f8daf2d6ea4'
         'ac0a9f1727380523b655448f1c34f5f2'
         '15832357c3ce0f45997ddcd329052954'
         '51d20ccd440519405ed7a25a5bcf444e'
         '6447bf182d41f620a95d3c4ece3d01f7'
         '895c8735878bc1611cf6e1ee71f60ee6')
build() {
    cd "$srcdir/$pkgname"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}
package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" meson install -C build
    cd "$srcdir"

    install -Dm644 "$srcdir/99-midirun-uinput.rules" "$pkgdir/usr/lib/udev/rules.d/99-midirun-uinput.rules"
    install -Dm644 "$srcdir/99-midirun-uinput.hook" "$pkgdir/usr/share/libalpm/hooks/99-midirun-uinput.hook"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/udevadm-control-trigger" "$pkgdir/usr/bin/udevadm-control-trigger"
    install -Dm644 "$srcdir/midirun.conf" "$pkgdir/etc/modules-load.d/midirun.conf"
}
