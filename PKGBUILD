# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=bbcsdl
_tarball=483d7489af3b2d173db7231b5fbc546763321dd6
pkgver=1.44a
pkgrel=2
pkgdesc="BBC Basic Programming for Linux"
arch=('x86_64')
url="https://www.bbcbasic.co.uk/bbcsdl"
license=('CC-BY-NC-SA-4.0')
depends=('sdl2' 'sdl2-compat' 'sdl2_ttf' 'sdl2_net' 'zlib' 'glibc')
makedepends=('nasm' 'unzip')
provides=('bbcsdl')
conflicts=('bbcsdl')
replaces=()
backup=()
options=(!debug)
source=(
  https://github.com/rtrussell/BBCSDL/archive/${_tarball}/BBCSDL-${_tarball}.tar.gz
  https://www.bbcbasic.co.uk/bbcsdl/bbclinux.zip
)

noextract=()
sha256sums=(
  3549f97f77fb5ff1d9711f9a8e7a450acc88c618c3bb6c4913a7f102466a539c
  8673856a9b9ba96e153a0d22836aa0182b0fe8f834c974a2483fa5a849721e60
)

prepare() {
  cd ${srcdir}/
  tar -xf BBCSDL-${_tarball}.tar.gz -C ${srcdir}
  mv BBCSDL-${_tarball} ${pkgname}-${pkgver}
  unzip -f bbclinux.zip Box2D231.so bbc256x.png
  sed -e "s/..\/BBCSDL\/src\/bbdata_x86_64.nas/src\/bbdata_x86_64.nas/" -i ${srcdir}/${pkgname}-${pkgver}/console/linux/makefile
  cat << EOF > bbcsdl.desktop
[Desktop Entry]
Name=BBC BASIC
GenericName=BBC BASIC
Comment=BBC BASIC for Linux
Icon=bbc256x
Exec=bbcsdl
Type=Application
Terminal=false
Categories=Development
StartupNotify=false
EOF

}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd bin/linux
  make
  cd ../../console/linux
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Setup package files
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  install -D -m0755 bbcsdl "${pkgdir}/usr/lib/${pkgname}/bbcsdl"
  install -D -m0755 libstb.so "${pkgdir}/usr/lib/${pkgname}/libstb.so"
  install -D -m0755 bbcbasic "${pkgdir}/usr/lib/${pkgname}/bbcbasic"
  cp bbcsdl.bbc "${pkgdir}/usr/lib/${pkgname}/"
  cp -avxu lib "${pkgdir}/usr/lib/${pkgname}/"
  cp -avxu examples "${pkgdir}/usr/lib/${pkgname}/"

  # Install Box2D library (it can be safely removed, except if your code specifically requires it)
  install -D -m0755 "${srcdir}/Box2D231.so" "${pkgdir}/usr/lib/${pkgname}/Box2D231.so"

  # Create symlinks on /usr/bin
  mkdir -p ${pkgdir}/usr/bin
  ln -sf "/usr/lib/${pkgname}/bbcsdl" "${pkgdir}/usr/bin/bbcsdl"
  ln -sf "/usr/lib/${pkgname}/bbcbasic" "${pkgdir}/usr/bin/bbcbasic"

  # Install icons and desktop menu entry
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/bbc256x.png" "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  cp "${srcdir}/bbcsdl.desktop" "${pkgdir}/usr/share/applications"
}

