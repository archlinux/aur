# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_dirent_commit=c885633e126a3a949ec0497273ec13e2c03e862c
_ImGuiColorTextEdit_commit=0a88824f7de8d0bd11d8419066caa7d3469395c4
_glm_commit=2929ad5a663597139276c10ef905d91e568fdc48
_imgui_commit=0850b46c88daa92443dedf8609a80dbc1da52558
_link_commit=14f6cc99ac41466d52ce780aa37e432fe92c289b
_stb_commit=f54acd4e13430c5122cab4ca657705c84aa61b08
_tinyfiledialogs_commit=2681e426ddaebc8e2764a7823b4b9d69564d1684
_asio_commit=01b4e87c04abd4daec58e40463bcdc150085b269

pkgname=vimix
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
pkgdesc="Live video editor"
url="https://brunoherbelin.github.io/vimix/"
license=('GPL3')
depends=('glfw' 'gst-plugins-base-libs' 'gtk3' 'tinyxml2')
makedepends=('cmake' 'git' 'ninja')
optdepends=('gst-libav: Extra media codecs'
            'gst-plugins-base: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brunoherbelin/vimix/archive/refs/tags/$pkgver.tar.gz"
	"dirent-${_dirent_commit}.tar.gz::https://github.com/tronkko/dirent/archive/${_dirent_commit}.tar.gz"
        "ImGuiColorTextEdit-${_ImGuiColorTextEdit_commit}.tar.gz::https://github.com/BalazsJako/ImGuiColorTextEdit/archive/${_ImGuiColorTextEdit_commit}.tar.gz"
        "glm-${_glm_commit}.tar.gz::https://github.com/g-truc/glm/archive/${_glm_commit}.tar.gz"
        "imgui-${_imgui_commit}.tar.gz::https://github.com/ocornut/imgui/archive/${_imgui_commit}.tar.gz"
        "link-${_link_commit}.tar.gz::https://github.com/Ableton/link/archive/${_link_commit}.tar.gz"
        "stb-${_stb_commit}.tar.gz::https://github.com/nothings/stb/archive/${_stb_commit}.tar.gz"
        "tinyfiledialogs::git+https://git.code.sf.net/p/tinyfiledialogs/code#commit=${_tinyfiledialogs_commit}"
	"asio-${_asio_commit}.tar.gz::https://github.com/chriskohlhoff/asio/archive/${_asio_commit}.tar.gz")
sha512sums=('3ccb5a9a6e9d00bd58649620d77b813a2013a669fd22d46634291ce964b76982cede233a668687491013178a2c7b45b4ab35eaf0458102f7fc21e3852978a270'
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
  tar -xzf "asio-${_asio_commit}.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/ext/link/modules/asio-standalone/"

  git clone "$srcdir/tinyfiledialogs" \
            "$pkgname-$pkgver/ext/tfd/"

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
