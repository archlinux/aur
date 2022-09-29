# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=python-spf-engine
#_pkgname="${pkgname#*-}"
pkgver=2.9.3
#_pkgver=2.9
pkgrel=2
pkgdesc="SPF (Sender Policy Framework) back-end for integration with Postfix and Sendmail"
arch=('any')
url="https://launchpad.net/${pkgname#*-}"
license=('Apache'
         'GPL2')
depends=('python-authres'
         'python-pymilter'
         'python-pyspf>=2.0.9')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('postfix: Postfix integration'
            'sendmail: Sendmail integration') 
provides=('spf-engine')
conflicts=('python-postfix-policyd-spf'
           'spf-engine')
backup=(etc/python-policyd-spf/policyd-spf.conf
        etc/pyspf-milter/pyspf-milter.conf)
source=("${url}/${pkgver%.*}/${pkgver}/+download/${pkgname#*-}-${pkgver}.tar.gz"{,.asc}
        pyspf-milter.sysusers
        pyspf-milter.conf
        pyspf-milter.service)
sha512sums=('adde80eca38f372ad00ed7355951007b9c02ef8a52a5a4edcbf2fa9959220f1083e3e313668e9c7ad2c26144148ae8ff62ec468d79936d96b43897598254f528'
            'SKIP'
            '8cc1cd34e106de3b71e1072b79d8e74a4d38a5a48e9fbf00e432c83fe3d81fa7b82908f087cc51e9c268af9066364cdb86daed66579bd93239f2ceeb7b24be74'
            'da291074a2ee69ebdf62b8411a1653da7e4898338ad448804fea587be7e1b96dbfc950a700e0be186eaee2377fb6a2df76ceba827b4377db7bed4de0202f559d'
            'dbb83aa1dc61cf4219f6d2072c34e00416783446c630a2b09db94333f1ed97936fa8a8ecda8e497cca2f7e429f8bba0ee4e67d66753ac72e7b1d49b893aa0342')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1') # Donald Scott Kitterman <scott@kitterman.com> 

build() {
  cd "${pkgname#*-}-${pkgver}"
  python -m build --wheel --no-isolation
  #python setup.py build
}

package() {
  cd "${pkgname#*-}-${pkgver}"
  #python setup.py install --root="${pkgdir}" --optimize=1 \
	#--single-version-externally-managed --skip-build
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Fix and remove incorrect files and directory structure
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
  rm "${pkgdir}/etc/init.d/pyspf-milter"
  rmdir "${pkgdir}/etc/init.d"
  rm "${pkgdir}/usr/lib/systemd/system/pyspf-milter.service"

  install -Dm0644 "${srcdir}/pyspf-milter.sysusers" "${pkgdir}/usr/lib/sysusers.d/pyspf-milter.conf"
  install -Dm0644 "${srcdir}/pyspf-milter.conf" "${pkgdir}/etc/pyspf-milter/pyspf-milter.conf"
  install -m0644 "${srcdir}/pyspf-milter.service" "${pkgdir}/usr/lib/systemd/system/"
  install -m0644 policyd-spf.conf.commented "${pkgdir}/etc/python-policyd-spf/"
}
