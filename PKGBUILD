# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=python-spf-engine
pkgver=3.0.0
pkgrel=1
pkgdesc="SPF (Sender Policy Framework) back-end for Postfix and Sendmail"
arch=('any')
url="https://launchpad.net/${pkgname#*-}"
license=('Apache'
         'GPL2')
depends=('python-authres'
         'python-pymilter>=1.0.5'
         'python-pyspf>=2.0.9')
makedepends=('python-build'
             'python-flit'
             'python-installer'
             'python-wheel')
optdepends=('postfix: Postfix integration'
            'sendmail: Sendmail integration') 
provides=('spf-engine')
conflicts=('python-postfix-policyd-spf'
           'spf-engine')
backup=(etc/python-policyd-spf/policyd-spf.conf
        etc/pyspf-milter/pyspf-milter.conf)
source=("${url}/${pkgver%.*}/${pkgver}/+download/${pkgname#*-}-${pkgver}.tar.gz"{,.asc}
        pyspf-milter.sysusers)
sha512sums=('c380270244ec05758a171f01fd8f78f1464f249eefda1eecd083fc072e456f28fe6548819fd9391506088f035b9f4868d4b65d1c6e5eb685925ef0bf4074c4d8'
            'SKIP'
            '8cc1cd34e106de3b71e1072b79d8e74a4d38a5a48e9fbf00e432c83fe3d81fa7b82908f087cc51e9c268af9066364cdb86daed66579bd93239f2ceeb7b24be74')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1') # Donald Scott Kitterman <scott@kitterman.com> 

build() {
  cd "${pkgname#*-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname#*-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Fix directory structure
  mv "${pkgdir}/usr/local/lib/systemd" "${pkgdir}/usr/lib/"
  mv "${pkgdir}/usr/local/etc" "${pkgdir}/"
  rm -rf "${pkgdir}/usr/local"
  rm -rf "${pkgdir}/etc/init.d"

  # Fix systemd unit file
  sed -i \
	-e 's|\/usr\/local\/bin|\/usr\/bin|' \
	-e 's|\/usr\/local\/etc|\/etc|' \
	"${pkgdir}/usr/lib/systemd/system/pyspf-milter.service"

  # Fix conf file
  sed -i \
	-e 's|\#Socket|Socket|' \
    -e '/inet/d' \
	"${pkgdir}/etc/pyspf-milter/pyspf-milter.conf"

  install -vDm0644 "${srcdir}/pyspf-milter.sysusers" \
	"${pkgdir}/usr/lib/sysusers.d/pyspf-milter.conf"
}
