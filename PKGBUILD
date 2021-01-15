# Contributor: alphazo <alphazo@gmail.com>
# Maintainer: Abbas Maheryar <abbasmaheryar@gmail.com>
# This version fetches and install master branch from Git repo (now using the same repo as [Community] version).

pkgname=sshuttle-git
_gitname=sshuttle
pkgver=v1.0.5+5_g97c25e9
#_commit=e433c599e40bc47c7b0e4d16934815c84b26eea8
pkgrel=1
pkgdesc='Transparent proxy server that forwards all TCP packets over ssh'
arch=('any')
url="https://github.com/sshuttle/sshuttle"
license=('GPL2')
depends=('python-setuptools' 'iptables' 'openssh' 'net-tools')
makedepends=('git' 'python-sphinx' 'python-setuptools_scm')
checkdepends=('python-pytest-runner' 'python-mock')
conflicts=('sshuttle')
backup=('etc/sshuttle/tunnel.conf' 'etc/sshuttle/prefixes.conf')
source=("git+https://github.com/sshuttle/sshuttle.git"
        'sshuttle.service' 'prefixes.conf' 'tunnel.conf')
md5sums=('SKIP'
         'f2cd1660dcdb4e24b45b71e589da73f3'
         'e780f69851445f739ea76774bb3a3b17'
         '4137f5e6d5dd92b7f7f34a1bfdbda45c')

pkgver() {
        cd "$_gitname"
        git describe | sed 's|sshuttle-||;s|-|+|;s|-|_|'
}

build() {
  cd "$_gitname"
  python setup.py build

  cd docs
  make man
}

check() {
  cd "$_gitname"
  python setup.py ptr
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" -O1

  #install -Dm644 sshuttle.8 "$pkgdir/usr/share/man/man8/sshuttle.8"
  install -Dm644 docs/_build/man/sshuttle.1 "$pkgdir/usr/share/man/man1/sshuttle.1"

  install -d "$pkgdir/etc/sshuttle"
  install -m644 "$srcdir"/{tunnel.conf,prefixes.conf} "$pkgdir/etc/sshuttle"
  install -Dm644 "$srcdir/sshuttle.service" "$pkgdir/usr/lib/systemd/system/sshuttle.service"
}
