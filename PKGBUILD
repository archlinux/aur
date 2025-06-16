# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=bbcsdl
pkgver=1.41b
pkgrel=1
pkgdesc="BBC Basic Programming for Linux"
arch=('x86_64')
url="https://www.bbcbasic.co.uk/bbcsdl"
license=('CC-BY-NC-SA-4.0')
depends=('sdl2' 'sdl2-compat' 'sdl2_ttf' 'sdl2_net' 'zlib' 'glibc')
makedepends=('nasm')
provides=('bbcsdl')
conflicts=('bbcsdl')
replaces=()
backup=()
options=(!debug)
source=(
  https://github.com/rtrussell/BBCSDL/archive/3602d124be27164ed897555086a3f22ad03c38ab/BBCSDL-3602d124be27164ed897555086a3f22ad03c38ab.tar.gz
  https://www.bbcbasic.net/bbcsdl/bbclinux.zip
)

noextract=()
sha256sums=(
  fd60fde44f3c6875673ed8b183eb04da2cbee61236a03804e1a4876eba802973
  335c55a1f039b4f10742a2186bcd5f58f8a70bf860eba5a5318839194cf96030
)

prepare() {
  cd ${srcdir}/
  tar -xf BBCSDL-3602d124be27164ed897555086a3f22ad03c38ab.tar.gz -C ${srcdir}
  mv BBCSDL-3602d124be27164ed897555086a3f22ad03c38ab ${pkgname}-${pkgver}
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

