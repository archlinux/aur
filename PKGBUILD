# Maintainer: Konstantin Stepanov <me@kstep.me>

pkgname=ajenti-git
pkgver=1.2.21.32.g83672a0
pkgrel=1
pkgdesc='An easy server administration frontend.'
arch=(any)
url="http://github.com/Eugeny/ajenti/"
license=(LGPL)
depends=(python2-gevent-socketio python2-lxml python2-passlib python2-psutil python2-daemon
         python2-catcher python2-reconfigure python2-pyopenssl python2-pillow python2-exconsole)
makedepends=(git coffee-script lessc yuicompressor)
optdepends=(
    'python2-ldap: Active Directory and LDAP authorization support'
    'python2-dbus: Services Management using Upstart and/or SystemD'
)
install=ajenti.install
source=("$pkgname::git+https://github.com/Eugeny/ajenti.git#branch=master")
md5sums=(SKIP)
backup=(etc/ajenti/config.json)

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --always --tags | sed 's/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}

  msg2 'Replacing python shebang by python2 shebang...'
  find . -name ".*" -prune -o -type f -exec sed -i \
    -e '1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;
}

build() {
  cd ${srcdir}/${pkgname}

  python2 setup.py build
  python2 compile_resources.py
  python2 make_messages.py compile
  #make tgz

  #cd ${srcdir}/${pkgname}-${pkgver}/dist
  #tar xzf ${pkgname}-${pkgver}.tar.gz
}

package() {
  cd ${srcdir}/${pkgname}
  # cd ${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}-${pkgver}
  
  python2 setup.py install --root=${pkgdir} --optimize=1
 
  # Fix config file permissions
  chmod 0640 ${pkgdir}/etc/ajenti/config.json

  rm -r ${pkgdir}/etc/init.d

  install -D -m 644 ${srcdir}/${pkgname}/packaging/files/ajenti.service ${pkgdir}/usr/lib/systemd/system/ajenti.service
}
