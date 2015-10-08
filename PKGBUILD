# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=gog-prisonarchitect
pkgver=2.0.0.3
pkgrel=3
pkgdesc="Prison construction and management simulation, GOG version"
url=('https://www.gog.com/game/prison_architect')
license=('custom')
arch=('i686' 'x86_64')
depends=('glu' 'gtk2')
options=('staticlibs' '!strip')

DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")

source=("gog://gog_prison_architect_${pkgver}.sh")
sha512sums=('39e6cd0acf1a7a3840b9204c9c1b7d1eb2bffedee4fb2de26040a14b953240fa1753a2e07469187426a1940151402eb91ddd8e1183e4c72bfa61f68b30be004d')
md5sums=('6317930754f725f5e363bc1a2d23fe50')
noextract=("gog_prison_architext_${pkgver}.sh")
PKGEXT=.pkg.tar

prepare(){
  # Wrap GOG's mojo installer into the PKGBUILD, this will require user interaction
  printf "Please use target ${srcdir}/prisonarchitect and do not create a desktop shortcut or menu item\\n"
  read -p "Press any key to continue... " -n1 -s
  sh ./gog_prison_architect_${pkgver}.sh
  # Set the path names in installer scripts to their final destination
  sed -i "s|${srcdir}/prisonarchitect|/opt/prisonarchitect|g" "${srcdir}/prisonarchitect/.mojosetup/gog_com-Prison_Architect_"{1,2}.desktop
  sed -i "s|${srcdir}/prisonarchitect|/opt/prisonarchitect|g" "${srcdir}/prisonarchitect/.mojosetup/manifest/Prison Architect."{lua,xml}
  # fix directory permissions
  find "${srcdir}/prisonarchitect" -type d -exec chmod 755 {} \;
}

package(){
  # Create directories and move the game files to their destinations
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${srcdir}/prisonarchitect" "${pkgdir}/opt/prisonarchitect"
  ln -s "/opt/prisonarchitect/.mojosetup/gog_com-Prison_Architect_1.desktop" "${pkgdir}/usr/share/applications/gog_com-Prison_Architect_1.desktop"
  ln -s "/opt/prisonarchitect/.mojosetup/gog_com-Prison_Architect_2.desktop" "${pkgdir}/usr/share/applications/gog_com-Prison_Architect_2.desktop"
  ln -s "/opt/prisonarchitect/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
