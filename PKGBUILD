# Maintainer: Jan “Khardix” Staněk <khardix [at] gmail [dot] com>

pkgname=greetd-artix-openrc
pkgver=0.8.0
pkgrel=1
pkgdesc="Generic greeter daemon, packaged for artix-openrc"
arch=('x86_64')
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/greetd/archive/${pkgver}.tar.gz"
        "change-default-vt.patch"
        "greetd.initd"
        "greetd.confd"
        "greetd.pam"
        "greetd.sysusers")
sha256sums=('47a73709df60f04b63fc50cfc409e47a451a9620777638f527b9d9333256035f'
            'cad9073f77421e21752806ae74dbbc4c3ccf30978e196b6a1ae07382e4a7caa8'
            'a599f719a445eee3b9f3f38962e9ae706b3ef0986affbca95f025dd98095bbd8'
            'aeed4de39fdb471e0ad8a7f1471232e97925447213292fe4c57317aab6cf035a'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            '4284359a977acec757f97fae11bc8ec8a579b35238594b68d5eb5cc6feb130ba')

depends=(pam)
makedepends=(cargo scdoc)
optdepends=(
    'greetd-gtkgreet: Simple GTK-based greeter'
    'greetd-wlgreet: Wayland greeter'
    'greetd-tuigreet: TUI-based greeter'
)

backup=(
    'etc/greetd/config.toml'
    'etc/init.d/greetd'
    'etc/conf.d/greetd'
    'etc/pam.d/greetd'
)

prepare() {
    cd "greetd-${pkgver}/"

    patch <"${srcdir}/change-default-vt.patch"

    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}
build() {
    cd "greetd-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix=${PWD}=/build/"
    cargo build --frozen --release --all-features \
        --workspace --exclude fakegreet

    find man/ -type f -name '*.scd'|while read -r page
    do
        scdoc <"${page}" >"${page%.scd}.roff"
    done

}
check() {
    cd "greetd-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
package() {
    find "greetd-${pkgver}/target/release/" -maxdepth 1 -type f -executable \
        -exec install -m0755 -Dt "${pkgdir}/usr/bin/" '{}' +

    install -m0644 -Dt  "${pkgdir}/etc/greetd/" "greetd-${pkgver}/config.toml"
    install -m0755 -D   greetd.initd            "${pkgdir}/etc/init.d/greetd"
    install -m0644 -D   greetd.confd            "${pkgdir}/etc/conf.d/greetd"
    install -m0644 -D   greetd.pam              "${pkgdir}/etc/pam.d/greetd"
    install -m0644 -D   greetd.sysusers         "${pkgdir}/usr/lib/sysusers.d/greetd.conf"

    for section in 1 5 7
    do
        find "greetd-${pkgver}/man/" -type f -name "*-${section}.roff"|while read -r manpage
        do
            install -m0644 -D "${manpage}" "${pkgdir}/usr/share/man/man${section}/$(basename "${manpage%-*}").${section}"
        done
    done
}
