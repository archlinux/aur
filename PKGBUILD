# Maintainer: LIN Ruohshoei <lin dot ruohshoei+arch at gmail dot com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgbase=snes9x-git
_pkgbase=snes9x
pkgname=( snes9x-git snes9x-gtk-git )
pkgver=1.59.2.r33.gc39f769
pkgrel=1
pkgdesc="Port of the Snes9x emulator (git version)"
arch=('x86_64')
url="http://www.snes9x.com/"
license=('custom')
makedepends=( alsa-lib cairo gdk-pixbuf2 git glib2 glslang 
  gtk3 intltool libepoxy libpng libpulse libx11 libxext libxml2
  libxrandr libxv meson minizip nasm portaudio sdl2 zlib
)
source=(
  git+https://github.com/snes9xgit/snes9x.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_pkgbase}
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'

}
prepare() {
  cd ${_pkgbase}
  for submodule in shaders/SPIRV-Cross; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git submodule update ${submodule}
  done

  cd unix
  autoreconf -fiv
}

build() {
  cd ${_pkgbase}/unix

  ./configure \
    --prefix='/usr' \
    --enable-netplay
  make

  cd ${srcdir}
  arch-meson snes9x/gtk build
  ninja -C build
}

package_snes9x-git() {

  pkgdesc="portable Emulator for the Super Nintendo Entertainment System"
  depends=(libpng libx11 libxext libxinerama libxv minizip zlib)

  conflicts=('snes9x')
  provides=('snesx')

  cd ${_pkgbase}
  install -D -m755 unix/snes9x -t "${pkgdir}"/usr/bin/
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644  {unix/snes9x.conf.default,docs/{control-inputs,controls,snapshots}.txt} \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm644  LICENSE -t \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"

}

package_snes9x-gtk-git() {

  pkgdesc="Portable Emulator for the Super Nintendo Entertainment System - GTK version"
  depends=(alsa-lib cairo gdk-pixbuf2 glib2 glslang gtk3 hicolor-icon-theme libepoxy libpng
  libpulse libx11 libxext libxml2 libxrandr libxv minizip portaudio sdl2 zlib)

  conflicts=('snes9x-gtk')
  provides=('snes9x-gtk')

  DESTDIR="${pkgdir}" ninja -C build install

  cd ${_pkgbase}

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 {unix/snes9x.conf.default,docs/{control-inputs,controls,snapshots}.txt}  \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"

}
