# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=gog-prisonarchitect
pkgver=2.6.0.8
pkgrel=1
pkgdesc="Prison construction and management simulation, GOG version"
url='https://www.gog.com/game/prison_architect'
license=('custom')
arch=('i686' 'x86_64')
depends=('glu' 'gtk2')
options=('staticlibs' '!strip')

DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")

source=("gog://gog_prison_architect_${pkgver}.sh")
md5sums=('d8a20264bbfecd8246bde422b8369c3b')
sha512sums=('538071ca0543f8f6ed7a4ff5bece35050871332eadb5c55b8d62b39ab2fda8b99a1d06c19633e5264550b2ff1f5ce25327c2f7c50245b8afbcdae694edc25989')
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
