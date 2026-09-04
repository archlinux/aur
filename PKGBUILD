# Maintainer: Unisic maintainers <https://github.com/unisic/unisic/issues>
#
# AUR binary package: repacks the .pkg.tar.zst that the release workflow
# already builds inside an archlinux:base-devel container, so this is the
# same binary the GitHub release ships - not a rebuild. Regenerate with
# packaging/aur/sync.sh rather than editing pkgver/sha256sums by hand.
#
# Two things are deliberately dropped from the upstream package:
#   .INSTALL  - it appends the OBS pacman repo to /etc/pacman.conf so direct
#               downloads keep updating. An AUR package must never enable a
#               third-party repository, and here the helper owns updates.
#   obs-signing-key.asc - the key for that repo; dead weight without it.
#
# Caveat that comes with every -bin package linking system Qt: the binary is
# built against whatever Qt 6 minor was current when the release was cut, and
# QML links Qt PRIVATE symbols. After a big Qt jump in [extra], build the
# `unisic` source package instead.

pkgname=unisic-bin
pkgver=0.8.5
pkgrel=1
# pkgrel of the upstream release asset - part of its file name, and it moves
# independently of this package's own pkgrel.
_pkgrel=1
pkgdesc='Capture, annotate, record and share your screen on Linux Wayland (binary release)'
arch=('x86_64')
url='https://github.com/unisic/unisic'
license=('GPL-3.0-or-later')
# This list is not derived from the repacked package: it is the same list the
# source recipe carries, and it has to be, because Unisic has no optional
# dependencies. Every compile-time gate is a hard build requirement, so the
# released binary links tesseract/leptonica (HAVE_TESSERACT), layer-shell-qt
# (HAVE_LAYERSHELL), zxing-cpp (HAVE_ZXING), kguiaddons (HAVE_KGUIADDONS),
# libinput (HAVE_LIBINPUT) and the libx* four (HAVE_X11 XShm recording,
# HAVE_X11_HOTKEYS XGrabKey - runtime dependencies on every install, not just
# X11 ones) with no way to switch any of them off.
# libinput and hicolor-icon-theme are NOT in the released package's own
# dependency list (namcap on the AUR recipe is what caught them): the binary
# links libinput.so.10 for the keystroke/click overlays, and the icons land in
# the hicolor hierarchy. Both happen to be present on any real Wayland
# desktop, which is why nobody hit it - they still belong here.
# The runtime helpers below leave no trace in the binary at all, which is
# exactly why a repack has to name them:
#   curl               the only transport for the ftp/ftps/sftp upload
#                      destinations (src/upload/UploadManager.cpp shells out)
#   zip                no zip library is linked; src/AppContext.cpp shells out
#                      to Info-ZIP for the ZIP export and diagnostics bundle
#   qt6-multimedia     the trim editor imports the QtMultimedia QML module at
#                      runtime; without it the video preview is gone
#   tesseract-data-*   OCR reports "language data not found" without eng/pol,
#                      and osd.traineddata is what the script auto-detection
#                      Settings enables BY DEFAULT needs
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
conflicts=('unisic')
options=('!strip' '!debug')
source=("unisic-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst::${url}/releases/download/v${pkgver}/unisic-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('9645aa7afd8e0f02a0df0083424b0e50e5ed70d2d6274783bd4a213a27363b7a')
# makepkg would auto-extract a pacman package into $srcdir alongside its
# metadata; unpack it explicitly instead so only usr/ can ever reach $pkgdir.
noextract=("unisic-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")

package() {
    bsdtar -xf "${srcdir}/unisic-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst" \
        -C "${pkgdir}" usr
    rm -f "${pkgdir}/usr/share/unisic/obs-signing-key.asc"
    # Tell the running app that its packaging channel owns updates. Without
    # this marker UpdateChecker reports "system", and its "Install now" button
    # would run install.sh, which pacman -U's the GitHub .pkg.tar.zst over
    # this package AND appends the OBS repo to pacman.conf - silently taking
    # the install away from the helper that built it.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/unisic/install-channel" <<< 'aur'
}
