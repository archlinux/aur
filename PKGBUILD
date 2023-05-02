# Maintainer: poly000 <1348292515@qq.com>
pkgname=waylyrics-git
_pkgname=waylyrics
__pkgname=Waylyrics
_appname="io.poly000.${_pkgname}"
pkgver=0.1.0_r48.g05e3546
pkgrel=1
pkgdesc="On screen lyrics for wayland with netease cloud music source"
url="https://github.com/poly000/waylyrics"

conflicts=('waylyrics')
provides=('waylyrics')

arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

license=('MIT')
depends=('gtk4')
makedepends=('cargo' 'git' 'jq')

source=("git+https://github.com/poly000/${_pkgname}.git"
"${_pkgname}-launch"
"${__pkgname}.desktop"
)

sha256sums=('SKIP'
            'd5291658ee62ce73605b4efbe78e4f8ded359d2766cfd2cb5f7e309ca540dedf'
            '28abb9904837437faafb12c3f71f7dcd8529936309d6a797ad46915aca63d613')

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
   install -Dm644 config.toml.example "${pkgdir}/usr/share/${_pkgname}/config.toml"
   install -Dm644 style.css.example "${pkgdir}/usr/share/${_pkgname}/style.css"
   install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
   install -Dm644 ${_appname}.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/${_appname}.gschema.xml"

   # fixed path by Integral-Tech
   cd -
   install -Dm755 ${_pkgname}-launch "${pkgdir}/usr/bin/${_pkgname}-launch"
   install -Dm755 ${__pkgname}.desktop "${pkgdir}/usr/share/applications/${__pkgname}.desktop"
}

