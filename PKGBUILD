# Maintainer: Unisic maintainers <https://github.com/unisic/unisic/issues>
#
# AUR source package. Deliberately NOT a copy of packaging/arch/PKGBUILD:
# that one feeds OBS and the GitHub release asset, and its unisic.install
# scriptlet appends the OBS pacman repo to /etc/pacman.conf. An AUR package
# must never enable a third-party repository, and here it would also be
# wrong: the user's AUR helper owns the update path. Regenerate both AUR
# recipes with packaging/aur/sync.sh rather than editing pkgver by hand.

pkgname=unisic
pkgver=0.8.5
pkgrel=1
pkgdesc='Capture, annotate, record and share your screen on Linux Wayland'
arch=('x86_64')
url='https://github.com/unisic/unisic'
license=('GPL-3.0-or-later')
# Unisic has no optional dependencies. Every compile-time gate is a hard build
# requirement - CMake stops at configure time naming the package to install -
# so every library those gates detect is a hard runtime one too:
# tesseract/leptonica (HAVE_TESSERACT), layer-shell-qt (HAVE_LAYERSHELL),
# zxing-cpp (HAVE_ZXING), kguiaddons (HAVE_KGUIADDONS), libinput
# (HAVE_LIBINPUT). The libx* four are the X11 capture and hotkey paths added
# in 0.8 (XShm screen recording and the XGrabKey global shortcuts an X11
# session needs, neither of which has a Wayland route), so they are runtime
# dependencies on every install, not just X11 ones - the binary links them
# unconditionally. hicolor-icon-theme owns the hierarchy the icons land in.
# The rest are the runtime helpers no linker can vouch for, which is precisely
# why they must be named rather than hoped for:
#   curl               the only transport for the ftp/ftps/sftp upload
#                      destinations (src/upload/UploadManager.cpp shells out)
#   zip                no zip library is linked; src/AppContext.cpp shells out
#                      to Info-ZIP for the ZIP export and diagnostics bundle
#   qt6-multimedia     the trim editor imports the QtMultimedia QML module at
#                      runtime; without it the video preview is gone
#   tesseract-data-*   OCR is compiled into every build and reports "language
#                      data not found" without eng/pol; osd.traineddata is what
#                      the script auto-detection Settings enables BY DEFAULT
#                      needs
# qt6-multimedia-ffmpeg is named alongside qt6-multimedia deliberately: that
# package depends on the VIRTUAL qt6-multimedia-backend, which ffmpeg and
# gstreamer both provide, and an unresolved virtual is what makes an AUR helper
# under --noconfirm pick a provider for the user - the very thing that kept
# xdg-desktop-portal-impl out of this list and in optdepends. ffmpeg is already
# a hard dependency here and is Qt's own default backend, so choosing that one
# costs nothing and leaves nothing to choose. `pipewire` owns pw-dump;
# `pipewire-audio` owns pw-record and pw-play, and all three commands are runtime paths.
# namcap will call curl and tesseract-data-osd "already satisfied by a
# dependency" (pacman needs curl, tesseract needs both). That warning is the
# price of stating a requirement instead of inheriting it by luck of somebody
# else's dependency graph.
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'qt6-multimedia'
         'qt6-multimedia-ffmpeg' 'pipewire' 'pipewire-audio' 'ffmpeg' 'grim' 'wl-clipboard' 'curl' 'zip'
         'xdg-desktop-portal' 'tesseract' 'leptonica' 'tesseract-data-eng' 'tesseract-data-pol'
         'tesseract-data-osd' 'layer-shell-qt' 'zxing-cpp' 'kguiaddons' 'libinput'
         'hicolor-icon-theme' 'libx11' 'libxext' 'libxfixes' 'libxcb')
# Only the build-time-exclusive tools: everything else this links against is
# already a runtime dependency above, and Arch's guidelines want each package
# listed once. `wayland` is here for wayland-scanner, and
# plasma-wayland-protocols carries zkde-screencast-unstable-v1.xml, which
# HAVE_KWIN_SCREENCAST (KWin-native recording, no portal share dialog) is
# generated from - without it this recipe fails to configure, which is the
# point: it used to build a package silently missing the fast KDE path.
# systemd-libs and libpipewire are the two .pc files nothing in depends
# provides under its own name: libudev.pc (the second half of HAVE_LIBINPUT,
# which checks libinput AND libudev) and libpipewire-0.3.pc (HAVE_PIPEWIRE -
# the headers live in the `libpipewire` split package, not in `pipewire`).
# Both reach the runtime through a declared dependency anyway (qt6-base
# depends on systemd-libs, pipewire on libpipewire=<exact version>), so naming
# them here states the gate without duplicating a runtime entry.
makedepends=('cmake' 'ninja' 'pkgconf' 'qt6-tools' 'wayland' 'plasma-wayland-protocols'
             'systemd-libs' 'libpipewire')
# The only optdepends that survive the no-optional-dependencies rule, because
# a portal backend is neither a feature gate nor a library this binary links:
# it is a session component with several mutually exclusive providers. The
# virtual 'xdg-desktop-portal-impl' would state it as a hard depend, but a
# virtual with more than one provider makes makepkg prompt for a choice, and
# an AUR helper running --noconfirm would silently pick the first one for the
# user. Naming both backends and letting the user choose is the honest form.
optdepends=('xdg-desktop-portal-kde: KDE portal backend for screenshots and screen recording'
            'xdg-desktop-portal-gtk: generic portal backend on non-KDE desktops')
provides=("unisic=${pkgver}")
conflicts=('unisic-bin')
# The release asset, NOT ${url}/archive/refs/tags/v${pkgver}.tar.gz. From 0.8
# the tree carries the external/unisic-kit submodule and CMakeLists.txt does
# add_subdirectory() on it, but GitHub's tag archives never contain submodule
# content, so that tarball fails at configure time. The release workflow builds
# a complete one (superproject + kit concatenated) and attaches it under this
# name; unisic-bin already sources a release asset the same way.
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2855af35a58d6927b4b3babf9b5faa599caa47af8c494ee34db1917c9c2190f7')

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
