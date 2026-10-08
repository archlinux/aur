# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor (former maintainer): David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=26.9.28
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
sha512sums=('3569f41f7ba81bfaa92f28edb22687e8d146c315a10030582d8596d70c302b4bffe2a52433347890f65ecb9cfd0fa00e8d41153a4df70ad58cf6d0fd0688af92')
b2sums=('4a9511aa2d2fc60b0bec247a9f2137ec503e34ce48d2e08722fa23bfa3421609f03aa9f315494a6c89c15040fa382692a399819c340815809cb3f6b22aba108b')

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
