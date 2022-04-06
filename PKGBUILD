# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Co-Maintainer: Tech <technetium1337 at gmail dot com>
# Contributor: taotieren <admin at taotieren dot com>

# Note: The 1.1.8 codebase just doesn't build, I believe through no fault of my own. Will continue fixing this at next release. Ticket in with developers.

pkgname=rustdesk
pkgver=1.1.8
pkgrel=2
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!"
arch=('any')
url="https://github.com/rustdesk/rustdesk"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git ${pkgname}-bin)
#replaces=(${pkgname})
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio') # 'libsciter-gtk')
makedepends=('unzip' 'yasm' 'nasm' 'clang' 'zip' 'pkgconf' 'make' 'git' 'cmake' 'gcc' 'curl' 'wget' 'rust' 'vcpkg')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rustdesk/rustdesk/archive/refs/tags/${pkgver}.tar.gz"
        "libsciter-gtk.so::https://github.com/c-smile/sciter-sdk/raw/0298f1b34e9a0ff1dffb889d82c506a5da8bfb1e/bin.lnx/x64/libsciter-gtk.so" # This is horrible. Unfortunately the AUR package for this seems abandoned.
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.desktop"
        "${pkgname}.png::https://avatars.githubusercontent.com/u/71636191?v=4")
sha256sums=('2878fd1e414916e900e091608927a7469e238814dfa755c9ba5758aa04bbaada'
            'a1682fbf55e004f1862d6ace31b5220121d20906bdbf308d0a9237b451e4db86'
            'b6cf25e231687a6caf178a87113b74482354aea2f8a3f6b8b5800169ce55fb10'
            '642d5ee9d8286d1b95e3580fdea135832f609a643b98a13874e9bfe8eb8e71a4'
            '1b141964fd9f4d21b77cc729e16989d8b7f2dce2745183e35676a3d6bfeeff3b'
            '04b2457a0eff7c82ec499a6f7a4e5474de054a93c1760bd91833a4aef5c881a9')
build() {
# Place libsciter-gtk.so
    install -Dm0644 "${srcdir}/libsciter-gtk.so" -t "${srcdir}/${pkgname}-${pkgver}/target/release"

# Build rustdesk
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release
# }

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

# I have no idea what previous maintainer was doing with this.
# install ui
    # cp -r "${srcdir}/${pkgname}-${pkgver}/src" "${pkgdir}/usr/share/${pkgname}"

# Install libsciter-gtk.so
    install -Dm755 "${srcdir}/libsciter-gtk.so" "${pkgdir}/usr/lib/rustdesk/libsciter-gtk.so"

    install -Dm0644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
