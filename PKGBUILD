# Maintainer: Louis Cornell <lpcornel@gmail.com>
pkgname=musiclib
pkgver=1.70
pkgrel=1
pkgdesc="KDE-based music library management. Integration with MPRIS2 players, Kid3 Tagger, K3b CD Ripper, kdeconnect and RSGain."
arch=('x86_64')
url="https://github.com/Harpo3/musiclib"
license=('GPL-3.0-or-later')
install=musiclib.install

depends=(
    # ── CLI runtime ───────────────────────────────────────────────────────────
    'qt6-base'              # QtCore runtime (both CLI and GUI link against it)
    'kid3-common'           # Provides the kid3-cli binary
    'perl-image-exiftool'   # Tag reading/writing via exiftool
    'qt6-tools'             # Provides qdbus6 for MPRIS2 player D-Bus queries
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
    'rsgain: ReplayGain loudness normalization (volume adjustment integration)'
    'conky: Desktop data elements display (audio data output for use by Conky or similar)'
    'kid3: Full KDE ID3 tag editor GUI (GUI tag editor integration)'
    'k3b: KDE CD Ripper and Burner Tool (CD ripping integration)'
)

# This package installs everything musiclib-cli provides, plus the GUI.
# pacman will remove musiclib-cli automatically if it is already installed.
provides=('musiclib-cli')
conflicts=('musiclib-cli')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Harpo3/musiclib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c98d8e08655ca50c98850e87c6eac63e3853c7bf89aa7730abd1541ad021ecb')

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

    # Fallback: install the man page directly if cmake skipped it
    if [[ ! -f "$pkgdir/usr/share/man/man1/musiclib-cli.1" ]]; then
        install -Dm644 "$pkgname-$pkgver/man/musiclib-cli.1" \
            "$pkgdir/usr/share/man/man1/musiclib-cli.1"
    fi
}
