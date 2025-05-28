# Maintainer: seiuneko <chfsefefgesfen foxmail>

pkgname=r-nacos-git
_pkgname=rnacos
__pkgname=${pkgname%-git}
pkgver=0.6.16.r0.gcf4354f
pkgrel=1
pkgdesc='Nacos server re-implemented in Rust.'
url='https://github.com/nacos-group/r-nacos'
license=('Apache-2.0')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
depends=('glibc' 'gcc-libs' 'bzip2' 'openssl' )
makedepends=('git' 'cargo')
arch=('x86_64')
source=("${pkgname}::git+${url}.git"
        "${_pkgname}.service"
        "${_pkgname}-sysusers.conf"
        "${_pkgname}-tmpfiles.conf"
)
b2sums=('SKIP'
        '5a8c65b559035e8753e8b7d427b59c85f98b18c39846d68aeef43cc3debb8e783a5cc981b30301f30d1d98da4d2ae2621da7614142a0eafc2ae4f995a0681fc9'
        '5318e644b58d2a0aa3c28bb7c21768660ff17fe514f462e03b3386e2d165a75fe7a39163041d79e598d20da479cf6e47434efd98392d5fbb760918140089871f'
        'e695c8210da634eab840d28fa2302d3827cd392a789d4cb591875f0e453ba994d45494a7374470d0fb9a7b844574242cd098f774945d83abf13211ee78bdf5ff')
options=('!lto')

pkgver() {
    cd "$srcdir/${pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname}"

    sed -i 's/runtime-tokio-rustls/runtime-tokio-native-tls/' Cargo.toml

    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    # cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname}"

    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"

    install -Dm0644 doc/conf/.env.example "${pkgdir}/etc/${_pkgname}/env.conf"

    install -Dm0644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm0644 "${srcdir}/${_pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm0644 "${srcdir}/${_pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${__pkgname}/LICENSE"
}
