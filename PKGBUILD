# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Based on community/morituri and aur/morituri-git PKGBUILDs

pkgname=whipper-git
pkgver=0.9.1.dev105+ge598727
pkgrel=1
pkgdesc='A Unix CD ripper aiming for accuracy over speed -- forked from morituri'
arch=('any')
url='https://github.com/whipper-team/whipper'
license=('GPL3')
depends=(
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'flac'                          # for reading flac files
    'libcdio-paranoia'              # for the actual ripping
    'libsndfile'                    # for reading wav files
    'python-discid'                 # for calculating Musicbrainz disc id
    'python-mutagen'                # for metadata handling
    'python-musicbrainzngs'         # for metadata lookup
    'python-gobject'
    'python-pycdio'                 # for storing drive identification in config file
    'python-ruamel-yaml'            # for generating and reading logs
    'python-setuptools'             # for plugin support
    'sox'                           # for track peak detection'
    )
makedepends=(
    'git'
    'python-setuptools-scm'        # for VCS(/SCM) versioning
    )
checkdepends=(
    'python-twisted'
    )
provides=("${pkgname%-git}" 'accuraterip-checksum')
conflicts=("${pkgname%-git}" 'accuraterip-checksum')
source=("git+${url}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    python3 setup.py --version
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python3 setup.py build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    python3 -m venv --system-site-packages --clear test-venv
    source ./test-venv/bin/activate
    python3 setup.py install --skip-build
    python3 -m unittest discover
    deactivate
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python3 setup.py install --skip-build --root="${pkgdir}"/ --optimize=1
}
