# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor (former maintainer): David Runge <dvzrv@archlinux.org>

pkgname=molecule-plugins
pkgver=26.11.0
pkgrel=0
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
sha512sums=('5bfd31c3714a2114bc0ff2f120d0f4f895d6ce54085d8de39d32f5ab34c41a0a27dc14bb453f755e093b6c83c82386182efca07b8abaf3451aab73efe6bbc5a0')
b2sums=('1a0e36c1f750aeb1ec5429723992e1ee7f2e59d2cc551096549dbdf940aff05e658bd1de73db7cfaba697cd062a3e8b64c02a45af9fab3b75fa586d0a65ec9f6')

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
