# Maintainer: Jack Mechem <mechemjack@gmail.com>
pkgname=midirun
pkgver=0.2.1.beta
pkgrel=1
pkgdesc="Daemon and program to simulate key strokes from midi inputs"
arch=('x86_64')
url="https://github.com/JackMechem/midirun"
license=('MIT')
options=('!debug')
depends=('gtkmm-4.0' 'rtmidi' 'systemd' 'tomlplusplus' 'bash')
makedepends=('meson' 'ninja' 'git' 'pkgconf')
source=(
  "git+https://github.com/JackMechem/midirun.git"
  "99-midirun-uinput.rules"
  "99-midirun-uinput.hook"
  "udevadm-control-trigger"
)
md5sums=('SKIP'
         'b7060d9d0d0d5fad0c75f4c2ba56b736'
         '15832357c3ce0f45997ddcd329052954'
         '51d20ccd440519405ed7a25a5bcf444e')

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
}
