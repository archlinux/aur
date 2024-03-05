# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=scu-git
pkgver=1.4.0.r11.gaa71db4
pkgrel=1
pkgdesc="System fetch utility is aimed at informativeness"
arch=(i686 x86_64)
url="https://gitlab.com/omnitix/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs)
makedepends=(git rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
options=(!debug !lto)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd ${pkgname%-git}
    export CARGO_HOME=$srcdir/${pkgname%-git}/.cargo           # Download all to src directory, not in ~/.cargo
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname%-git}
    [[ -n $_sccache ]] && export RUSTC_WRAPPER=sccache         # If $_sccache not empty, build using binary cache
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"           # Prevent warning: 'Package contains reference to $srcdir'
    export CARGO_HOME=$srcdir/${pkgname%-git}/.cargo           # Use downloaded earlier from src directory, not from ~/.cargo
    export CARGO_TARGET_DIR=target                             # Place the output in target relative to the current directory
    cargo build --release
}

package() {
    cd ${pkgname%-git}
    install -Dm755 target/release/${pkgname%-git}              -t $pkgdir/usr/bin/
}
