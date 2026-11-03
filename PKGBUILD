# Maintainer: Cedric Roijakkers <cedric.roijakkers01 at vodafoneziggo dot com>

pkgname=freerdp-aad-helper
pkgver=3.33.0
pkgrel=1
pkgdesc='AAD (Entra ID) browser auth helpers for FreeRDP (webview and xdg-open), for Azure Virtual Desktop'
arch=('x86_64')
url='https://github.com/FreeRDP/FreeRDP'
license=('Apache-2.0' 'MIT')
depends=('freerdp' 'webkit2gtk-4.1' 'python' 'xdg-utils')
makedepends=('cmake' 'ninja' 'git' 'openssl')
source=("git+https://github.com/FreeRDP/FreeRDP#tag=${pkgver}"
        "git+https://github.com/akallabeth/webview#commit=2a0a1303c5e8c9c5b73fa9e461739042ebdabe6f")
sha512sums=('e83a99668463c8ba70d03fb9799f34e3a4eb3e2cb4af564c7ae0c47609d2fbf889a05c31f72037f6ee68307133cfeb97eef21f8085980124df7977ca4402fb21'
            'f5b3fce27cdf53207613470ddb8d21931ddb0fa90d4db6170fe36c30fc408996f7451595ab56a7105c86bcbb208a27a7a710d1a4a0a445d2958ba107083d25c4')

prepare() {
  # The webview helper fetches this fork with FetchContent at configure time, which fails in
  # offline build chroots. The helper accepts an in-tree copy at external/webview instead.
  cp -a webview FreeRDP/external/webview
}

build() {
  cmake -S FreeRDP -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_MANPAGES=OFF \
    -DWITH_WINPR_TOOLS=OFF \
    -DWITH_SAMPLE=OFF \
    -DWITH_SERVER=OFF \
    -DWITH_PROXY=OFF \
    -DWITH_CHANNELS=OFF \
    -DWITH_CLIENT_SDL=OFF \
    -DWITH_X11=OFF \
    -DWITH_WAYLAND=OFF \
    -DWITH_FUSE=OFF \
    -DWITH_CUPS=OFF \
    -DWITH_PCSC=OFF \
    -DWITH_PULSE=OFF \
    -DWITH_ALSA=OFF \
    -DWITH_SYSTEMD=OFF \
    -DWITH_FFMPEG=OFF \
    -DWITH_SWSCALE=OFF \
    -DWITH_DSP_FFMPEG=OFF \
    -DWITH_KRB5=OFF \
    -DWITH_ICU=OFF \
    -DWITH_WEBVIEW_AAD_AUTH_HELPER=ON \
    -DWITH_XDG_AAD_AUTH_HELPER=ON
  cmake --build build --target freerdp-webview-aad-helper
}

package() {
  # Only the helpers are installed (component "client"); this also strips the build-tree
  # rpath, so the binary resolves libwinpr3/libfreerdp3 from the freerdp package.
  DESTDIR="${pkgdir}" cmake --install build --component client

  install -Dm644 FreeRDP/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 webview/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
