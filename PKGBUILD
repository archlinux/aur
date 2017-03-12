# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Valentin Hăloiu <vially.ichb+aur [at] gmail.com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Submitter: vbPadre <vbpadre [at] gmail.com>

pkgname=ajenti
pkgver=1.2.23.9
pkgrel=1
pkgdesc='An easy server administration frontend.'
arch=(any)
url='http://ajenti.org/'
license=(LGPL)
depends=(python2-gevent-socketio python2-lxml python2-passlib python2-psutil python2-daemon
         python2-catcher python2-reconfigure python2-pillow python2-exconsole)
makedepends=(python2-setuptools)
#makedepends=(coffee-script lessc yuicompressor)
optdepends=('python2-dbus: services plugin dependency' 'python2-ldap: LDAP and Active Directory user synchronization support')
install=ajenti.install
source=('https://pypi.python.org/packages/4a/59/1c1d248046807010b6714fa156f57eee51e2e8851c3f7d28021487fcee5b/ajenti-1.2.23.9.tar.gz#md5=c1772c5c1ee7c81487589360038e9062'
        ajenti.service
        gevent_coros.patch)
md5sums=(c1772c5c1ee7c81487589360038e9062
         74e13666013eea439b08e6fcbeef3a6d
         3fc85795cbe2bce9b0f6b5480294abe6)
backup=(etc/ajenti/config.json)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p2 < "${srcdir}/gevent_coros.patch"

  msg2 'Replacing python shebang by python2 shebang...'
  find . -type f -exec sed -i \
    -e '1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py build
  #make clean
  #make tgz

  #cd ${srcdir}/${pkgname}-${pkgver}/dist
  #tar xzf ${pkgname}-${pkgver}.tar.gz
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # cd ${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}-${pkgver}
  
  python2 setup.py install --root=${pkgdir} --optimize=1
 
  # Fix config file permissions
  chmod 0640 "${pkgdir}/etc/ajenti/config.json"

  rm -r "${pkgdir}/etc/init.d"

  install -D -m 644 "${srcdir}/ajenti.service" "${pkgdir}/usr/lib/systemd/system/ajenti.service"
}
