# Maintainer: Unisic maintainers <https://github.com/unisic/unisic/issues>
#
# AUR source package. Deliberately NOT a copy of packaging/arch/PKGBUILD:
# that one feeds OBS and the GitHub release asset, and its unisic.install
# scriptlet appends the OBS pacman repo to /etc/pacman.conf. An AUR package
# must never enable a third-party repository, and here it would also be
# wrong: the user's AUR helper owns the update path. Regenerate both AUR
# recipes with packaging/aur/sync.sh rather than editing pkgver by hand.

pkgname=unisic
pkgver=0.7.5
pkgrel=1
pkgdesc='Capture, annotate, record and share your screen on Linux Wayland'
arch=('x86_64')
url='https://github.com/unisic/unisic'
license=('GPL-3.0-or-later')
# tesseract/leptonica/layer-shell-qt are hard deps rather than optdepends:
# this build links them (HAVE_TESSERACT / HAVE_LAYERSHELL are detected, not
# switched off), so the binary needs the libraries present at runtime.
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'pipewire' 'ffmpeg' 'wl-clipboard'
         'xdg-desktop-portal' 'tesseract' 'leptonica' 'layer-shell-qt' 'zxing-cpp' 'kguiaddons'
         'libinput' 'hicolor-icon-theme')
# Only the build-time-exclusive tools: everything else this links against is
# already a runtime dependency above, and Arch's guidelines want each package
# listed once. `wayland` is here for wayland-scanner.
makedepends=('cmake' 'ninja' 'pkgconf' 'qt6-tools' 'wayland')
optdepends=('curl: FTP/SFTP upload destinations'
            'xdg-desktop-portal-kde: KDE portal backend for screenshots and screen recording'
            'xdg-desktop-portal-gtk: generic portal backend on non-KDE desktops'
            'tesseract-data-eng: English OCR language data'
            'tesseract-data-pol: Polish OCR language data')
provides=("unisic=${pkgver}")
conflicts=('unisic-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fe8c1e788c096932c759df820e0dec24fac7efbb0c19557a76e83d52b462fd2')

build() {
    # Without an explicit build number CMake defaults UNISIC_BUILD to "dev",
    # which also flips UNISIC_DEV_BUILD to ON - a packaged build must be a
    # release build with a real number in the sidebar footer.
    export UNISIC_BUILD_NUMBER="${pkgver}-${pkgrel}"
    cmake -S "${srcdir}/${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUNISIC_DEV_BUILD=OFF
    cmake --build build
}

check() {
    # The ctest suite is pure logic (version compare, shortcut formatting,
    # annotation canvas, history filter, stream geometry) - no compositor and
    # no display needed, so offscreen is enough. Everything compositor-bound
    # is covered by the in-app smoke test instead.
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build --strip
    # The OBS repo signing key is installed for the deb/rpm postinst scripts
    # that register their native update repo. This package registers nothing,
    # so shipping the key would only be a confusing dead file.
    rm -f "${pkgdir}/usr/share/unisic/obs-signing-key.asc"
    # Tell the running app that its packaging channel owns updates. Without
    # this marker UpdateChecker reports "system", and its "Install now" button
    # would run install.sh, which pacman -U's the GitHub .pkg.tar.zst over
    # this package AND appends the OBS repo to pacman.conf - silently taking
    # the install away from the helper that built it.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/unisic/install-channel" <<< 'aur'
}
