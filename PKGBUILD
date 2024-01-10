# Maintainer: André Kugland <kugland at gmail dot com>
# Maintainer: Vej Kse <vej.kse at gmail dot com>

#  This package is provided as a workaround because ffsubsync
#  doesn't work correctly with the most recent version of its
#  libraries. In this package, it is installed, together with
#  its dependencies as a Python virtual environment inside the
#  directory /usr/share/ffsubsync-venv.

_pkgname=ffsubsync-venv
pkgname=python-$_pkgname
pkgver=0.4.25
pkgrel=2
pkgdesc="Language-agnostic automatic synchronization of subtitles with video. (Installed inside a Python virtual environment)"
arch=(any)
url="https://github.com/smacke/ffsubsync"
license=('MIT')
source=('ffs.sh')
sha256sums=('6c8226cc63e639ed29673d1436792caca0b0cbfd63d4e8baa3ab9350d4e3dfb8')
depends=('ffmpeg')
conflicts=('python-ffsubsync')
install=ffsubsync-venv.install

package() {
  mkdir -p "$pkgdir"/usr/{bin,share/ffsubsync-venv}
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffs
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/ffsubsync
  install -m 755 -o 0 -g 0 ffs.sh "$pkgdir"/usr/bin/subsync

  venv="$pkgdir/usr/share/ffsubsync-venv"
  python -m venv --copies "$venv"
  . "$venv/bin/activate"
  pip install wheel
  pip install "ffsubsync==$pkgver"
  # Remove $pkgdir path from the package (it is important to exclude binary
  # files otherwise .pyc files will be corrupted and ffs will crash)
  find "$venv" -type f \
    -exec grep --quiet --binary-files=without-match "$pkgdir" {} \; \
    -exec sed --in-place "s,$pkgdir,,g" {} \;
}
