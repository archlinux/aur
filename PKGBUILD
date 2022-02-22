# Maintainer: sukanka <su975853527 at gmail.com>
pkgname=ox-console-bin
_pkgname=ox-console
pkgver=9.00_0
pkgrel=1
pkgdesc="A family  of software packages providing an integrated solution for the econometric analysis of time series, forecasting, financial econometric modelling, or statistical analysis of cross-section and panel data."
arch=('x86_64')
url="https://www.doornik.com/products.html#OxCons"
license=('unknown')
depends=('openmp')
optdepends=('javaruntime' 'r'
'python'
)
provides=(${_pkgname} oxedit)
source=("${_pkgname}-${pkgver//_/-}-${arch}.deb::https://www.doornik.com/download/oxmetrics9/Ox_Console/oxconsole_${pkgver//_/-}_amd64.deb")
sha512sums=('638e4c13bf98c231b9a1b1b99eacdf5ca6e847be049b5e321330e218dc411007ab63278d6d9faaae5cc079293268f19ed61f25feb77ab58bc6160a3d5b093e80')


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
  mv ox/libox.so.9.0.0  ox/libox.so.9
  ln -s /usr/lib/libomp.so $pkgdir/usr/share/OxMetrics${pkgver:0:1}/ox/libomp.so.5
  
}
