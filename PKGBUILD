# Maintainer: Ian Vidricksen <ividricksen at gmail dot com>

pkgname=whipsaw
pkgver=0.1.1
pkgrel=1
pkgdesc='CD-DA ripper prioritizing accuracy over speed (fork of whipper)'
arch=('x86_64')
url='https://github.com/luftwafflezz/whipsaw'
license=('GPL-3.0-or-later')
depends=(
  'cdrdao'
  'ffmpeg'
  'libcdio-paranoia'  # provides the cd-paranoia binary
  'libsndfile'        # linked by the AccurateRip extension (also decodes FLAC)
  'python'
  'python-discid'
  'python-musicbrainzngs'
  'python-mutagen'
  'python-packaging'
  'python-pillow'     # cover art processing
  'python-pycdio'
  'python-requests'   # cover art / Discogs HTTP
  'python-ruamel-yaml'
  'sox'
  'util-linux'        # provides eject
)
makedepends=(
  'python-build'
  'python-docutils'   # rst2man, for the man pages
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('flac' 'python-twisted')  # tests run the flac binary directly
optdepends=('python-coloredlogs: colored log output when WHIPSAW_COLOR_LOG is set')
conflicts=('whipper')  # a fork meant to replace whipper, not run alongside it
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f30d743965b9f1154ae0a37bf24fc35d84b2f618846ec657e455a5e573b8517b')

build() {
  cd "$pkgname-$pkgver"
  # The release tarball has no git metadata for setuptools-scm to read.
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
  make -C man
}

check() {
  cd "$pkgname-$pkgver"
  rm -rf test_dir
  python -m installer --destdir=test_dir dist/*.whl
  local site_dir="$PWD/test_dir$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')"
  # Several tests create (and read) the user's whipsaw config directory,
  # so keep that out of the builder's real $HOME.
  export XDG_CONFIG_HOME="$srcdir/xdg-config" XDG_DATA_HOME="$srcdir/xdg-data"
  # Run from outside the source tree so the checkout's whipsaw/ (which has
  # no built extension) can't shadow the freshly installed copy.
  cd "$srcdir"
  PYTHONPATH="$site_dir" python -m unittest discover -s "$site_dir/whipsaw/test" -t "$site_dir"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Skip accuraterip-checksum.1: it documents a standalone CLI this fork
  # doesn't build.
  install -Dm644 man/whipsaw*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 com.github.luftwafflezz.Whipsaw.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
