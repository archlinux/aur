# Maintainer: sukanka <su975853527 at gmail.com>
pkgname=ox-console-bin
_pkgname=ox-console
pkgver=9.10_0
pkgrel=2
pkgdesc="A family  of software packages providing an integrated solution for the econometric analysis of time series, forecasting, financial econometric modelling, or statistical analysis of cross-section and panel data."
arch=('x86_64')
url="https://www.doornik.com/products.html#OxCons"
license=('unknown')
depends=('openmp')
optdepends=('java-runtime' 'r'
'python'
)
provides=(${_pkgname} oxedit)
source=("${_pkgname}-${pkgver//_/-}-${arch}.deb::https://www.doornik.com/download/oxmetrics9/Ox_Console/oxconsole_${pkgver//_/-}_amd64.deb")
sha512sums=('ab0d8d88b21e1c9be65ee50df5d0cf1ab2831be08ae2e402b453b78faf0fc58fe5a524ebe7beb68890b99796d4a4418c17cbbf2fc0ed95f3970f95b0dcf21a75')


prepare(){
  cd ${srcdir}
  tar -xJvf data.tar.xz -C "${srcdir}"
  rm -rf usr/lib
  cd $srcdir/usr/share/OxMetrics${pkgver:0:1}/OxEdit_resources
  mkdir -p ${srcdir}/usr/share/applications
  sed -i 's|/usr/share/OxMetrics9/||g'  oxedit${pkgver:0:1}.desktop
  sed -i '7c Icon=oxedit' oxedit${pkgver:0:1}.desktop
  mv oxedit${pkgver:0:1}.desktop  ${srcdir}/usr/share/applications/oxedit.desktop
  for res in {48,256}
  do
      install -Dm644 oxedit_${res}x${res}.png  \
      ${srcdir}/usr/share/icons/hicolor/${res}x${res}/apps/oxedit.png
  done
}

package() {
  cd $srcdir/
  mv usr $pkgdir
  cd $pkgdir/usr/share/OxMetrics${pkgver:0:1}
  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/OxMetrics${pkgver:0:1}/oxedit ${pkgdir}/usr/bin/oxedit
  ln -s /usr/share/OxMetrics${pkgver:0:1}/ox/oxl.sh ${pkgdir}/usr/bin/oxl
  mv ox/libox.so.9.1.0  ox/libox.so.9
  ln -sf /usr/lib/libomp.so $pkgdir/usr/share/OxMetrics${pkgver:0:1}/ox/libomp.so.5

}
