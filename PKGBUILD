# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Ankz <ankz . kothari at gmail.com>
# Contributor: Figue <ffigue at gmail.com>

pkgname=gateone-git
_gitname="GateOne"
pkgver=1.1_r485.ga34f7e0
pkgrel=1
pkgdesc="Web-based terminal emulator and SSH client"
arch=('any')
url="https://github.com/liftoff/GateOne"
license=('AGPL3')
depends=('python2' 'python2-tornado' 'python2-futures' 'python2-setuptools' 'python2-html5lib')
optdepends=('python2-imaging: A python module for manipulating images'
            'python2-pillow: An alternative to python2-imaging'
            'python2-pam: Only necessary if you plan to use the PAM authentication module'
            'python2-kerberos: Only necessary if you plan to use the Kerberos authentication module'
            'python2-pyopenssl: Used to generate self-signed SSL keys and certificates'
            'dtach: Allows sessions to be resumed even if Gate One is restarted'
            'python2-mutagen: Display audio metadata when reading audio files')
# systemd needs to be in makedepends for building in clean chroot
makedepends=('git' 'systemd')
# we need emptydirs for the etc and var-lib folders
options=(emptydirs)
install=${pkgname}.install
source=(git+"https://github.com/liftoff/GateOne.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed -e 's:v::' -e 's:-:_r:' -e 's:-:.:g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/"

  # strip pkgdir reference from service file
  sed -i "s:$pkgdir::" "$pkgdir/usr/lib/systemd/system/gateone.service"

  # create empty conf dir
  install -dm755 "$pkgdir/etc/gateone/conf.d"

  # create empty run dir
  install -dm755 "$pkgdir/var/lib/gateone"
}

# vim:set ts=2 sw=2 et:
