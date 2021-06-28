# Maintainer: taotieren <admin@taotieren.com>

pkgname=rustdesk
pkgver=1.1.6
pkgrel=3
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk! "
arch=('any')
url="https://github.com/rustdesk/rustdesk"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git ${pkgname}-bin)
#replaces=(${pkgname})
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio')
makedepends=('unzip' 'yasm' 'nasm' 'clang' 'zip' 'pkg-config' 'make' 'git' 'cmake' 'gcc' 'curl' 'wget' 'rust' 'python')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "vcpkg::git+https://github.com/microsoft/vcpkg#commit=ec6fe06e8da05a8157dc8581fa96b36b571c1bd5"
        "libsciter-gtk.so::https://github.com/c-smile/sciter-sdk/raw/dc65744b66389cd5a0ff6bdb7c63a8b7b05a708b/bin.lnx/x64/libsciter-gtk.so"
        "${pkgname}.svg::${url}/blob/master/logo-header.svg")
sha256sums=('a5338c95ca147c87a8d9eced9674628bd26385a042691ec8cde190847eaaa7ae'
            'SKIP'
            '933402087be7fe14988b43345597158c602fc2adbc7e7631ec82511af5d27698'
            '5b05927b093730188432a12c69ced05fe7489161712da9e5911564bfc2e4ba7a')
build() {
# install vcpkg
# git clone https://github.com/microsoft/vcpkg --branch 2020.11-1
    vcpkg/bootstrap-vcpkg.sh
    mkdir -pv ${srcdir}/vcpkg
    export VCPKG_ROOT=${srcdir}/vcpkg
    vcpkg/vcpkg install libvpx libyuv opus

# install libsciter-gtk.so
    install -Dm0644 "${srcdir}/libsciter-gtk.so" "${srcdir}/${pkgname}-${pkgver}/target/release"

# build rustdesk
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo test --release
}

package() {
# install rustdesk
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname}/
./${pkgname}
EOF

# install ui
    cp -r "${srcdir}/${pkgname}-${pkgver}/src" "${pkgdir}/usr/share/${pkgname}"

# install libsciter-gtk.so
    cp -r "${srcdir}/libsciter-gtk.so" "${pkgdir}/usr/share/${pkgname}"

    install -Dm0644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" << EOF
[Unit]
Description=RustDesk
Requires=network.target
After=systemd-user-sessions.service

[Service]
Type=simple
ExecStart=/usr/bin/${pkgname} --service
PIDFile=/var/run/${pkgname}.pid
KillMode=mixed
TimeoutStopSec=30
User=root
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop"  << EOF
[Desktop Entry]
Version=${pkgver}
Name=RustDesk
GenericName=Remote Desktop
GenericName[zh_CN]=远程桌面
Comment=Remote Desktop
Comment[zh_CN]=远程桌面
Exec=${pkgname} %u
Icon=${pkgname}.svg
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Other;
Keywords=internet;
Actions=new-window;

X-Desktop-File-Install-Version=0.23

[Desktop Action new-window]
Name=Open a New Window
EOF

}
