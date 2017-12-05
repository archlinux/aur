# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# Contributor: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-git
pkgver=2017.7.1.r5791.g1463e036d7
pkgrel=1
pkgdesc='A remote execution and communication system built on zeromq'
url='https://github.com/saltstack/salt'
arch=('any')
license=('APACHE')
makedepends=('git' 'gcc')
depends=('python2'
         'python2-yaml'
         'python2-jinja'
         'python2-tornado'
         'python2-msgpack'
         'python2-crypto'
         'python2-m2crypto'
         'python2-psutil'
         'python2-pyzmq'
         'python2-requests'
         'python2-futures'
         'python2-markupsafe'
         'python2-apache-libcloud')
optdepends=('python2-pysodium: Required for RAET transport method'
            'python2-raet: Required for RAET transport method'
            'python2-ioflo: Required for RAET transport method'
            'python2-mako: Parser for salt states'
            'python2-pygit2: gitfs support'
            'virt-what: Improve results of the virtual grain'
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

  python2 setup.py --salt-transport=both install --root=${pkgdir}/ --optimize=1

  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-master.service ${pkgdir}/usr/lib/systemd/system/salt-master.service
  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-syndic.service ${pkgdir}/usr/lib/systemd/system/salt-syndic.service
  install -Dm644 ${srcdir}/${pkgname}/pkg/arch/salt-minion.service ${pkgdir}/usr/lib/systemd/system/salt-minion.service

  mkdir -p ${pkgdir}/etc/salt/
  cp ${srcdir}/${pkgname}/conf/master ${pkgdir}/etc/salt/
  cp ${srcdir}/${pkgname}/conf/minion ${pkgdir}/etc/salt/

  # remove git leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
