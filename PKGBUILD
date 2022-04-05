# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: mochaaP <aur@mochaa.ws>

_pkgbase=rustdesk
pkgname=${_pkgbase}-dynamic-git
pkgver=1.1.8.r397.gcb50696
pkgrel=1
pkgdesc="Remote desktop written in Rust (system libs)"
arch=($CARCH)
url="https://github.com/mcha-forks/rustdesk"
license=('GPL3')
provides=(${_pkgbase})
conflicts=(${_pkgbase} ${_pkgbase}-git ${_pkgbase}-bin)
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio' 'libsciter-gtk-git-bin')
makedepends=('unzip' 'yasm' 'nasm' 'clang' 'zip' 'pkg-config' 'git' 'cmake' 'wget' 'cargo' 'python')
source=("${_pkgbase}::git+${url}.git"
        "${_pkgbase}.sh"
        "${_pkgbase}.service")
sha256sums=('SKIP'
            '0026ed7f9ae7c7753b6015d478d8fabd1ade96adc45c70ce68ad0b9de7d2ce8a'
            '49e1c317b708b63224389316db8fa4e705c5281dd397032bca87ff9d1ff97baf')

pkgver() {
    cd ${srcdir}/${_pkgbase}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${_pkgbase}
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${srcdir}/${_pkgbase}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd ${srcdir}/${_pkgbase}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    install -dm755 "${pkgdir}/opt/${_pkgbase}"

    install -Dm755 "${srcdir}/${_pkgbase}/target/release/${_pkgbase}" "${pkgdir}/opt/${_pkgbase}/"

    mkdir -p "${pkgdir}/opt/${_pkgbase}/src/ui"
    cp "${srcdir}/${_pkgbase}"/src/ui/*.{html,css,tis} "${pkgdir}/opt/${_pkgbase}/src/ui/"

    install -Dm755 "${srcdir}/${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

    install -Dm644 "${srcdir}/${_pkgbase}/logo-header.svg" "${pkgdir}/usr/share/pixmaps/${_pkgbase}.svg"
    install -Dm644 "${srcdir}/${_pkgbase}.sh" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"  << EOF
[Desktop Entry]
Version=${pkgver}
Name=RustDesk
GenericName=Remote Desktop
GenericName[zh_CN]=远程桌面
Comment=Remote Desktop
Comment[zh_CN]=远程桌面
Exec=${_pkgbase} %u
Icon=${_pkgbase}
Terminal=false
Type=Application
MimeType=application/tup;
Categories=Internet;

X-Desktop-File-Install-Version=0.23
EOF
}
