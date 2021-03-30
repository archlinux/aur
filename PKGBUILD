# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eugen Zagorodniy e dot zagorodniy at gmail dot com
# Contributor: aunoor

pkgname=notion3
pkgver=20190501
pkgrel=2
_commit=5e820d514837e12b8753a1afe9b5dd1033f449da
_commit_doc=4875ffc1c4f8ba1d7ebe77fc3aceacc872e74c07
pkgdesc="Tabbed tiling, window manager. Fork of Ion3"
url="https://notionwm.net"
arch=('x86_64' 'pentium4' 'i686' 'i486' 'armv6h' 'armv7h' 'aarch64')
license=('custom:LGPL')
depends=('glib2' 'gettext' 'lua' 'libxext' 'libsm' 'freetype2')
optdepends=('libxinerama' 'libxrandr')
makedepends=('git' 'pkgconfig' 'libxinerama' 'libxrandr'
	     'rubber' 'latex2html' 'texlive-htmlxml' 'texlive-latexextra')
conflicts=('notion')
backup=("etc/notion/cfg_bindings.lua"
	"etc/notion/cfg_dock.lua"
	"etc/notion/cfg_kludges.lua"
	"etc/notion/cfg_layouts.lua"
	"etc/notion/cfg_menu.lua"
	"etc/notion/cfg_notion.lua"
	"etc/notion/cfg_notioncore.lua"
	"etc/notion/cfg_query.lua"
	"etc/notion/cfg_sp.lua"
	"etc/notion/cfg_statusbar.lua"
	"etc/notion/cfg_tiling.lua"
	"etc/notion/cfg_xrandr.lua"
	"etc/notion/look.lua"
	"etc/notion/look_brownsteel.lua"
	"etc/notion/look_clean.lua"
	"etc/notion/look_cleanios.lua"
	"etc/notion/look_cleanviolet.lua"
	"etc/notion/look_dusky.lua"
	"etc/notion/look_greenlight.lua"
	"etc/notion/look_greyviolet.lua"
	"etc/notion/look_ios.lua"
	"etc/notion/look_newviolet.lua"
	"etc/notion/look_simpleblue.lua"
	"etc/notion/lookcommon_clean.lua"
	"etc/notion/lookcommon_emboss.lua"
	"etc/notion/mod_xinerama.lua"
	"etc/notion/statusbar_xkbgroup.lua"
	"etc/notion/test_xinerama.lua"
	"etc/notion/xkbbell.lua"
	"etc/notion/xkbion.lua")
provides=('libtu' 'libextl')
changelog=ChangleLog
source=("notion::git://github.com/raboof/notion#commit=${_commit}"
	"notion-doc::git://github.com/raboof/notion-doc.git#commit=${_commit_doc}")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir"
  cat >notion/build/lua-detect.mk <<EOF
LUA_VERSION := 5.3
LUA_LIBS     := $(pkg-config --libs lua)
LUA_INCLUDES := $(pkg-config --cflags lua)
LUA          := $(which lua)
LUAC         := $(which luac)
EOF
  sed -i '/Skipping dvi and ps because/d' notion-doc/Makefile
}

build() {
  cd "$srcdir"/notion
  make INCLUDES="-I$srcdir/notion -I/usr/include/freetype2" LUA_VERSION=5.3 PREFIX=/usr ETCDIR=/etc/notion

  cd "$srcdir"/notion-doc
  make all-html all-html-onepage
}

package() {
  cd "$srcdir"/notion
  make DESTDIR="$pkgdir" LUA_VERSION=5.3 PREFIX=/usr ETCDIR=/etc/notion install

  # doc
  cd "$srcdir"/notion-doc
  make PREFIX="$pkgdir"/usr ETCDIR=/etc/notion install

  # modules
  cp "$srcdir"/notion/mod_xinerama/*.lua "$pkgdir"/etc/notion/
  cp "$srcdir"/notion/mod_xkbevents/*.lua "$pkgdir"/etc/notion/

  # contrib
  mkdir -p "$pkgdir"/usr/share/notion/contrib
  cp -a "$srcdir"/notion/contrib/* "$pkgdir"/usr/share/notion/contrib

  # license
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/notion/LICENSE

  #
  mkdir -p "$pkgdir"/usr/share/xsessions
  cat >"$pkgdir"/usr/share/xsessions/notion.desktop <<EOF
[Desktop Entry]
Name=Notion
Comment=This session logs you into Notion
Exec=/usr/bin/notion
TryExec=/usr/bin/notion
Icon=
Type=XSession
EOF
}
