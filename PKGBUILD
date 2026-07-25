# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=kwin-polonium-git
pkgver=1.2.1.r0.g3638b16
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up (Git version)'
arch=(x86_64 i686 aarch64 armv7h)
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('cargo' 'git' 'npm' 'typescript')
conflicts=('kwin-polonium')
provides=('kwin-polonium')

source=('git+https://github.com/zeroxoneafour/polonium.git'
        'git+https://github.com/zeroxoneafour/kwin-api.git')
sha1sums=('SKIP'
          'SKIP')

pkgver() {
  cd polonium
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd polonium
    git submodule init
    git config submodule.kwin-api.url "$srcdir/kwin-api"
    git -c protocol.file.allow=always submodule update

    cd dbus-saver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd polonium
    [[ -d pkg ]] && make clean
    make src res

    cd dbus-saver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd polonium
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"
    install -D -o root -m 644 -t "$pkgdir/usr/share/applications" res/polonium-settings.desktop

    install -D -o root -m 755 -t "$pkgdir/usr/bin" dbus-saver/target/release/polonium-saver
    install -D -o root -m 644 -t "$pkgdir/usr/lib/systemd/user" dbus-saver/polonium-saver.service
    install -D -o root -m 644 -t "$pkgdir/usr/share/dbus-1/services" dbus-saver/xyz.vaughanm.polonium.service

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
