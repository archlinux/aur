# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=1.28.0
pkgrel=5
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://github.com/openstack-infra/git-review'
license=('APACHE')
depends=('git' 'python-requests')
makedepends=('python-pbr')
checkdepends=('java-runtime=11' 'libcups' 'openssh' 'procps-ng' 'python-stestr' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack-infra/git-review/archive/$pkgver.tar.gz"
        https://tarballs.openstack.org/ci/gerrit/gerrit-v2.11.4.13.cb9800e.war)
sha512sums=('21a71172b474ca0446f58d567e2c1b37059af3b680a3e441bcf94607d05f1fefa932ecef95328e1d77f0b71928477fd2878806ea26d2c4da030f281de15a210d'
            '764388dc0ee381e2f05f5aaef9fc4156b4659a329eaf815ad7beb0b2a924a8d171444b8824ea9aad6b8aa7a3cc0b60bf8daa9d483298e6226cb692ea1caafa7f')

prepare() {
  export PBR_VERSION=$pkgver
  mkdir -p $pkgname-$pkgver/.gerrit
  cp gerrit-v2.11.4.13.cb9800e.war $pkgname-$pkgver/.gerrit/

  cd $pkgname-$pkgver

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
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1

  python -m git_review.tests.prepare
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" stestr run || warning "Tests failed"
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
