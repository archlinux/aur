# Maintainer: Louis Cornell <lpcornel@gmail.com>
pkgname=musiclib-cli
pkgver=1.70
pkgrel=1
pkgdesc="Command line application for organizing and managing a music library. Requires Kid3 Audio Tagger and kdeconnect for mobile sync"
arch=('x86_64')
url="https://github.com/Harpo3/musiclib"
license=('GPL-3.0-or-later')

depends=(
    'qt6-base'              # QtCore runtime (musiclib-cli links against it)
    'kid3-common'           # Provides the kid3-cli binary
    'perl-image-exiftool'   # Tag reading/writing via exiftool
    'qt6-tools'             # Provides qdbus6 for MPRIS2 player D-Bus queries
    'kdeconnect'            # Mobile sync; provides kdeconnect-cli
    'bc'                    # Arithmetic used in shell scripts
)

makedepends=(
    'cmake'
)

optdepends=(
    'rsgain: ReplayGain loudness normalization (volume adjustment integration)'
    'conky: Desktop data elements display (audio data output for use by Conky or similar)'
)

# musiclib (the KDE GUI package) is a full superset of musiclib-cli.
# Installing the GUI package will replace this one cleanly via pacman.
conflicts=('musiclib')

# Source is the GitHub release tarball for tag v$pkgver (e.g., v1.0).
# After tagging on GitHub, compute the hash with: makepkg -g >> PKGBUILD
# and replace SKIP below with the printed sha256sum line.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Harpo3/musiclib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c98d8e08655ca50c98850e87c6eac63e3853c7bf89aa7730abd1541ad021ecb')

build() {
    # GitHub extracts the tarball as musiclib-<version>/, not musiclib-cli-<version>/
    cmake -B build -S "musiclib-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_WARNINGS_AS_ERRORS=OFF \
        -DBUILD_GUI=OFF \
        -DENABLE_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Fallback: install the man page directly if cmake skipped it
    # (cmake does this only when gzip is in PATH; the chroot may not have it)
    if [[ ! -f "$pkgdir/usr/share/man/man1/musiclib-cli.1" ]]; then
        install -Dm644 "musiclib-$pkgver/man/musiclib-cli.1" \
            "$pkgdir/usr/share/man/man1/musiclib-cli.1"
    fi
}
