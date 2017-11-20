# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=pisg
pkgver=0.73
pkgrel=3
pkgdesc="An IRC log parser (fixed)"
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('GPL')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=('perl')
install=
changelog=
noextract=()
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-launcher"
        "${pkgname}-${pkgver}.tar.gz.sig"
	"${pkgname}-launcher")
sha512sums=('290656fc556090fa8a263eaf123bad8e12b0ac50a2c1eb4619c50faf70fd3ee8afc7a8d97dbc4ff6338dd0fa9f73f7b19c60ca996b6612def95f1c494b3ef91e'
	    '1e934b00f376fb90b0fedfd2c58fcb77e039c439b193f16b66d9c82b43dcc720b98284f7628fdf38b82baf5b7f51a03d8ca1c58b20b72f903c26b86bb13cd0fd'
	    'SKIP'
            'SKIP')

package() {

  _vendordir=$(perl -V:vendorarch | sed -re "s/^(vendorarch='\/)(.*)(';)$/\2/g")
  _srcdir="${srcdir}/${pkgname}-${pkgver}"

  # Launcher
  install -Dm755 ${srcdir}/${pkgname}-launcher ${pkgdir}/usr/bin/${pkgname}

  # Conf
  install -Dm644 ${_srcdir}/${pkgname}.cfg ${pkgdir}/etc/${pkgname}.cfg

  # Scripts
  install -dm755 ${pkgdir}/usr/share/${pkgname}/scripts/addalias
  install -dm755 ${pkgdir}/usr/share/${pkgname}/scripts/pum
  install -Dm755 ${_srcdir}/scripts/addalias/addalias.pl ${pkgdir}/usr/share/${pkgname}/scripts/addalias/
  install -Dm644 ${_srcdir}/scripts/addalias/README ${pkgdir}/usr/share/${pkgname}/scripts/addalias/
  install -Dm755 ${_srcdir}/scripts/pum/pum.pl ${pkgdir}/usr/share/${pkgname}/scripts/pum/
  install -Dm644 ${_srcdir}/scripts/pum/pum.conf ${pkgdir}/usr/share/${pkgname}/scripts/pum/
  for e in pl awk tcl sed txt; do
    install -Dm644 ${_srcdir}/scripts/*.${e} ${pkgdir}/usr/share/${pkgname}/scripts/
  done
  install -Dm644 ${_srcdir}/scripts/crontab ${pkgdir}/usr/share/${pkgname}/

  # Docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/dev
  install -Dm644 ${_srcdir}/docs/dev/* ${pkgdir}/usr/share/doc/${pkgname}/dev/
  install -Dm644 ${_srcdir}/README ${pkgdir}/usr/share/doc/${pkgname}/
  find ${_srcdir}/docs -maxdepth 0 -type f -exec install -Dm644 '{}' ${pkgdir}/usr/share/doc/${pkgname}/ \;

  # Modules
  install -dm755 ${pkgdir}/${_vendordir}
  ## cheating a little here...
  ## one could do some path transformation with find and sed and use install instead.
  ## this is a little more readbale, though.
  cp -a ${_srcdir}/modules/* ${pkgdir}/${_vendordir}/
  find ${pkgdir}/${_vendordir}/ -type f -exec chmod 644 '{}' \;
  find ${pkgdir}/${_vendordir} -type d -exec chmod 755 '{}' \;

  # Graphics/Layout/etc.
  install -dm 755 ${pkgdir}/usr/share/${pkgname}/gfx
  install -dm 755 ${pkgdir}/usr/share/${pkgname}/layout
  install -Dm755 ${_srcdir}/${pkgname} ${pkgdir}/usr/share/${pkgname}/${pkgname}
  install -Dm644 ${_srcdir}/gfx/*.png ${pkgdir}/usr/share/${pkgname}/gfx/
  install -Dm644 ${_srcdir}/layout/*.css ${pkgdir}/usr/share/${pkgname}/layout/
  install -Dm644 ${_srcdir}/lang.txt ${pkgdir}/usr/share/${pkgname}/
  echo "<set PicLocation=\"/usr/share/${pkgname}/gfx/\">" >> ${pkgdir}/etc/${pkgname}.cfg
  echo "<set CssDir=\"/usr/share/${pkgname}/layout/\">" >> ${pkgdir}/etc/${pkgname}.cfg
  echo "<set LangFile=\"/usr/share/${pkgname}/lang.txt\">" >> ${pkgdir}/etc/${pkgname}.cfg
}
