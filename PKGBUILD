# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_dirent_commit=c885633e126a3a949ec0497273ec13e2c03e862c
_ImGuiColorTextEdit_commit=0a88824f7de8d0bd11d8419066caa7d3469395c4
_glm_commit=da9a21d7e3a2a3a32354a7d9da362d5738b113b6
_imgui_commit=5503c0a12e0c929e84b3f61b2cb4bb9177ea3da1
_link_commit=14f6cc99ac41466d52ce780aa37e432fe92c289b
_stb_commit=f4a71b13373436a2866c5d68f8f80ac6f0bc1ffe
_tinyfiledialogs_commit=2681e426ddaebc8e2764a7823b4b9d69564d1684
_asio_commit=01b4e87c04abd4daec58e40463bcdc150085b269

pkgname=vimix
pkgver=0.8.2
pkgrel=3
arch=('x86_64')
pkgdesc="Live video editor"
url="https://brunoherbelin.github.io/vimix/"
license=('GPL-3.0-or-later')
depends=('glfw' 'gst-plugins-base-libs' 'gtk3' 'tinyxml2')
makedepends=('cmake' 'git' 'ninja')
optdepends=('gst-libav: Extra media codecs'
            'gst-plugins-base: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brunoherbelin/vimix/archive/refs/tags/$pkgver.tar.gz"
	"dirent-${_dirent_commit}.tar.gz::https://github.com/tronkko/dirent/archive/${_dirent_commit}.tar.gz"
        "ImGuiColorTextEdit-${_ImGuiColorTextEdit_commit}.tar.gz::https://github.com/BalazsJako/ImGuiColorTextEdit/archive/${_ImGuiColorTextEdit_commit}.tar.gz"
        "glm-${_glm_commit}.tar.gz::https://github.com/g-truc/glm/archive/${_glm_commit}.tar.gz"
        "imgui-${_imgui_commit}.tar.gz::https://github.com/ocornut/imgui/archive/${_imgui_commit}.tar.gz"
        "link-${_link_commit}.tar.gz::https://github.com/Ableton/link/archive/${_link_commit}.tar.gz"
        "stb-${_stb_commit}.tar.gz::https://github.com/nothings/stb/archive/${_stb_commit}.tar.gz"
        "tinyfiledialogs::git+https://git.code.sf.net/p/tinyfiledialogs/code#commit=${_tinyfiledialogs_commit}"
	"asio-${_asio_commit}.tar.gz::https://github.com/chriskohlhoff/asio/archive/${_asio_commit}.tar.gz"
	'gstreamer-0.24-support.patch')
b2sums=('fab60f7dc1fddaddee5e6620653396bd36fa96c8ed71013d6b83ed2d920dd49a795e5a5b23bd02d133b5fb25a448cdc9c1cdc2f3532eaf1949a8c5a7551ccc6d'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '627cce5659e49bb1355118828643d22c86c47bd8d9be45381927c192bb253d235e5cbe2e630035d07957b4ca4cfc8c7cb83e63ef264db5227c9d2df2bd33d450')

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

  # Fix std::list search issue in some modules
  sed -i '/<sstream>/ a #include <algorithm>' \
         "$pkgname-$pkgver/src/DisplaysView.cpp" \
         "$pkgname-$pkgver/src/SessionCreator.cpp"
  sed -i '/<iostream>/ a #include <algorithm>' \
         "$pkgname-$pkgver/src/SourceControlWindow.cpp"

  # Fix build failure due to latest GStreamer update (version 0.24)
  patch --forward --strip=1 --input="${srcdir}/gstreamer-0.24-support.patch" \
         -d "$srcdir/$pkgname-$pkgver"
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
