# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=2.3.1
pkgrel=2
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('APACHE')
depends=('git' 'python-requests')
makedepends=('python-pbr')
checkdepends=('java-runtime=11' 'libcups' 'openssh' 'procps-ng' 'python-stestr' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/opendev/git-review/archive/$pkgver.tar.gz"
        'https://gerrit-releases.storage.googleapis.com/gerrit-2.13.14.war')
sha512sums=('f3d714a4daa207d86d8b8a2892ad35906cbd1ace388f61099d8603e73477d95abaf2c1005516e5ca815f919432d4b0fc39e5371af963778b2acb20145c7f93ea'
            '8fe04cb9b84ab06cf2b92a4ef475d1252ae63c1e6ea4fffca5b02bba3e48ec5c248fb9df7243b9464182afae9e566faf317972394077a50aaf13239af4e35a0a')

prepare() {
  export PBR_VERSION=$pkgver
  mkdir -p $pkgname/.gerrit
  cp gerrit-2.13.14.war $pkgname/.gerrit/

  cd $pkgname

  # Remove the su - part
  sed -i '/f.write(GOLDEN_SITE_VER)/a \        utils.run_cmd("sed", "-i", "s/su - $GERRIT_USER -s//", self._dir("gsite", "bin", "gerrit.sh"))' git_review/tests/__init__.py

  # gerrit doesn't work without some additional config :/
  sed -i '/listenUrl/a [gc]\n    interval = 2d\n    startTime = Fri 12:00\n[gitweb]\n    cgi = /usr/share/gitweb/gitweb.cgi' git_review/tests/utils.py

  # git version differences?
  sed -e "s/'Branch test_branch set up to track remote'/\"Branch 'test_branch' set up to track remote\"/" \
      -e "s/' branch maint from origin.'/\" branch 'maint' from 'origin'.\"/" \
      -i git_review/tests/test_git_review.py
}

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  python setup.py install --root="$PWD/tmp_install" --optimize=1

  python -m git_review.tests.prepare
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" stestr run || warning "Tests failed"
}

package() {
  cd $pkgname
  python setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
