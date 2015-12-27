# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=gog-prisonarchitect
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Prison construction and management simulation, GOG version"
url=('https://www.gog.com/game/prison_architect')
license=('custom')
arch=('i686' 'x86_64')
depends=('glu' 'gtk2')
options=('staticlibs' '!strip')

DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")

source=("gog://gog_prison_architect_${pkgver}.sh")
md5sums=('d10de9aac9ba70efd748ae728585d776')
sha512sums=('9a072b73118bb18f8f7b20caadbc2d3cd6839d65fa8a7b1ba9628ab4867222242cf4c33c6cfcb2758b4c85a5777e06230ba17ea4001b6a39620db0d74d12f753')
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
