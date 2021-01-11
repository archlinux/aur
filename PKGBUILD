# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=mesa-demos-git
pkgver=8.4.0
pkgrel=1
arch=('x86_64')
pkgdesc="Mesa demos and tools incl. glxinfo + glxgears"
url="https://www.mesa3d.org/"
license=('custom')
depends=('libgl' 'glew' 'freeglut')
makedepends=('mesa' 'freetype2' 'git')
provides=(mesa-demos)
conflicts=(mesa-demos)
source=("git+https://gitlab.freedesktop.org/mesa/demos"
        'LICENSE')
sha512sums=('SKIP'
            'SKIP')
#validpgpkeys=('E390B9700582FAEA959ACAD41EEF53D38A3A9C67') # "Andreas Boll <andreas.boll.dev@gmail.com>"

pkgver() {
  cd mesa-demos
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd mesa-demos

  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-gles1 \
    --with-system-data-files=/usr/share/mesa-demos
  make
}

package() {
  cd mesa-demos
  make DESTDIR="${pkgdir}" install
  
  # add missing egl files
  install -m 0755 src/egl/opengl/{eglgears_x11,eglinfo,eglkms,egltri_x11,peglgears,xeglgears,xeglthreads} "${pkgdir}/usr/bin/"
  
  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-demos"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-demos/"
}
