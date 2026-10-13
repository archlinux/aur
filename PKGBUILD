# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor (former maintainer): David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=26.10.12
pkgrel=1
pkgdesc="Collection of molecule plugins"
arch=(any)
url="https://github.com/ansible-community/molecule-plugins"
license=(MIT)
depends=(
  molecule
  python
  python-boto3  # for ec2 driver
  python-cryptography  # for ec2 driver
  python-jinja  # for vagrant driver
  python-packaging  # required for podman driver
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
optdepends=(
  'ansible-core: for vagrant driver and validating docker and podman playbooks'
  'python-ansible-compat: for podman driver'
  'python-docker: for Docker support'
  'python-google-auth: for GCE playbooks'
  'python-google-api-python-client: for GCE playbooks'
  'python-pycryptodome: for GCE playbooks'
  'python-requests: for Docker support'
  'python-selinux: for SELinux and Docker support'
  'python-vagrant: for vagrant module'
)
conflicts=(
  molecule-containers
  molecule-docker
  molecule-podman
  molecule-vagrant
)
replaces=(
  molecule-containers
  molecule-docker
  molecule-podman
  molecule-vagrant
)
source=(
  $url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
)
sha512sums=('18167d78f8433de1ee9dbb134908f6fa973a79b61398cb8df5c9a772a3be806a53a0ba75d9e8ed9aa1fd3978bd514c5ca13a60fc661266ef0ae6e23c63b54201')
b2sums=('7166eb5fdc6654ef6fc53b3f3779aaf17f863afb72293e80dd1876c951f97dee95d3ab6999a73c2794dc6d073478d96cd83335e65d407d0971bb41938d3bd1fe')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 doc/ec2/*.rst  -t "$pkgdir/usr/share/doc/$pkgname/ec2"
  install -vDm 644 doc/vagrant/*.rst  -t "$pkgdir/usr/share/doc/$pkgname/vagrant"
}
