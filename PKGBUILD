# Maintainer: Bruno Van de Velde <bruno@texus.me>

pkgname=tgui-git
pkgver=nightly_build.r0.g8719a201
pkgrel=1
pkgdesc="Cross-platform modern c++ GUI library"
arch=('i686' 'x86_64')
url="https://tgui.eu/"
license=('ZLIB')
depends=('sfml' 'sdl2' 'sdl2_ttf' 'glfw-x11' 'freetype2')
makedepends=('cmake' 'doxygen' 'git')
provides=('tgui')
conflicts=('tgui')
replaces=()

source=("git+https://github.com/texus/TGUI.git#branch=0.10"
        tgui-gui-builder.desktop
        TexusGUI_48x48.png)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/TGUI"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/TGUI"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DTGUI_CXX_STANDARD=17 \
        -DTGUI_BUILD_DOC=ON \
        -DTGUI_BUILD_GUI_BUILDER=ON \
        -DTGUI_BACKEND=Custom \
        -DTGUI_HAS_BACKEND_SFML_GRAPHICS=ON \
        -DTGUI_HAS_BACKEND_SFML_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_RENDERER=ON \
        -DTGUI_HAS_BACKEND_SDL_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_GLES2=ON \
        -DTGUI_HAS_BACKEND_SDL_TTF_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_TTF_GLES2=ON \
        -DTGUI_HAS_BACKEND_GLFW_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_GLFW_GLES2=ON
  make
}

package() {
  cd "$srcdir/TGUI"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ../TexusGUI_48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/TexusGUI.png"
  install -Dm644 ../tgui-gui-builder.desktop "${pkgdir}/usr/share/applications/tgui-gui-builder.desktop"
}
