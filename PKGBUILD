# Maintainer: Shorin <2433516202@qq.com>

_pkgname=key2touch
pkgname=key2touch-git
pkgver=r3.g37c35b6
pkgrel=1
pkgdesc="Map keyboard keys to touchscreen input on Wayland desktops, made for playing on Waydroid"
arch=('any')
url="https://github.com/SHORiN-KiWATA/key2touch"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
    'python'
    'python-cairo'
    'python-evdev'
    'python-gobject'
)
makedepends=('git')
optdepends=('waydroid: run Android games')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=key2touch.install
options=('!debug')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m compileall -q -d /usr/lib/key2touch/key2touch key2touch
}

package() {
    cd "$_pkgname"
    local appid=io.github.shorin_kiwata.key2touch

    install -dm755 "$pkgdir/usr/lib/key2touch"
    cp -r --no-preserve=ownership key2touch "$pkgdir/usr/lib/key2touch/"
    install -Dm644 "data/$appid.svg" "$pkgdir/usr/lib/key2touch/data/$appid.svg"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/key2touch" <<'SH'
#!/bin/sh
export PYTHONPATH="/usr/lib/key2touch${PYTHONPATH:+:$PYTHONPATH}"
exec python3 -m key2touch "$@"
SH
    chmod 755 "$pkgdir/usr/bin/key2touch"

    install -Dm644 "data/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "data/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm644 data/60-key2touch-uinput.rules "$pkgdir/usr/lib/udev/rules.d/60-key2touch-uinput.rules"
    install -Dm644 data/key2touch-uinput.conf "$pkgdir/usr/lib/modules-load.d/key2touch-uinput.conf"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
