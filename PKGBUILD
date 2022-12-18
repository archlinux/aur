# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: dreieck
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=(python2-wxpython3)
pkgver=3.0.2.0
pkgrel=9
pkgdesc="Classic wxWidgets GTK GUI toolkit (legacy version 3.x) for Python2."
arch=(
  'i686'
  'x86_64'
)
license=('custom:wxWindows')
url="https://www.wxpython.org"

makedepends=(
  'glu'
  'mesa' # I don't know if this is enough to be just a makedepend. We compile with opengl support. Does it still run with mesa not available?
  'python2-setuptools'
  'expat'
  'gstreamer0.10-base'
  'libjpeg'
  'libpng'
  'libtiff'
  'python2'
  'sdl'
  'wxwidgets3.0'
)

source=(
  "https://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2"
  "fix-plot.patch"
  "fix-editra-removal.patch"
)
sha256sums=(
  'd54129e5fbea4fb8091c87b2980760b72c22a386cb3b9dd2eebc928ef5e8df61'
  '2d8b2bdbf55172738c7bf93955e552aac61842800c3b8b0a2e1f07f4314abc65'
  '559b076f206c44e66b33857f49068d66f59a3fc15b97972486e32a8105885554'
)


prepare() {
  cd "${srcdir}"

  # Patch for python2
  msg2 "Patching shabeng-lines for python2 ..."
  local _file
  grep -Erl '(bin/env python$|bin/env python[[:space:]]|bin/python$|bin/python[[:space:]])' * | while read _file; do
    sed -Ei 's|bin/env python$|bin/env python2|' "${_file}"
    sed -Ei 's|bin/env python([[:space:]])|bin/env python2\1|' "${_file}"
    sed -Ei 's|bin/python$|bin/python2|' "${_file}"
    sed -Ei 's|bin/python([[:space:]])|bin/python2\1|' "${_file}"
  done
  ## The following python version fixing command was the original one. It is much slower, but kept here in case the above is not working correctly.
  # find . -type f -exec sed -i 's|env python|env python2|' {} \;

  cd "wxPython-src-${pkgver}/wxPython"
  # Fix plot library (FS#42807)
  msg2 "Applying patch 'fix-plot.patch' ..."
  patch -Np1 -i ../../fix-plot.patch

  # Fix editra removal (FS#63563)
  msg2 "Applying patch  'fix-editra-removal.patch' ..."
  patch -Np2 -i ../../fix-editra-removal.patch
}

_configure_opts=(
    --prefix='/usr'
    --libdir='/usr/lib'
    --includedir='/usr/include'
    --enable-gui
    --enable-plugins
    --disable-debug
    --disable-debug_flag
    --disable-debug_info
    --disable-debug_gdb
    --enable-shared
    --enable-stl
    --enable-std_containers
    --enable-std_iostreams
    --enable-std_string
    --enable-std_string_conv_in_wxstring
    --enable-unicode
    --enable-utf8
    --enable-extended_rtti
    --enable-optimise
    --disable-profile
    --enable-compat26
    --enable-compat28
    --enable-visibility
    --enable-tls
    --enable-intl
    --enable-xlocale
    --enable-config
    --enable-protocols
    --enable-ftp
    --enable-http
    --enable-fileproto
    --enable-sockets
    --enable-ipv6
    --enable-dataobj
    --enable-ipc
    --enable-epollloop
    --enable-selectloop
    --enable-any
    --enable-apple_ieee
    --enable-arcstream
    --enable-base64
    --enable-backtrace
    --enable-catch_segvs
    --enable-cmdline
    --enable-datetime
    --enable-debugreport
    --enable-dialupman
    --enable-dynlib
    --enable-dynamicloader
    --enable-exceptions
    --enable-ffile
    --enable-file
    --enable-filehistory
    --enable-filesystem
    --enable-fontenum
    --enable-fontmap
    --enable-fs_archive
    --enable-fs_inet
    --enable-fsvolume
    --enable-fswatcher
    --enable-geometry
    --enable-log
    --enable-longlong
    --enable-mimetype
    --enable-printfposparam
    --enable-snglinst
    --enable-sound
    --enable-stdpaths
    --enable-stopwatch
    --enable-streams
    --enable-sysoptions
    --enable-tarstream
    --enable-textbuf
    --enable-textfile
    --enable-timer
    --enable-variant
    --enable-zipstream
    --enable-url
    --enable-protocol
    --enable-protocol-http
    --enable-protocol-ftp
    --enable-protocol-file
    --enable-threads
    --enable-docview
    --enable-help
    --enable-html
    --enable-htmlhelp
    --enable-xrc
    --enable-aui
    --enable-propgrid
    --enable-ribbon
    --enable-stc
    --enable-constraints
    --enable-loggui
    --enable-logwin
    --enable-logdialog
    --enable-mdi
    --enable-mdidoc
    --enable-mediactrl
    --enable-richtext
    --enable-postscript
    --enable-printarch
    --enable-svg
    --enable-webview
    --enable-graphics_ctx
    --enable-clipboard
    --enable-dnd
    --enable-markup
    --enable-accel
    --enable-animatectrl
    --enable-bannerwindow
    --enable-artstd
    --enable-arttango
    --enable-bmpbutton
    --enable-bmpcombobox
    --enable-button
    --enable-calendar
    --enable-caret
    --enable-checkbox
    --enable-checklst
    --enable-choice
    --enable-choicebook
    --enable-collpane
    --enable-colourpicker
    --enable-combobox
    --enable-comboctrl
    --enable-commandlinkbutton
    --enable-dataviewctrl
    --enable-datepick
    --enable-detect_sm
    --enable-dirpicker
    --enable-display
    --enable-editablebox
    --enable-filectrl
    --enable-filepicker
    --enable-fontpicker
    --enable-gauge
    --enable-grid
    --enable-headerctrl
    --enable-hyperlink
    --enable-imaglist
    --enable-infobar
    --enable-listbook
    --enable-listbox
    --enable-listctrl
    --enable-notebook
    --enable-notifmsg
    --enable-odcombobox
    --enable-popupwin
    --enable-prefseditor
    --enable-radiobox
    --enable-radiobtn
    --enable-richmsgdlg
    --enable-richtooltip
    --enable-rearrangectrl
    --enable-sash
    --enable-scrollbar
    --enable-searchctrl
    --enable-slider
    --enable-spinbtn
    --enable-spinctrl
    --enable-splitter
    --enable-statbmp
    --enable-statbox
    --enable-statline
    --enable-stattext
    --enable-statusbar
    --enable-taskbaricon
    --enable-tbarnative
    --enable-textctrl
    --enable-timepick
    --enable-tipwindow
    --enable-togglebtn
    --enable-toolbar
    --enable-toolbook
    --enable-treebook
    --enable-treectrl
    --enable-treelist
    --enable-commondlg
    --enable-aboutdlg
    --enable-choicedlg
    --enable-coldlg
    --enable-filedlg
    --enable-finddlg
    --enable-fontdlg
    --enable-dirdlg
    --enable-msgdlg
    --enable-numberdlg
    --enable-splash
    --enable-textdlg
    --enable-tipdlg
    --enable-progressdlg
    --enable-wizarddlg
    --enable-menus
    --enable-miniframe
    --enable-tooltips
    --enable-splines
    --enable-mousewheel
    --enable-validators
    --enable-busyinfo
    --enable-hotkey
    --enable-joystick
    --enable-metafiles
    --enable-dragimage
    --enable-accessibility
    --enable-uiactionsim
    --enable-dctransform
    --enable-webviewwebkit
    --enable-palette
    --enable-image
    --enable-gif
    --enable-pcx
    --enable-tga
    --enable-iff
    --enable-pnm
    --enable-xpm
    --enable-ico_cur
    --enable-largefile
    --enable-gtktest
    --enable-sdltest
    --disable-precomp-headers
    --with-themes=all
    --without-motif
    --without-directfb
    --with-libpng=sys
    --with-libjpeg=sys
    --with-libtiff=sys
    --with-libjbig
    --with-liblzma
    --with-libxpm=sys
    --with-libiconv
    --with-libmspack
    --with-gtkprint
    --with-gnomevfs
    --with-libnotify
    --with-opengl
    --without-dmalloc
    --with-sdl
    --with-regex=sys
    --with-zlib=sys
    --with-expat=sys
    --with-x=sys

    --with-gtk=3
    --with-wx-config='/usr/lib/wx/config/gtk3-unicode-3.0'
)

# Old, non-maintained software. Use older C/C++ standard.
_C_std='gnu++14' # gnu11 # gnu17
_CXX_std='gnu++14' # gnu++11 # gnu++14 # gnu++17

# In case a newer C standard is used, warnings are generated which should not be treated as errors.
_append_to_CFLAGS_after_configure=' -Wno-error=format-security -Wno-error=register -Wno-error=deprecated-declarations -Wno-error=alloc-size-larger-than= -Wno-error=write-strings -Wno-error=return-local-addr -Wno-error=attributes' # Or just use -Wno-error to catch all.
_append_to_CXXFLAGS_after_configure="${_append_to_CFLAGS_after_configure}"

build() {
  cd "${srcdir}/wxPython-src-${pkgver}"

  CFLAGS+=" -std=${_C_std}"
  CXXFLAGS+=" -std=${_CXX_std}"
  export CFLAGS
  export CXXFLAGS

  ./configure "${_configure_opts[@]}"

  # msg2 "DEBUG: Spawning a shell."
  # bash

  CFLAGS+="${_append_to_CFLAGS_after_configure} -std=${_C_std}"
  CXXFLAGS+="${_append_to_CXXFLAGS_after_configure} -std=${_CXX_std}"
  export CFLAGS
  export CXXFLAGS

  cd wxPython
  python2 setup.py WX_CONFIG='/usr/lib/wx/config/gtk3-unicode-3.0' WXPORT=gtk3 UNICODE=1 build
}

package() {
  pkgdesc="Classic wxWidgets GTK3 GUI toolkit (legacy version 3.x) for Python2."
  depends=(
    'python2'
    'sdl'
    'wxwidgets3.0'
  )
  provides=(
    "python2-wxpython=${pkgver}"
    "python2-wxpython-gtk3=${pkgver}"
    "python2-wxpython3=${pkgver}"
    "wxpython=${pkgver}"
    "wxpython-gtk3=${pkgver}"
    "wxpython3=${pkgver}"
    "wxpython3-gtk3=${pkgver}"
  )
  conflicts=('wxpython')
  replaces=('wxpython')

  cd "${srcdir}/wxPython-src-${pkgver}/wxPython"

  python2 setup.py WX_CONFIG='/usr/lib/wx/config/gtk3-unicode-3.0-gtk3' WXPORT=gtk3 UNICODE=1 install --root="${pkgdir}" --optimize=1
  # Rename for python 2
  for file in "${pkgdir}/usr/bin"/*; do
    mv -v "${file}" "${file}2"
  done
  install -Dvm644 '../docs/licence.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
