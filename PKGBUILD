# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributions taken from gog-baldurs-gate-2-enhanced-edition.git/Patrice Peterson <runiq at archlinux dot us>

pkgname=gog-mountandblade-warband
pkgver=2.7.0.12
pkgrel=1
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

source=("gog://gog_mount_blade_warband_2.7.0.12.sh"
        "gog://gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_2.6.0.8.sh"
        "gog://gog_mount_blade_warband_napoleonic_wars_dlc_2.1.0.3.sh"
        "http://ftp.de.debian.org/debian/pool/main/c/curl/libcurl3-gnutls_7.44.0-1_i386.deb"
        "http://ftp.fr.debian.org/debian/pool/main/g/gnutls28/libgnutls-deb0-28_3.3.17-1_i386.deb")
md5sums=('643d44d3f972f366c0557289a13db266'
         '35c1224546886847150851ce63489a59'
         '92e8d8c7d2c3abb27e30997d32804fd0'
         'fe1030a58472ca2cb1fbb209af740730'
         'c9fab3d6cd8b9dee2bc6fb89dc862b74')
sha512sums=('69e66c63bcb37b88cd6dbef3119c20ed6000fd340f2c5f2c9f15381ab5738fe806e1548bbf2ff6c0b2aa855272d4cbac51fd27d13e99f48b45cf9d506213fda1'
            '9c2079ba22f858af65c52c274dfc4a2e750bbc95f8e64745f63bbef4452d872fd3b5e597f4869ec6058402cedcdc12c9d11449d9a5373ba2c1e78246618c5c2e'
            '2b3d26f0925f4fcdd83898ce8878d14581cfba8ff51d2a3ba709cd204ddb39229e36f0747c7ddaf2100747c05528059e65407eb52e0658990b64e808f843fbbc'
            '8585ba56f2b3e71bd839294a1c949aee7abf84cc255cf65242cb5dc747edf50168beceacc30cbcfae83508ec206822fac27b662604745509283250f9077b0443'
            '67655250eb6ce16af115cdd0871711ffcfba7edd4857a496702f0b388a74ca676318a988c9eaa8dc916f44227eb0fefaeb4ea15776592d91e22248502d296074')
noextract=("gog_mount_blade_warband_2.7.0.12.sh"
           "gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_2.6.0.8.sh"
           "gog_mount_blade_warband_napoleonic_wars_dlc_2.1.0.3.sh"
           "libcurl3-gnutls_7.44.0-1_i386.deb"
           "libgnutls-deb0-28_3.3.17-1_i386.deb")
options=(!strip)
PKGEXT=.pkg.tar

prepare(){
  # Wrap GOG's mojo installer into the PKGBUILD, this will require user interaction
  printf "Please use target ${srcdir}/mbw and do not create a desktop shortcut or menu item\\n"
  read -p "Press any key to continue... " -n1 -s
  sh ./gog_mount_blade_warband_2.7.0.12.sh
  sh ./gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_2.6.0.8.sh
  sh ./gog_mount_blade_warband_napoleonic_wars_dlc_2.1.0.3.sh
  # Extract the missing libraries from debian (these should be replaced by libraries in the Arch package system of course)
  bsdtar xOf ./libcurl3-gnutls_7.44.0-1_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libcurl-gnutls.so.4.4.0
  bsdtar xOf ./libgnutls-deb0-28_3.3.17-1_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libgnutls-deb0.so.28.41.9
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
  mv "${srcdir}/libcurl-gnutls.so.4.4.0" "${pkgdir}/opt/Mount Blade Warband/game/"
  mv "${srcdir}/libgnutls-deb0.so.28.41.9" "${pkgdir}/opt/Mount Blade Warband/game/"
  ln -s libcurl-gnutls.so.4.4.0 "${pkgdir}/opt/Mount Blade Warband/game/libcurl-gnutls.so.4"
  ln -s libgnutls-deb0.so.28.41.9 "${pkgdir}/opt/Mount Blade Warband/game/libgnutls-deb0.so.28"
  ln -s "/opt/Mount Blade Warband/.mojosetup/gog_com-Mount_Blade_Warband_1.desktop" "${pkgdir}/usr/share/applications/Mount_Blade_Warband.desktop"
  ln -s "/opt/Mount Blade Warband/.mojosetup/gog_com-Mount_Blade_Warband_2.desktop" "${pkgdir}/usr/share/applications/Mount_Blade_Warband_config.desktop"
  ln -s "/opt/Mount Blade Warband/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
