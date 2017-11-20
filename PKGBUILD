# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=pisg-fixed
_pkgname=pisg
pkgver=0.73
pkgrel=1
pkgdesc="An IRC log parser (fixed)"
arch=('any')
url="http://${_pkgname}.sourceforge.net/"
license=('GPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('perl')
install=
changelog=
noextract=()
source=("http://prdownloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-launcher"
        "${_pkgname}-${pkgver}.tar.gz.sig"
	"${_pkgname}-launcher")
sha512sums=('290656fc556090fa8a263eaf123bad8e12b0ac50a2c1eb4619c50faf70fd3ee8afc7a8d97dbc4ff6338dd0fa9f73f7b19c60ca996b6612def95f1c494b3ef91e'
	    '1e934b00f376fb90b0fedfd2c58fcb77e039c439b193f16b66d9c82b43dcc720b98284f7628fdf38b82baf5b7f51a03d8ca1c58b20b72f903c26b86bb13cd0fd'
	    'SKIP'
            'SKIP')

package() {

  _vendordir=$(perl -V:vendorarch | sed -re "s/^(vendorarch='\/)(.*)(';)$/\2/g")
  _srcdir="${srcdir}/${_pkgname}-${pkgver}"

  # Launcher
  install -Dm755 ${srcdir}/${_pkgname}-launcher ${pkgdir}/usr/bin/${_pkgname}

  # Conf
  install -Dm644 ${_srcdir}/${_pkgname}.cfg ${pkgdir}/etc/${_pkgname}.cfg

  # Scripts
  install -dm755 ${pkgdir}/usr/share/${_pkgname}/scripts/addalias
  install -dm755 ${pkgdir}/usr/share/${_pkgname}/scripts/pum
  install -Dm755 ${_srcdir}/scripts/addalias/addalias.pl ${pkgdir}/usr/share/${_pkgname}/scripts/addalias/
  install -Dm644 ${_srcdir}/scripts/addalias/README ${pkgdir}/usr/share/${_pkgname}/scripts/addalias/
  install -Dm755 ${_srcdir}/scripts/pum/pum.pl ${pkgdir}/usr/share/${_pkgname}/scripts/pum/
  install -Dm644 ${_srcdir}/scripts/pum/pum.conf ${pkgdir}/usr/share/${_pkgname}/scripts/pum/
  for e in pl awk tcl sed txt; do
    install -Dm644 ${_srcdir}/scripts/*.${e} ${pkgdir}/usr/share/${_pkgname}/scripts/
  done
  install -Dm644 ${_srcdir}/scripts/crontab ${pkgdir}/usr/share/${_pkgname}/

  # Docs
  install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}/dev
  install -Dm644 ${_srcdir}/docs/dev/* ${pkgdir}/usr/share/doc/${_pkgname}/dev/
  install -Dm644 ${_srcdir}/README ${pkgdir}/usr/share/doc/${_pkgname}/
  find ${_srcdir}/docs -maxdepth 0 -type f -exec install -Dm644 '{}' ${pkgdir}/usr/share/doc/${_pkgname}/ \;

  # Modules
  install -dm755 ${pkgdir}/${_vendordir}
  ## cheating a little here...
  ## one could do some path transformation with find and sed and use install instead.
  ## this is a little more readbale, though.
  cp -a ${_srcdir}/modules/* ${pkgdir}/${_vendordir}/
  find ${pkgdir}/${_vendordir}/ -type f -exec chmod 644 '{}' \;
  find ${pkgdir}/${_vendordir} -type d -exec chmod 755 '{}' \;

  # Graphics/Layout/etc.
  install -dm 755 ${pkgdir}/usr/share/${_pkgname}/gfx
  install -dm 755 ${pkgdir}/usr/share/${_pkgname}/layout
  install -Dm755 ${_srcdir}/${_pkgname} ${pkgdir}/usr/share/${_pkgname}/${_pkgname}
  install -Dm644 ${_srcdir}/gfx/*.png ${pkgdir}/usr/share/${_pkgname}/gfx/
  install -Dm644 ${_srcdir}/layout/*.css ${pkgdir}/usr/share/${_pkgname}/layout/
  install -Dm644 ${_srcdir}/lang.txt ${pkgdir}/usr/share/${_pkgname}/
  echo "<set PicLocation=\"/usr/share/${_pkgname}/gfx/\">" >> ${pkgdir}/etc/${_pkgname}.cfg
  echo "<set CssDir=\"/usr/share/${_pkgname}/layout/\">" >> ${pkgdir}/etc/${_pkgname}.cfg
  echo "<set LangFile=\"/usr/share/${_pkgname}/lang.txt\">" >> ${pkgdir}/etc/${_pkgname}.cfg
}
