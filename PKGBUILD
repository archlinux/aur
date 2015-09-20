# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Richard Graham <richard@rdg.cc>

_release='2010'
_short_release="${_release:2:4}"
_service_pack='0'
pkgname="labview-${_release}"
pkgver="SP${_service_pack}"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64') # This will likely work on i686, but I have not tested it.
license=("custom:LabVIEW-${_release}")
install="labview-${_release}.install"
depends=("labview-${_release}-rte" 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
depends_x86_64+=('lib32-expat'
                 'lib32-gcc-libs'
                 'lib32-glib2'
                 'lib32-glibc'
                 'lib32-libdrm'
                 'lib32-libice'
                 'lib32-libsm'
                 'lib32-libstdc++5'
                 'lib32-libx11'
                 'lib32-libxau'
                 'lib32-libxcb'
                 'lib32-libxcursor'
                 'lib32-libxdamage'
                 'lib32-libxdmcp'
                 'lib32-libxext'
                 'lib32-libxfixes'
                 'lib32-libxinerama'
                 'lib32-libxrender'
                 'lib32-libxshmfence'
                 'lib32-libxt'
                 'lib32-libxxf86vm'
                 'lib32-mesa'
                 'lib32-mesa-libgl'
                 'lib32-openssl098'
                 'lib32-pcre'
                 'lib32-util-linux'
                 'lib32-zlib')
makedepends=('sed' 'libarchive')
options=('!strip' '!upx') # Avoid time consuming operations.
PKGEXT='.pkg.tar' # Do not compress, it's a large package (~1GB).
source=("file://labview-${_release}-appbuild-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-core-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-desktop-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-examples-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-help-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-pro-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://labview-${_release}-ref-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://niexfinder-base-1.0-19.i386.rpm"
        "file://niexfinder-labview-${_release}-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://nilvcompare-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://nilvmerge-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://nisvcloc-${_short_release}.0.${_service_pack}-1.i386.rpm"
        "file://niwebpipeline20_dep-2.0-5.i586.rpm"
        "file://LICENSE.txt"
        "file://PATENTS.txt")
md5sums=('003fa58d0e43d74441f1716f8a83fc59'
         'a6f209b7901f24c0ab67e823f6aa83f7'
         'eebffdb3ebe3d2b9f0b4c2c89e0e0e3d'
         'e0f1d1e471ce2968179b1ef9e5f35252'
         '4473f311612201711144a12313bc6837'
         '5646bfdb013790d394969b80a9e621ac'
         '630e8fc2155d752118e436b37f19ceb9'
         '1f237f1937db222ca717034cbd82fb55'
         'e019e0476940e077cdd97658ac525f22'
         '6c1c92c1b61d27e94177f568f7614da6'
         'd31a78a16e9de038d48d4c5a13ce0376'
         'c9e58c450ea14c146c5e290f357c9886'
         '432bc600994a9c29be67144de730490e'
         'b2bdb88ba72887a28351dbf37318f655'
         'a1a1c2c25ae24f9c0e54c1003d772a79')

package() {
  mkdir -p "${pkgdir}/opt"

  cp -rp "${srcdir}/usr/local/natinst" "${pkgdir}/opt/"
     
  mkdir -p "${pkgdir}/usr/share/licenses/LabVIEW-${_release}"
  cp "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/LICENSE.txt"
  cp "${srcdir}/PATENTS.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/PATENTS.txt"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes"

  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/icons/48x48/labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/icons/48x48/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/natinst-labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/icons/128x128/labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/icons/128x128/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/natinst-labview.png"

  for file in "${pkgdir}"/opt/natinst/LabVIEW-"${_release}"/etc/desktop/icons/48x48/i-*.png; do
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/`echo ${file##*/} | sed "s,i-,application-x-,"`
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/`echo ${file##*/} | sed "s,i-,application-x-,"`
  done

  mkdir -p "${pkgdir}/usr/share/applications"
  sed "s,Exec.*,Exec=/opt/natinst/LabVIEW-${_release}/labview -launch "%F"," "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/apps/natinst-labview-${_release}.desktop" > "${pkgdir}/usr/share/applications/natinst-labview-${_release}.desktop"

  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}/etc/desktop/mime/labview.xml" "${pkgdir}/usr/share/mime/packages"
}

# vim:set et sw=2 sts=2: