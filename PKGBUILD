# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Dan Panzarella <alsoelp@gmail.com>

pkgname=awesomebump
pkgver=5.0
pkgrel=1
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image"
arch=('i686' 'x86_64')
url="http://awesomebump.besaba.com/"
license=('LGPL3')
depends=('qt5-base' 'qt5-location' 'qt5-script')
makedepends=('imagemagick')
source=("${pkgname}.tar.gz::https://github.com/kmkolasinski/AwesomeBump/releases/download/Linuxv${pkgver}/AwesomeBumpV5.Bin64Linux.tar.gz"
        "ab.sh"
        "awesomebump.desktop")
md5sums=('fb9365ee1c32a2f36ea78c296248cf2d'
         '462c8edb251cb603d78242b14189e354'
         'a798a1946042f5c06505043100a32e28')
noextract=("${pkgname}.tar.gz") #because it doesn't expand into a subdir


# Extract tar into a subdir to not pollute source directory which contains
# symlinks to our provided files, causing annoyances on copy
prepare() {
    cd "${srcdir}"
    mkdir "${pkgname}-src"
    tar -xzf "${pkgname}.tar.gz" -C "${pkgname}-src"
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/opt"

  cp --preserve=mode -r "${pkgname}-src" "${pkgdir}/opt/awesomebump"

  convert "${pkgname}-src/logo.ico" awesomebump.png
  install -Dm644 "awesomebump.png" "${pkgdir}/usr/share/pixmaps/awesomebump.png"
  install -Dm644 "awesomebump.desktop" "${pkgdir}/usr/share/applications/awesomebump.desktop"
  install -Dm755 "ab.sh" "${pkgdir}/usr/bin/AwesomeBump"

}

# Compiling this project from source has been a nightmare
# that I have been unable to complete. Running the binary is possible
# but it is VERY finicky with paths. Just symlinking to /usr/bin
# (either the binary or the RunAB script) both complain because the
# texture and config paths are in /opt and it is using relative 
# references internally. I caved and just made my own run script to move 
# a subshell over there and run it.

# Project author is discontinuing work on AB, so filing upstream issues
# to fix these path problems is a no-go.
