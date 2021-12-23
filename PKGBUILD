# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_dirent_commit=c885633e126a3a949ec0497273ec13e2c03e862c
_ImGuiColorTextEdit_commit=0a88824f7de8d0bd11d8419066caa7d3469395c4
_glm_commit=2929ad5a663597139276c10ef905d91e568fdc48
_imgui_commit=0850b46c88daa92443dedf8609a80dbc1da52558
_link_commit=14f6cc99ac41466d52ce780aa37e432fe92c289b
_stb_commit=f54acd4e13430c5122cab4ca657705c84aa61b08
_tinyfiledialogs_commit=cc6b593c029110af8045826ce691f540c85e850c
_tinyxml2_commit=bf15233ad88390461f6ab0dbcf046cce643c5fcb
_asio_commit=01b4e87c04abd4daec58e40463bcdc150085b269

pkgname=vimix
pkgver=0.6.2
pkgrel=1
arch=('x86_64')
pkgdesc="Live video editor"
url="https://brunoherbelin.github.io/vimix/"
license=('GPL3')
depends=('glfw' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gtk3')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brunoherbelin/vimix/archive/refs/tags/$pkgver.tar.gz"
	"dirent-${_dirent_commit}.tar.gz::https://github.com/tronkko/dirent/archive/${_dirent_commit}.tar.gz"
        "ImGuiColorTextEdit-${_ImGuiColorTextEdit_commit}.tar.gz::https://github.com/BalazsJako/ImGuiColorTextEdit/archive/${_ImGuiColorTextEdit_commit}.tar.gz"
        "glm-${_glm_commit}.tar.gz::https://github.com/g-truc/glm/archive/${_glm_commit}.tar.gz"
        "imgui-${_imgui_commit}.tar.gz::https://github.com/ocornut/imgui/archive/${_imgui_commit}.tar.gz"
        "link-${_link_commit}.tar.gz::https://github.com/Ableton/link/archive/${_link_commit}.tar.gz"
        "stb-${_stb_commit}.tar.gz::https://github.com/nothings/stb/archive/${_stb_commit}.tar.gz"
        "tinyfiledialogs-${_tinyfiledialogs_commit}.tar.gz::https://github.com/native-toolkit/tinyfiledialogs/archive/${_tinyfiledialogs_commit}.tar.gz"
	"tinyxml2-${_tinyxml2_commit}.tar.gz::https://github.com/leethomason/tinyxml2/archive/${_tinyxml2_commit}.tar.gz"
	"asio-${_asio_commit}.tar.gz::https://github.com/chriskohlhoff/asio/archive/${_asio_commit}.tar.gz")
sha512sums=('fe641e1801dd3ad2304c1576b7f06214dd4ed1db6d3c1b999ad6149b9547ebbdaf4525bd02c045ced7236757dff067af50012ff8232c8b820f75c1aa3f3b69e7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

prepare() {
  tar -xzf "dirent-${_dirent_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/Dirent/"
  tar -xzf "ImGuiColorTextEdit-${_ImGuiColorTextEdit_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/ImGuiColorTextEdit/"
  tar -xzf "glm-${_glm_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/glm/"
  tar -xzf "imgui-${_imgui_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/imgui/"
  tar -xzf "link-${_link_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/link/"
  tar -xzf "stb-${_stb_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/stb/"
  tar -xzf "tinyfiledialogs-${_tinyfiledialogs_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/tfd/"
  tar -xzf "tinyxml2-${_tinyxml2_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/tinyxml2/"
  tar -xzf "asio-${_asio_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/link/modules/asio-standalone/"

  sed -i 's|${SNAP}/meta/gui/||' \
         "$pkgname-$pkgver/snap/gui/$pkgname.desktop"
}

build() {
  cd $pkgname-$pkgver
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build/
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build/ install

  install -Dm 644 snap/gui/$pkgname.desktop \
                 "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm 644 snap/gui/$pkgname.svg \
                 "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
