# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributions taken from gog-baldurs-gate-2-enhanced-edition.git/Patrice Peterson <runiq at archlinux dot us>

pkgname=gog-mountandblade-warband
pkgver=2.7.0.12
pkgrel=2
_vcver=2.7.0.9
_nwver=2.1.0.3
_libcurlver=7.44.0-2
_libgnutlsver=28_3.3.17-1
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
        "http://ftp.fr.debian.org/debian/pool/main/g/gnutls28/libgnutls-deb0-${_libgnutlsver}_i386.deb")
sha512sums=('69e66c63bcb37b88cd6dbef3119c20ed6000fd340f2c5f2c9f15381ab5738fe806e1548bbf2ff6c0b2aa855272d4cbac51fd27d13e99f48b45cf9d506213fda1'
            '6a8f8a8a544f3d0426d8021b0d2709c388330be8f7aa0ad0c1b5e43025008adde8e1401020755f08808b5aa399d058d592dd30df8d0e3a0bdf653ff6a7dce827'
            '2b3d26f0925f4fcdd83898ce8878d14581cfba8ff51d2a3ba709cd204ddb39229e36f0747c7ddaf2100747c05528059e65407eb52e0658990b64e808f843fbbc'
            '9ec9294a1af5ee08e6c5ea321fae9b69637bee56e4a3c6861b984e22f296f92e5b988793fe894a78b131f8548606b7de61ff0fe014f71805a11e43e3cfce5fec'
            '67655250eb6ce16af115cdd0871711ffcfba7edd4857a496702f0b388a74ca676318a988c9eaa8dc916f44227eb0fefaeb4ea15776592d91e22248502d296074')
md5sums=('643d44d3f972f366c0557289a13db266'
         'a6634efa399778a543ae1f27e2a1f530'
         '92e8d8c7d2c3abb27e30997d32804fd0'
         '99764f04a9751174fff17f0c85308fca'
         'c9fab3d6cd8b9dee2bc6fb89dc862b74')

noextract=("gog_mount_blade_warband_${pkgver}.sh"
           "gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_${_vcver}.sh"
           "gog_mount_blade_warband_napoleonic_wars_dlc_${_nwver}.sh"
           "libcurl3-gnutls_${_libcurlver}_i386.deb"
           "libgnutls-deb0-${_libgnutlsver}_i386.deb")
PKGEXT=.pkg.tar

prepare(){
  # Wrap GOG's mojo installer into the PKGBUILD, this will require user interaction
  printf "Please use target ${srcdir}/mbw and do not create a desktop shortcut or menu item\\n"
  read -p "Press any key to continue... " -n1 -s
  sh ./gog_mount_blade_warband_${pkgver}.sh
  sh ./gog_mount_blade_warband_viking_conquest_reforged_edition_dlc_${_vcver}.sh
  sh ./gog_mount_blade_warband_napoleonic_wars_dlc_${_nwver}.sh
  # Extract the missing libraries from debian (these should be replaced by libraries in the Arch package system of course)
  bsdtar xOf ./libcurl3-gnutls_${_libcurlver}_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libcurl-gnutls.so.4.4.0
  bsdtar xOf ./libgnutls-deb0-${_libgnutlsver}_i386.deb data.tar.xz | bsdtar xf - --strip-components 4 ./usr/lib/i386-linux-gnu/libgnutls-deb0.so.28.41.9
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
