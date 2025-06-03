# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=2.5.0
pkgrel=2
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('Apache-2.0')
depends=('git' 'python-requests')
makedepends=('python-pbr' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('java-runtime=11' 'libcups' 'openssh' 'procps-ng' 'python-stestr' 'python-mock')
source=("git+https://opendev.org/opendev/git-review.git#commit=a3be713b85919706dcf578736fd04e4ba21ca09d"  # 2.5.0 tag
        'https://gerrit-releases.storage.googleapis.com/gerrit-3.4.4.war')
b2sums=('SKIP'
        '4473e5eef14e8b741a998470a193340c62eb09f239a9ca5bf7372b15638fb2914bbc605b92722221f19ded088bbf2237eb25055217ff1b79e7a0334e9a1feb0b')

prepare() {
#  export PBR_VERSION=$pkgver
#  mkdir -p $pkgname/.gerrit
#  cp gerrit-3.4.4.war $pkgname/.gerrit/

#  cd $pkgname

  # Remove the su - part
#  sed -i '/f.write(GOLDEN_SITE_VER)/a \        utils.run_cmd("sed", "-i", "s/su - $GERRIT_USER -s//", self._dir("gsite", "bin", "gerrit.sh"))' git_review/tests/__init__.py

  # gerrit doesn't work without some additional config :/
#  sed -i '/listenUrl/a [gc]\n    interval = 2d\n    startTime = Fri 12:00\n[gitweb]\n    cgi = /usr/share/gitweb/gitweb.cgi' git_review/tests/utils.py

  # git version differences?
#  sed -e "s/'Branch test_branch set up to track remote'/\"Branch 'test_branch' set up to track remote\"/" \
#      -e "s/' branch maint from origin.'/\" branch 'maint' from 'origin'.\"/" \
#      -i git_review/tests/test_git_review.py

  # Clean up untracked files like stale wheels to avoid build failures
  git -C "${srcdir}/${pkgname}" clean -dfx
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
