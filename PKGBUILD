# Maintainer: Lucas Hoffmann
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Kazuo Teramoto <kaz.rag at gmail.com>
pkgname=afew
pkgver=1.3.0
pkgrel=3
pkgdesc="afew is an initial tagging script for notmuch mail"
arch=(any)
url="https://github.com/afewmail/afew"
license=('custom:BSD')
depends=('python' 'notmuch' 'python-chardet' 'python-setuptools' 'python-dkim')
makedepends=('python-sphinx')
conflicts=(afew-git)
source=('LICENSE' "https://github.com/afewmail/afew/archive/$pkgver.tar.gz")
sha1sums=(26af0a66e96e073a476f9f5006d45a349f81faf3
          d99268edee10f8e2587fcd6b88299c407ee868be)

prepare () {
  # We build from the versioned tarball from github so we do not need to
  # depend on the git tag to find the version number.  Also there seems to be
  # no clean way to override the safety checks that setuptools_scm do.
  # Solution: We remove the dependecy on setuptools_scm and fake the version
  # file.
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "/use_scm_version/d;/setuptools_scm/d;/name=/a version='$pkgver'," setup.py
  echo "version = '$pkgver'" > afew/version.py
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  make -C docs man
}
package() {
  cd "$srcdir/afew-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 docs/build/man/afew.1 "$pkgdir/usr/share/man/man1/afew.1"
  install -D -m644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
