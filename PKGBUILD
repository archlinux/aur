# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=ironbar-git
pkgver=0.16.1.r212.gf2bc33e
pkgrel=1
makedepends=('rust' 'cargo' 'git' 'openssl' 'libpulse' 'luajit')
depends=('gtk3' 'gtk-layer-shell' 'lua51-lgi' 'libdbusmenu-glib' 'libinput' 'libdbusmenu-gtk3')
provides=('ironbar')
conflicts=('ironbar')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Customisable wlroots/sway bar written in rust"
license=('MIT')
source=('git+https://github.com/JakeStanger/ironbar')
url='https://ironb.ar'
md5sums=('SKIP')

# weird linker error from `colpetto` crate
# can occur with default makepkg flags.
# seemingly copying those exact default flags into this file
# makes it work, so no idea what's going on, but this sorts it.
# See: <https://ironb.ar/issues/921>
options=('!buildflags')

pkgver() {
    cd "$srcdir/ironbar"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
    cd "$srcdir/ironbar"

    # copied from a modern default makepkg.conf file -
    # works around the `!buildflags`` issue described above.
    CFLAGS="-march=native -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection \
        -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
    CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
    LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now \
         -Wl,-z,pack-relative-relocs"

    cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/ironbar/target/release/ironbar" "$pkgdir/usr/bin/ironbar"

  install -Dm 644 "$srcdir/ironbar/target/completions/ironbar.bash" "$pkgdir/usr/share/bash-completion/completions/ironbar"
  install -Dm 644 "$srcdir/ironbar/target/completions/_ironbar" "$pkgdir/usr/share/zsh/site-functions/_ironbar"
  install -Dm 644 "$srcdir/ironbar/target/completions/ironbar.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ironbar.fish"
}
