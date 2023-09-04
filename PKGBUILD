# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=2.3.1
pkgrel=4
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('APACHE')
depends=('git' 'python-requests')
makedepends=('python-pbr' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('java-runtime=11' 'libcups' 'openssh' 'procps-ng' 'python-stestr' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/opendev/git-review/archive/$pkgver.tar.gz"
        'https://gerrit-releases.storage.googleapis.com/gerrit-2.13.14.war')
sha512sums=('f1c3cdb6dd309894963c9c039b3e0677b5e9fd23ef5ba3495426fdd3f08330fe1ffbc87b4549639adbb8134555052d4358251315f121569fda84956bf4dfc5be'
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
  python -m build --wheel --no-isolation
}

#check() {
#  cd $pkgname
#  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
#
#  python -m git_review.tests.prepare
#  stestr run || warning "Tests failed"
#}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
