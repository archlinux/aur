# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
_pkgname=isrcsubmit
pkgname=$_pkgname-git
pkgver=2.1.0.r24.g8f4c3b9
pkgver(){
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python' 'python-musicbrainzngs>=0.4' 'python-discid>=1.0.0')
makedepends=('git' python-build python-installer python-wheel
             'python-setuptools' 'python-sphinx')
optdepends=(
  "python-keyring: Keyring integration."
)
provides=('isrcsubmit')
conflicts=('isrcsubmit')
replaces=('isrcsubmit-python2-git' 'isrcsubmit-python-git')
options=(!emptydirs)
source=("$pkgname::git+https://github.com/JonnyJD/musicbrainz-isrcsubmit.git")
md5sums=('SKIP')

prepare() {
  # Clean potential old build etc. artifacts
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" AUTHORS CHANGES.* COPYING README.*
}

# vim:set ts=2 sw=2 et:
