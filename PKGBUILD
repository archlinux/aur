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
pkgver=0.7.5
pkgrel=1
# pkgrel of the upstream release asset - part of its file name, and it moves
# independently of this package's own pkgrel.
_pkgrel=1
pkgdesc='Capture, annotate, record and share your screen on Linux Wayland (binary release)'
arch=('x86_64')
url='https://github.com/unisic/unisic'
license=('GPL-3.0-or-later')
# libinput and hicolor-icon-theme are NOT in the released package's own
# dependency list (namcap on the AUR recipe is what caught them): the binary
# links libinput.so.10 for the keystroke/click overlays, and the icons land in
# the hicolor hierarchy. Both happen to be present on any real Wayland
# desktop, which is why nobody hit it - they still belong here.
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'pipewire' 'ffmpeg' 'wl-clipboard'
         'xdg-desktop-portal' 'tesseract' 'leptonica' 'layer-shell-qt' 'zxing-cpp' 'kguiaddons'
         'libinput' 'hicolor-icon-theme')
optdepends=('curl: FTP/SFTP upload destinations'
            'xdg-desktop-portal-kde: KDE portal backend for screenshots and screen recording'
            'xdg-desktop-portal-gtk: generic portal backend on non-KDE desktops'
            'tesseract-data-eng: English OCR language data'
            'tesseract-data-pol: Polish OCR language data')
provides=("unisic=${pkgver}")
conflicts=('unisic')
options=('!strip' '!debug')
source=("unisic-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst::${url}/releases/download/v${pkgver}/unisic-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('33cc6e123cfbb4de5ef7468338d977a9d40a102f6c3ce9dafec3b23854dc7029')
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
