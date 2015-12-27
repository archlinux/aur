# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributions taken from gog-baldurs-gate-2-enhanced-edition.git/Patrice Peterson <runiq at archlinux dot us>

pkgname=gog-mountandblade-warband
pkgver=2.7.0.12
pkgrel=4
_vcver=2.8.0.10
_nwver=2.1.0.3
_libcurlver=7.45.0-1+b1
_libcurllibver=4.4.0
_libgnutlsver=28_3.3.19-1
_libgnutlslibver=28.41.11
_libnghttp2ver=14_1.6.0-1
_libnghttp2libver=14.4.0
pkgdesc="An action role playing game, GOG version"
url=('https://www.gog.com/game/mount_blade_warband')
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-sdl2' 'lib32-libaudio2' 'lib32-nettle' 'lib32-krb5' 'lib32-glew1.10'
         'lib32-libssh2' 'lib32-libidn' 'lib32-qt4' 'lib32-p11-kit' 'lib32-libpng12'
         'lib32-rtmpdump' 'gtk2')
depends_i686=('sdl2' 'libaudio2' 'nettle' 'krb5' 'glew1.10'
         'libssh2' 'libidn' 'qt4' 'p11-kit' 'libpng12'
         'rtmpdump' 'gtk2')
options=('staticlibs' '!strip')

DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")

source=("gog://gog_mount_blade_warband_${pkgver}.sh"
        "gog://gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_${_vcver}.sh"
        "gog://gog_mount_blade_warband_napoleonic_wars_dlc_${_nwver}.sh"
        "http://ftp.de.debian.org/debian/pool/main/c/curl/libcurl3-gnutls_${_libcurlver}_i386.deb"
        "http://ftp.fr.debian.org/debian/pool/main/g/gnutls28/libgnutls-deb0-${_libgnutlsver}_i386.deb"
        "http://ftp.nl.debian.org/debian/pool/main/n/nghttp2/libnghttp2-${_libnghttp2ver}_i386.deb")
md5sums=('643d44d3f972f366c0557289a13db266'
         'cb0f422a1b714fc3668d00517efd6087'
         '92e8d8c7d2c3abb27e30997d32804fd0'
         'bf703a8da771cd155e54be301cd47e34'
         'eb0eeda4de92d6f9e04c9436b58c5305'
         'c8f157bba7b769ce94d99b5ffaca6d68')
sha512sums=('69e66c63bcb37b88cd6dbef3119c20ed6000fd340f2c5f2c9f15381ab5738fe806e1548bbf2ff6c0b2aa855272d4cbac51fd27d13e99f48b45cf9d506213fda1'
            'e45948d33d1e20d9c55520686b0a7f3dd9d67f34e76e1bd597c88c6c2da578cb89c2d289f2c9a202c8a9e3462fa99b32ef47f77fd6fd89ba41c0c78f493bc15e'
            '2b3d26f0925f4fcdd83898ce8878d14581cfba8ff51d2a3ba709cd204ddb39229e36f0747c7ddaf2100747c05528059e65407eb52e0658990b64e808f843fbbc'
            '9e87ac7b559034b96caa72e607cc2a572c2f760e7015ceab2c06dd77eeb70e0a22a0f35ef34cf1a1296c28a44ea44dddf2c4e7e72d8ba33773d59bb742a699ec'
            'bccf428e12d36ea14d46c446d244c4c014662717d66a9d9921ea0fef2c29735b98fb63cf78f178db7a0e8c8ffafe8179be232b0298e288dc0fe00ba58a620f07'
            '61a8527c9c8f1ee043d0830bcdafdd70d72e3fd2953b7b7767b676596a8001c974af3e8117f2f2655391441e65e8ee229c0b84fc9d326fc4915be87aa3739286')

noextract=("gog_mount_blade_warband_${pkgver}.sh"
           "gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_${_vcver}.sh"
           "gog_mount_blade_warband_napoleonic_wars_dlc_${_nwver}.sh"
           "libcurl3-gnutls_${_libcurlver}_i386.deb"
           "libgnutls-deb0-${_libgnutlsver}_i386.deb"
           "libnghttp2-${_libnghttp2ver}_i386.deb")
PKGEXT=.pkg.tar

prepare(){
  # Wrap GOG's mojo installer into the PKGBUILD, this will require user interaction
  printf "Please use target ${srcdir}/mbw and do not create a desktop shortcut or menu item\\n"
  read -p "Press any key to continue... " -n1 -s
  sh ./gog_mount_blade_warband_${pkgver}.sh
  sh ./gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_${_vcver}.sh
  sh ./gog_mount_blade_warband_napoleonic_wars_dlc_${_nwver}.sh
  # Extract the missing libraries from debian (these should be replaced by libraries in the Arch package system of course)
  bsdtar xOf ./libcurl3-gnutls_${_libcurlver}_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libcurl-gnutls.so.${_libcurllibver}
  bsdtar xOf ./libgnutls-deb0-${_libgnutlsver}_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libgnutls-deb0.so.${_libgnutlslibver}
  bsdtar xOf ./libnghttp2-${_libnghttp2ver}_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libnghttp2.so.${_libnghttp2libver}
  # Set the path names in installer scripts to their final destination
  sed -i "s|${srcdir}/mbw|/opt/Mount\ Blade\ Warband|g" "${srcdir}/mbw/.mojosetup/gog_com-Mount_Blade_Warband_"{1,2}".desktop"
  sed -i "s|${srcdir}/mbw|/opt/Mount\ Blade\ Warband|g" "${srcdir}/mbw/.mojosetup/manifest/Mount Blade Warband."{lua,xml}
  # fix directory permissions
  find "${srcdir}/mbw" -type d -exec chmod 755 {} \;
}

package(){
  # Create directories and move the game files to their destinations
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${srcdir}/mbw" "${pkgdir}/opt/Mount Blade Warband"
  mv "${srcdir}/libcurl-gnutls.so.${_libcurllibver}" "${pkgdir}/opt/Mount Blade Warband/game/"
  mv "${srcdir}/libgnutls-deb0.so.${_libgnutlslibver}" "${pkgdir}/opt/Mount Blade Warband/game/"
  mv "${srcdir}/libnghttp2.so.${_libnghttp2libver}" "${pkgdir}/opt/Mount Blade Warband/game/"
  ln -s libcurl-gnutls.so.${_libcurllibver} "${pkgdir}/opt/Mount Blade Warband/game/libcurl-gnutls.so.4"
  ln -s libgnutls-deb0.so.${_libgnutlslibver} "${pkgdir}/opt/Mount Blade Warband/game/libgnutls-deb0.so.28"
  ln -s libnghttp2.so.${_libnghttp2libver} "${pkgdir}/opt/Mount Blade Warband/game/libnghttp2.so.14"
  ln -s "/opt/Mount Blade Warband/.mojosetup/gog_com-Mount_Blade_Warband_1.desktop" "${pkgdir}/usr/share/applications/Mount_Blade_Warband.desktop"
  ln -s "/opt/Mount Blade Warband/.mojosetup/gog_com-Mount_Blade_Warband_2.desktop" "${pkgdir}/usr/share/applications/Mount_Blade_Warband_config.desktop"
  ln -s "/opt/Mount Blade Warband/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
