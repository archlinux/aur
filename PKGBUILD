# Maintainer: Daan van Rossum <d.r.vanrossum_at gmx.de>
# Contributor: Christopher Heien <chris.h.heien@gmail.com>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=basex
pkgver=8.2.2
pkgrel=1
pkgdesc="Light-weight, high-performance XML database system and XPath/XQuery processor."
arch=('i686' 'x86_64')
url="http://basex.org/"
license=('BSD')
depends=('java-environment-common' 'bash')
source=("http://files.basex.org/releases/${pkgver}/BaseX${pkgver//./}.zip" 
        "basex.sh" 
        "BaseX.desktop")
sha1sums=('1d17384dddd6f9788bfdce90904adfbf1b1327f6'
          'b82c43d2f247d65b93b2f073543b8ceee038bfd1'
          '53eb192fe09410da5dff22ba7ecd5b26e5753fd7')

package() {
  # install profile.d script
  install -dm755 ${pkgdir}/etc/profile.d || return 1
  install -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d || return 1

  # Get the BASEX_HOME env var
  source ${srcdir}/${pkgname}.sh || return 1

  cd ${srcdir}
  install -dm755 ${pkgdir}/${BASEX_HOME}/{bin,lib,img} || return 1

  # install gui shortcuts
  install -dm755 ${pkgdir}/usr/share/applications || return 1 
  install -m755 BaseX.desktop ${pkgdir}/usr/share/applications || return 1

  # install licence
  install -D -m644 basex/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # extract and install logo
  jar -xf basex/BaseX.jar img/logo_256.png
  install -m644 img/logo_256.png ${pkgdir}/${BASEX_HOME}/img || return 1	 

  install -m644 basex/*.jar ${pkgdir}/${BASEX_HOME} || return 1
  install -m644 basex/lib/*.jar ${pkgdir}/${BASEX_HOME}/lib || return 1
  cp -Rp basex/etc ${pkgdir}/${BASEX_HOME} || return 1

  # Do not copy Windows .bat/.cmd files
  find basex/bin -type f -a ! -name \*.bat -a ! -name \*.cmd \
    -exec install -m755 {} ${pkgdir}/${BASEX_HOME}/bin \; || return 1
}
