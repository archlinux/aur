# Maintainer: poly000 <1348292515@qq.com>
pkgname=waylyrics-git
_pkgname=waylyrics
_appname="io.poly000.${_pkgname}"
pkgver=0.1.0_r69.gf9de900
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
"${_appname}.desktop"
)

sha256sums=('SKIP'
            '0726301af6d2a57ac2130319a000e32ec70f94c01fdedc78910fd0525e16a68c'
            '5d46c3ef8a3c587f8a267ccb41463707cc3ed7bfb3beb6052d6e8ecd0f7fb652')

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
    install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${_appname}.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/${_appname}.gschema.xml"

    install -dm755 "${pkgdir}/usr/share/${_pkgname}/themes"


    IFS=$'\n'
    for style in `find themes -type f`
    do
        install -Dm644 "${style}" -t "${pkgdir}/usr/share/${_pkgname}/themes"
    done

    cp -r res/* "${pkgdir}/usr/share/"

    # fixed path by Integral-Tech
    cd -
    install -Dm755 ${_pkgname}-launch "${pkgdir}/usr/bin/${_pkgname}-launch"
    install -Dm755 ${_appname}.desktop "${pkgdir}/usr/share/applications/${_appname}.desktop"
}

