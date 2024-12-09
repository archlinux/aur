# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname='labgrid-git'
_pkgname="${pkgname/-git/}"
pkgver=v24.0.r140.gd98677c
pkgrel=2
pkgdesc='embedded board control python library with a focus on testing, development and general automation'
arch=('any')
url="https://github.com/labgrid-project/labgrid"
license=('LGPL-2.1')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
depends=(
  'python'
  'python-ansicolors'
  'python-attrs'
  'python-grpcio'
#  'python-grpcio-reflection'
  'python-protobuf'
  'python-jinja'
  'python-pexpect'
  'python-pyserial'
  'python-pytest'
  'python-pyudev'
  'python-pyusb'
  'python-yaml'
  'python-requests'
  'python-xmodem'
)
optdepends=(
  'openssh: recommended ssh client'
  'microcom: serial console support'
  'socat: network forwarding support'
  'sshfs: sshfs subcommand'
  'rsync: rsync subcomand'
  'bash-completion: bash completion'
  'gst-plugins-good: video support'
  'python-paho-mqtt: mqtt'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation

  # prepare man pages
  make -C man compressed
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.rst

  for sec in 1 5 7; do
    install -vDm0644 -t "$pkgdir/usr/share/man/man${sec}/" man/*.${sec}.gz
  done


  install -vDm0644 -t "$pkgdir/usr/lib/systemd/system/" contrib/systemd/{labgrid-coordinator.service,labgrid-exporter.service}
  # before we'd install the tmpfiles config, we'd want to make sure the labgrid user gets created
  # install -vDm0644 -t "$pkgdir/usr/lib/tmpfiles.d/" contrib/systemd/tmpfiles.d/labgrid.conf
  install -vDm0644 -T contrib/completion/labgrid-client.bash "$pkgdir/usr/share/bash-completion/completions/labgrid-client"
}

