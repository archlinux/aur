# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgbase=wxgtk-git
pkgname=(wxwidgets-gtk3-git wxwidgets-qt6-git wxwidgets-common-git)
pkgver=3.3.3.1.r4.gfcdaa107fb
pkgrel=1
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=(x86_64)
url="https://github.com/wxWidgets/wxWidgets"
license=(LicenseRef-wxWindows_Library_Licence)
makedepends=(git cmake gst-plugins-base glu webkit2gtk-4.1 libnotify qt6-base sdl2 libmspack gspell) #gnome-vfs
source=("git+https://github.com/wxWidgets/wxWidgets.git"
        "git+https://github.com/wxWidgets/Catch.git"
        "git+https://github.com/wxWidgets/pcre.git"
        "git+https://github.com/wxWidgets/nanosvg.git"
		"git+https://github.com/wxWidgets/scintilla.git"
        "wxWidgets-lexilla::git+https://github.com/wxWidgets/lexilla.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd wxWidgets
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wxWidgets
  git config submodule.3rdparty/catch.url "${srcdir}/Catch"
  git -c protocol.file.allow=always submodule update --init 3rdparty/catch

  git config submodule.3rdparty/pcre.url "${srcdir}/pcre"
  git -c protocol.file.allow=always submodule update --init 3rdparty/pcre

  git config submodule.3rdparty/nanosvg.url "${srcdir}/nanosvg"
  git -c protocol.file.allow=always submodule update --init 3rdparty/nanosvg

  git config submodule.src/stc/scintilla.url "${srcdir}/scintilla"
  git -c protocol.file.allow=always submodule update --init src/stc/scintilla

  git config submodule.src/stc/lexilla.url "${srcdir}/wxWidgets-lexilla"
  git -c protocol.file.allow=always submodule update --init src/stc/lexilla

  #git submodule init
  #git config submodule.PATH/NAME.url "${srcdir}/NAME"
  #git config submodule.PATH/NAME.url "${srcdir}/NAME"
  #git config submodule.PATH/NAME.url "${srcdir}/NAME"
  #git config submodule.src/stc/scintilla.url "${srcdir}/scintilla"
  #git config submodule.src/stc/lexilla.url "${srcdir}/wxWidgets-lexilla"
  #git -c protocol.file.allow=always submodule update

  ./autogen.sh
}

build() {
  cmake -B build-gtk3 -S wxWidgets -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys\
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON \
	-DwxUSE_LIBGNOMEVFS=OFF

  cmake --build build-gtk3

  cmake -B build-qt6 -S wxWidgets -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=qt \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON

  cmake --build build-qt6

# Run configure to generate the Makefile, cmake doesn't install translations
  cd wxWidgets
  ./configure --prefix=/usr
}

package_wxwidgets-common-git() {
  pkgdesc='Common libraries and headers for wxwidgets'
  depends=(expat pcre2 zlib curl glib2 xz)
  provides=(wxwidgets-common)
  conflicts=(wxwidgets-common)

  DESTDIR="${pkgdir}" cmake --install build-gtk3
  rm -r "${pkgdir}"/usr/{bin/wx-config,lib/{cmake,wx,libwx_gtk*}}
  install -Dm644 wxWidgets/wxwin.m4 -t "${pkgdir}"/usr/share/aclocal
# Install translations
  make DESTDIR="${pkgdir}" -C wxWidgets locale_install

  install -Dm644 wxWidgets/docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_wxwidgets-gtk3-git() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=(gtk3 libsm wxwidgets-common-git libnotify libmspack sdl2 gspell glibc libwebp
	   libjpeg-turbo libx11 gdk-pixbuf2 cairo gstreamer libxtst bash libglvnd libpng gst-plugins-bad-libs
	   wayland glib2 fontconfig libtiff libxkbcommon
	  )
  optdepends=('webkit2gtk-4.1: for webview support')
  provides=(wxwidgets-gtk3=${pkgver})
  conflicts=(wxwidgets-gtk3)

  DESTDIR="${pkgdir}" cmake --install build-gtk3
  rm -r "${pkgdir}"/usr/{include,lib/libwx_base*,bin/wxrc*}
  rm -r "${pkgdir}"/usr/share/locale

  install -Dm644 wxWidgets/docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_wxwidgets-qt6-git() {
  pkgdesc='Qt6 implementation of wxWidgets API for GUI'
  depends=(wxwidgets-common-git libmspack sdl2 libtiff qt6-base bash libpng libglvnd glibc libjpeg-turbo)
  #provides=(wxwidgets-qt5=${pkgver})
  #conflicts=(wxwidgets-qt5)

  DESTDIR="${pkgdir}" cmake --install build-qt6
  rm -r "${pkgdir}"/usr/{include,lib/libwx_base*,bin/wxrc*}
  rm -r "${pkgdir}"/usr/share/locale

  mv "${pkgdir}"/usr/bin/wx-config{,-qt} # Conflicts with wx-gtk3

  # Rename wxWidgets-x.y folder to wxWidgets
  matches=("${pkgdir}"/usr/lib/cmake/wxWidgets-*)
  if [ ${#matches[@]} -eq 1 ] && [ -d "${matches[0]}" ]; then
    mv "${matches[0]}" "${pkgdir}/usr/lib/cmake/wxWidgets"
  fi

  # Rename cmake files for coinstallability
  mv "${pkgdir}"/usr/lib/cmake/wxWidgets{,Qt}
  for _f in "${pkgdir}"/usr/lib/cmake/wxWidgetsQt/*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsQt/')
  done

  install -Dm644 wxWidgets/docs/licence.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
