pkgname='lemon-cord-git'
pkgver=0.1.2.r112.ga4e614c
pkgrel=1
pkgdesc='A fast & light-weight Discord Client written in Rust using the wry crate'
arch=('x86_64')
url='https://github.com/japandotorg/lemon-cord'
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'libayatana-indicator')
makedepends=('git' 'cargo')
provides=('lemon-cord')
conflicts=('lemon-cord')
source=(
    "${pkgname}::git+${url}"
    "lemon-cord.desktop"
)
sha384sums=(
    'SKIP'
    '7bb66579a1666c673060fcfdf0ab1e625c10d22c1e09dcd25336ad57330a62eba57b906f8e0c59cb121cecb8dc37a850'
)

pkgver() {
    cd "${pkgname}"
    b_ver="$(grep '^version =' Cargo.toml | head -n1 | awk -F '"' '{print $2}')"
    echo "${b_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    install -Dm644 "lemon-cord.desktop"                          "${pkgdir}/usr/share/applications/${provides}.desktop"

    cd "${pkgname}"
    install -Dm755 "target/release/lemon-cord"                   "${pkgdir}/opt/${provides}/target/release/${provides}"
    install -d     "${pkgdir}/usr/bin/"
    ln -sf         "/opt/${provides}/target/release/${provides}" "${pkgdir}/usr/bin/${provides}"
    cp -r          "assets/"                                     "${pkgdir}/opt/${provides}/"
    
    install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/licenses/${provides}/LICENSE"
    install -Dm644 "README.md"                                   "${pkgdir}/usr/share/doc/${provides}/README.md"
    install -Dm644 "assets/logo.webp"                            "${pkgdir}/usr/share/icons/lemon-cord.png"
}
