# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=whipper-cdparanoia-git
pkgver=0.8.0.r4.gaf06718
pkgrel=1
pkgdesc="Unix CD ripper aiming for accuracy over speed -- forked from morituri"
arch=(x86_64)
url="https://github.com/whipper-team/whipper"
license=(GPL3)
depends=(
    libcdio-paranoia              # for the actual ripping
    cdrdao                        # for session, TOC, pregap, and ISRC extraction
    libsndfile                    # for reading wav files (pulls in flac, also required for reading flac files)
    python2-gobject
    python2-mutagen               # for metadata handling
    python2-musicbrainzngs        # for metadata lookup
    python2-pycdio                # for storing drive identification in config file
    python2-requests
    python2-setuptools            # for plugin support
    sox                           # for track peak detection'
    python2-ruamel.yaml           # for log output
    )
makedepends=(python2-setuptools-scm git)
optdepends=(flac)
checkdepends=(python2-twisted)
conflicts=(morituri accuraterip-checksum)
provides=(accuraterip-checksum)
source=(git+${url}.git 'cdparanoia.diff')
sha512sums=(
    SKIP
    '937d743b73f7f0f5921e5e4234da4ddc5b4a9e69937df6f45ab741cf36dd8f65ca8cd42fba5ab03bdce1f139978295f1fb01add95ba027d3a1df845c55317878'
)

pkgver() {
    cd "$srcdir/whipper"
    # Cutting off "v" prefix present in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/whipper"
    patch --forward --strip=1 --input="${srcdir}/cdparanoia.diff"
}

build() {
    cd whipper
    python2 setup.py build
}

package() {
    cd whipper
    python2 setup.py --version
    python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
