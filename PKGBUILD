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
pkgver=1.4.0.r15.g2f24a32
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
    export CARGO_HOME="$srcdir"/.cargo
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname%-git}
    [[ -n $_sccache ]] && export RUSTC_WRAPPER=sccache
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    export CARGO_HOME="$srcdir"/.cargo
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd ${pkgname%-git}
    install -Dm755 target/release/${pkgname%-git} -t "$pkgdir"/usr/bin/
}
