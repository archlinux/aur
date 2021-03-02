# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-git
pkgver=3002.4.r1541.gac4ecad325
pkgrel=1
pkgdesc='A remote execution and communication system built on zeromq'
url='https://github.com/saltstack/salt'
arch=('any')
license=('APACHE')
makedepends=('git' 'gcc' 'python-setuptools')
depends=('python'
         'python-distro'
         'python-yaml'
         'python-jinja'
         'python-msgpack'
         'python-pycryptodomex'
         'python-pyzmq'
         'python-requests')
optdepends=('virt-what: Improve results of the virtual grain'
            'dmidecode: decode SMBIOS/DMI tables')
backup=('etc/salt/master'
        'etc/salt/minion')
conflicts=('salt')
provides=('salt')
source=("${pkgname}::git+https://github.com/saltstack/salt.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname}

  python setup.py --salt-transport=both install --root=${pkgdir}/ --optimize=1

  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-master.service ${pkgdir}/usr/lib/systemd/system/salt-master.service
  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-syndic.service ${pkgdir}/usr/lib/systemd/system/salt-syndic.service
  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-minion.service ${pkgdir}/usr/lib/systemd/system/salt-minion.service

  mkdir -p ${pkgdir}/etc/salt/
  cp ${srcdir}/${pkgname}/conf/master ${pkgdir}/etc/salt/
  cp ${srcdir}/${pkgname}/conf/minion ${pkgdir}/etc/salt/

  # remove git leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
