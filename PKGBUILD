# Maintainer: bytedream <me@bytedream.dev>
#
# This file is copied from the 'cinny-desktop' package (https://aur.archlinux.org/packages/cinny-desktop) and modified to include the system tray patches.
pkgname='cinny-desktop-system-tray'
pkgver='4.10.1'
pkgrel='3'
pkgdesc='Yet another matrix client - with support for system tray minimization'
arch=('x86_64')
url='https://cinny.in/'
license=('MIT')
conflicts=('cinny-desktop' 'cinny-desktop-bin')
depends=('gst-plugins-good' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips' 'openssl' 'sqlite' 'webkit2gtk')
makedepends=('nodejs' 'npm' 'rust')
source=("cinny-desktop-${pkgver}.zip::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny-desktop-v${pkgver}.zip"
        "system_tray_item.patch"
        "single_instance_support.patch")
md5sums=('eeba3b5ab6e9eca71a011b12c4609660'
         'f9489548639237caa6f29fd2218b9d3b'
         '79d8f8ca0527a2a51ee9080bf69c94da')

prepare() {
    patch -d cinny-desktop -Np1 -i ../system_tray_item.patch || true
    patch -d cinny-desktop -Np1 -i ../single_instance_support.patch

    cargo update -p tauri --manifest-path cinny-desktop/src-tauri/Cargo.toml
    cargo update -p tauri-plugin-single-instance --manifest-path cinny-desktop/src-tauri/Cargo.toml
}

build() {
    cd cinny-desktop
    cd ./cinny && npm --legacy-peer-deps ci
    cd .. && npm ci
    NODE_OPTIONS=--max_old_space_size=4096 npm run tauri build -- --bundles deb
}

package() {
    ar x "cinny-desktop/src-tauri/target/release/bundle/deb/cinny_${pkgver}_amd64.deb" 'data.tar.gz'
    tar xzf 'data.tar.gz' -C "${pkgdir}"
    # while we're at it, fix some wayland related issues (https://github.com/cinnyapp/cinny-desktop/issues/458)
    sed -i 's/Exec=cinny/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 cinny/' "${pkgdir}/usr/share/applications/cinny.desktop"
}
