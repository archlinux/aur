# Maintainer: Louis Cornell <lpcornel@gmail.com>
pkgname=musiclib
pkgver=1.31
pkgrel=1
pkgdesc="KDE application for organizing and managing a music library. Requires Audacious player, Kid3 Audio Tagger, and kdeconnect for mobile sync"
arch=('x86_64')
url="https://github.com/Harpo3/musiclib"
license=('GPL-3.0-or-later')

depends=(
    # ── CLI runtime ───────────────────────────────────────────────────────────
    'qt6-base'              # QtCore runtime (both CLI and GUI link against it)
    'kid3-common'           # Provides the kid3-cli binary
    'perl-image-exiftool'   # Tag reading/writing via exiftool
    'audacious'             # Music player; provides audtool
    'kdeconnect'            # Mobile sync; provides kdeconnect-cli
    'bc'                    # Arithmetic used in shell scripts
    # ── GUI runtime ───────────────────────────────────────────────────────────
    'kcoreaddons'           # KApplication, KAboutData
    'kxmlgui'               # KMainWindow, KXMLGUI action framework
    'kwidgetsaddons'        # KMessageBox and other KDE widgets
    'ki18n'                 # KDE i18n/l10n support
    'kwindowsystem'         # Window management integration
    'kconfig'               # KConfig, KSharedConfig
    'kconfigwidgets'        # KConfigDialog, KUrlRequester
    'kio'                   # KUrlRequester KIO integration (Places, bookmarks)
)

makedepends=(
    'cmake'
    'extra-cmake-modules'   # Required for cmake to locate KF6 packages
    # KF6 dev headers are provided by the same packages listed in depends
)

optdepends=(
    'rsgain: ReplayGain loudness normalization (boost subcommand)'
    'conky: Desktop telemetry display (Conky integration)'
    'kid3: Full KDE ID3 tag editor GUI (optional companion app)'
)

# This package installs everything musiclib-cli provides, plus the GUI.
# pacman will remove musiclib-cli automatically if it is already installed.
provides=('musiclib-cli')
conflicts=('musiclib-cli')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Harpo3/musiclib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('726925e1028aadba5a73da8bff7ba747d1cb30ade482de27b25938fdb8de9df1')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_WARNINGS_AS_ERRORS=OFF \
        -DBUILD_GUI=ON \
        -DENABLE_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install the .desktop file (not wired into CMake install targets yet)
    install -Dm644 "$pkgname-$pkgver/org.musiclib.musiclib.desktop" \
        "$pkgdir/usr/share/applications/org.musiclib.musiclib.desktop"

    # Install the application icon
    install -Dm644 "$pkgname-$pkgver/musiclib.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/musiclib.png"

    # Fallback: install the man page directly if cmake skipped it
    if [[ ! -f "$pkgdir/usr/share/man/man1/musiclib-cli.1" ]]; then
        install -Dm644 "$pkgname-$pkgver/man/musiclib-cli.1" \
            "$pkgdir/usr/share/man/man1/musiclib-cli.1"
    fi
}
