# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=2.4.0
pkgrel=1
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('APACHE')
depends=('git' 'python-requests')
makedepends=('python-pbr' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('java-runtime=11' 'libcups' 'openssh' 'procps-ng' 'python-stestr' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/opendev/git-review/archive/$pkgver.tar.gz"
        'https://gerrit-releases.storage.googleapis.com/gerrit-3.4.4.war')
sha512sums=('acbfde06a03776494f1506355d837111305c45cd9424aed4b852ebb5c496a83184eb7d515425b48317d9e0858021f8bd78b6c2184fc1d4655d00ca2ade244532'
            'bb7d54585d16a3a4c2660d1e4cdfe193164f4f18e24a2d5df147936023a237332b1c1e1e21198c2f4216935e37fd3dc1494a0c1aa41c6dcf6b966f19c9f976ce')

prepare() {
  export PBR_VERSION=$pkgver
  mkdir -p $pkgname/.gerrit
  cp gerrit-3.4.4.war $pkgname/.gerrit/

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
  python -m build --wheel --no-isolation
}

#check() {
#  cd $pkgname
#  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
#  export PATH="$PWD/tmp_install/usr/bin":$PATH
#  export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.11/site-packages":$PYTHONPATH
#
#  python -m git_review.tests.prepare
#  stestr run || warning "Tests failed"
#}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
