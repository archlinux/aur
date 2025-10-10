# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=ironbar-git
pkgver=0.17.1.r11.gbd6b5a1
pkgrel=1
makedepends=('rust' 'cargo' 'git' 'openssl')

depends=(
  'gtk4' 
  'gtk4-layer-shell' 
  'lua51-lgi' 
  'libinput'
  'libpulse'
  'luajit'
)

provides=('ironbar')
conflicts=('ironbar')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Customisable wlroots/sway bar written in rust"
license=('MIT')
source=('git+https://github.com/JakeStanger/ironbar')
url='https://ironb.ar'
md5sums=('SKIP')

# See: <https://ironb.ar/issues/921>
options=('!lto')

pkgver() {
    cd "$srcdir/ironbar"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
    cd "$srcdir/ironbar"
    cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/ironbar/target/release/ironbar" "$pkgdir/usr/bin/ironbar"

  install -Dm 644 "$srcdir/ironbar/target/completions/ironbar.bash" "$pkgdir/usr/share/bash-completion/completions/ironbar"
  install -Dm 644 "$srcdir/ironbar/target/completions/_ironbar" "$pkgdir/usr/share/zsh/site-functions/_ironbar"
  install -Dm 644 "$srcdir/ironbar/target/completions/ironbar.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ironbar.fish"

  install -Dm 644 "$srcdir/ironbar/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
