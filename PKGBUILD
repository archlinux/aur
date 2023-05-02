# Maintainer: poly000 <1348292515@qq.com>
pkgname=waylyrics-git
_pkgname=waylyrics
pkgver=0.1.0_r39.gc266dbd
pkgrel=1
pkgdesc="On screen lyrics for wayland with netease cloud music source"
url="https://github.com/poly000/waylyrics"

arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

license=('MIT')
depends=('gtk4')
makedepends=('cargo' 'git' 'jq')

source=('git+https://github.com/poly000/waylyrics.git'
'waylyrics-launch'
)

sha256sums=('SKIP'
            'd5291658ee62ce73605b4efbe78e4f8ded359d2766cfd2cb5f7e309ca540dedf')

pkgver() {
    cd "$srcdir/$_pkgname"
    semver=$(cargo metadata --no-deps --format-version=1 | jq -r '.packages | .[0] | .version')
    echo "${semver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # workarounds to allow enabling feature gates with stable rustc
    # this should be ok since localkey is not in active development
    export RUSTC_BOOTSTRAP=1

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
   cd "$srcdir/$_pkgname"
   install -Dm644 config.toml.example ${pkgdir}/usr/share/${_pkgname}/config.toml
   install -Dm644 style.css.example ${pkgdir}/usr/share/${_pkgname}/style.css
   install -Dm755 "../../waylyrics-launch" ${pkgdir}/usr/bin/waylyrics-launch
   install -Dm755 target/release/waylyrics ${pkgdir}/usr/bin/waylyrics 
   install -Dm644 io.poly000.waylyrics.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/io.poly000.waylyrics.gschema.xml 
}

