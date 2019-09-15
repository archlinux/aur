# Contributor: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Based on aur/whipper-git PKGBUILD

pkgname=whipper-cdparanoia-git
pkgver=0.7.3.r77.g635113b
pkgrel=1
pkgdesc="A Unix CD ripper aiming for accuracy over speed -- forked from morituri -- uses cdparanoia instead of libcdio-paranoia"
arch=('any')
url="https://github.com/JoeLametta/whipper"
license=('GPL3')
depends=(
    'accuraterip-checksum'          # for accuraterip-checksum calculation
    'cddb-py'                       # for showing but not using disc info if not in MusicBrainz (issue #28)
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'flac'                          # for reading flac files
    'cdparanoia'                    # for the actual ripping
    'libsndfile'                    # for reading wav files
    'mutagen'                       # for metadata handling
    'python2-musicbrainzngs'        # for metadata lookup
    'python2-pycdio'                # for storing drive identification in config file
    'python2-requests'              # for retrieving AccurateRip database entries
    'python2-setuptools'            # for plugin support
    'sox'                           # for track peak detection'
    )
makedepends=(
    'git'
    'python2-gobject2'
    )
checkdepends=(
    'python2-twisted'
    )
provides=('whipper' 'whipper-git')
conflicts=('whipper' 'whipper-git')
source=("git+${url}.git" "cdparanoia.diff")
sha256sums=(
    'SKIP'
    'a1403f86602a08f903fd85a9ce5fd1e8a11a98a91b8365bd5e75ffb6fa6136ab'
)

pkgver() {
    cd "$srcdir/whipper"
    # Cutting off "v" prefix present in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/whipper"
    git apply "$srcdir/cdparanoia.diff"
}

check() {
    cd "$srcdir/whipper"
    python2 -m unittest discover
}

package() {
    cd "$srcdir/whipper"
    python2 setup.py install --root="${pkgdir}"/ --optimize=1
}
