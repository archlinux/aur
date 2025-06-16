# Maintainer: Daniele Olivieri <danieledaniele1988@gmail.com>
# Contributor: Ilya Elenskiy
# Contributor: Oystein Sture <oysstu@gmail.com>
# Contributor: Tassos Natsakis <7712382@eipieq.com>

_release='2022'
pkgname="labview-2022"
pkgver="1"
pkgrel=6
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://download.ni.com/support/softlib/labview/labview_development_system/2022%20Q3/Patches/f1/Linux/lv2022Q3_f1Patch_full-linux-mac.iso"
arch=('x86_64')
license=("custom:LabVIEW-2022")
depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
makedepends=('sed' 'libarchive')
options=('!strip') # Avoid time consuming operations.
source=("https://download.ni.com/support/softlib/labview/labview_development_system/2022%20Q3/Patches/f1/Linux/lv2022Q3_f1Patch_full-linux-mac.iso")

sha256sums=('b50bf77d0e8f9242766c2166da865925ad99d8da14b5d55f6032dc5e10ff69ed')

prepare() {
    chmod -R +w "${srcdir}"
    
    # Install main program
    cd "${srcdir}/LabVIEW/Linux";
    bsdtar -xf "LabVIEW2022Q3-Full.iso" -C ${srcdir}; 
    cd "${srcdir}/rpm";
    for f in "${srcdir}"/rpm/*.rpm; do bsdtar -xf "$f" -C ${srcdir}; done;
  
    #Install Addon Control design  
   cd "${srcdir}/LabVIEW Add-ons/Control Design and Simulation/"; 
   bsdtar -xf "CD&Sim2022Q3.iso";
   chmod -R +w "./"*;
   bsdtar -xf "./Linux/lvsupport2022-cdsim-22.3.0-f0.tar.gz"
   for f in "./rpms/"*.rpm; do bsdtar -xf "$f" -C ${srcdir}; done;
  
     #Install Addon MathScript RT
  cd "${srcdir}/LabVIEW Add-ons/MathScript RT"
  bsdtar -xf "MathScript2022Q3.iso";
  chmod -R +w "./"*;
  bsdtar -xf "./Linux/lvsupport2022-mathscriptrt-22.3.0-f0.tar.gz";
  for f in "./rpms/"*.rpm; do bsdtar -xf "$f" -C ${srcdir}; done;
}
            
            
package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/etc"
  mkdir -p "${pkgdir}/var"
  mkdir -p "${pkgdir}/usr"


  cp -rp "${srcdir}/opt" "${pkgdir}"
  cp -rp "${srcdir}/etc" "${pkgdir}"
  cp -rp "${srcdir}/var" "${pkgdir}"
  cp -rp "${srcdir}/usr" "${pkgdir}"
  mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  mv "${pkgdir}/usr/lib64/"* "${pkgdir}/usr/lib/"  
  rmdir "${pkgdir}/usr/sbin"
  rmdir "${pkgdir}/usr/lib64"

  mkdir -p "${pkgdir}/usr/share/licenses/LabVIEW-2022"
  cp "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/LabVIEW-2022/LICENSE.txt"
  cp "${srcdir}/PATENTS.txt" "${pkgdir}/usr/share/licenses/LabVIEW-2022/PATENTS.txt"

#  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
#  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
#  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes"
#  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes"

 # cp "${pkgdir}/opt/natinst/LabVIEW-2022-64/etc/desktop/icons/48x48/labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/labview.png"
 # cp "${pkgdir}/opt/natinst/LabVIEW-2022-64/etc/desktop/icons/48x48/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/natinst-labview.png"
 # cp "${pkgdir}/opt/natinst/LabVIEW-2022-64/etc/desktop/icons/128x128/labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/labview.png"
 # cp "${pkgdir}/opt/natinst/LabVIEW-2022-64/etc/desktop/icons/128x128/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/natinst-labview.png"

  #for file in "${pkgdir}"/opt/natinst/LabVIEW-"2022-64"/etc/desktop/icons/48x48/application-x-*.png; do
  #  cp "$file" "${pkgdir}"/usr/share/icons/hicolor/48x48/mimetypes/
  #  cp "$file" "${pkgdir}"/usr/share/icons/hicolor/128x128/mimetypes/
  #done

  mkdir -p "${pkgdir}/usr/share/applications"
  sed "s,Exec.*,Exec=/usr/local/natinst/LabVIEW-2022-64/labviewprofull -launch "%F"," "${pkgdir}/usr/local/natinst/LabVIEW-2022-64/etc/desktop/apps/natinst-labview64-2022.desktop" > "${pkgdir}/usr/share/applications/natinst-labview-2022.desktop"

  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp "${pkgdir}/usr/local/natinst/LabVIEW-2022-64/etc/desktop/mime/labview.xml" "${pkgdir}/usr/share/mime/packages"

  mkdir -p "${pkgdir}/usr/local/bin"
  ln -s "/usr/local/natinst/LabVIEW-2022-64/labviewprofull" "${pkgdir}/usr/local/bin/labview"
 
  # apply patch 1
 # cp -p "${srcdir}/labview" "${pkgdir}/opt/natinst/LabVIEW-2022-64/"
 # cp -rp "${srcdir}/vi.lib" "${pkgdir}/opt/natinst/LabVIEW-2022-64/"
 # cp -rp "${srcdir}/AppLibs" "${pkgdir}/opt/natinst/LabVIEW-2022-64/"
 
 chmod -R +w "${srcdir}/utils"
 chmod -R +w "${srcdir}/rpm"
 chmod -R +w "${srcdir}/deb"

}

# vim:set et sw=2 sts=2:
