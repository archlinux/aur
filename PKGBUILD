# Contributor: A. Fluteaux <sigma_g@melix.net>
# Contributor: Elmo Tudurov <tudurov+arch@gmail.com>
# Contributor: strata <strata@dropswitch.net>
pkgname=mudlet-git
pkgver=20150130
pkgrel=2
pkgdesc="Mudlet git development branch - is a quality MUD client, designed to take mudding to a new level."
arch=('i686' 'x86_64')
url="http://www.mudlet.org/"
license=('GPL2')
depends=('glu' 'hunspell' 'libzip' 'lua51' 'lua51-filesystem'
         'lua51-sql-sqlite' 'luazip5.1' 'lrexlib-pcre5.1'
         'qt5-base' 'qt5-multimedia' 'yajl')
makedepends=('boost' 'git' 'qt5-tools')

_gitroot="git://github.com/Mudlet/Mudlet"
_gitname="mudlet"
_gitbranch="development"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone -b "${_gitbranch}" "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone -b "${_gitbranch}" "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build" 
  cd "${srcdir}/${_gitname}-build/src"

  _gitsha=$(git show-branch --sha1-name | cut -b2-8)
  sed -i "s,BUILD = -dev,BUILD = -${_gitsha}-dev," src.pro

  sed -i 's,QString path = "../src/mudlet-lua/lua/LuaGlobal.lua";,QString path = "/usr/share/mudlet/lua/LuaGlobal.lua";,' TLuaInterpreter.cpp
  sed -i 's;"mudlet-lua/lua"};"mudlet-lua/lua",\n    "/usr/share/mudlet/lua/" };' mudlet-lua/lua/LuaGlobal.lua

  sed -i 's/settings("Mudlet", "Mudlet 1.0");/settings("mudlet", "mudlet");/' dlgTriggerEditor.cpp
  sed -i 's/settings("Mudlet", "Mudlet 1.0");/settings("mudlet", "mudlet");/' mudlet.cpp

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build/src"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/mudlet/lua/geyser"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  install -m 755 mudlet "${pkgdir}/usr/bin/mudlet" || return 1
  install -m 644 mudlet-lua/lua/*.lua "${pkgdir}/usr/share/mudlet/lua" || return 1
  install -m 644 mudlet-lua/lua/geyser/*.lua "${pkgdir}/usr/share/mudlet/lua/geyser" || return 1
  install -m 644 ../mudlet.desktop "${pkgdir}/usr/share/applications" || return 1
  install -m 644 ../mudlet.png "${pkgdir}/usr/share/pixmaps" || return 1
  install -m 644 ../mudlet.svg "${pkgdir}/usr/share/pixmaps" || return 1
}

# vim:set ts=2 sw=2 et:
