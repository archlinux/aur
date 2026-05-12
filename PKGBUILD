# Maintainer: Zebar2711 <zebra2711t@gmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus
# Contributor: Mufflone
# Contributor: switchnode

### Enable NPAPI plugins
: "${_npapi:=""}"

pkgname=palemoon-gtk3
_pkgname=palemoon
_repo=Pale-Moon
epoch=1
pkgver=34.2.2
# Commit ID can be found at https://repo.palemoon.org/MoonchildProductions/Pale-Moon/tags
_commit=9210d7e558
pkgrel=2
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="https://www.palemoon.org/"
license=('MPL-2.0')
provides=('palemoon')
conflicts=('palemoon')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib')
makedepends=('python' 'unzip' 'zip' 'yasm' 'libpulse' 'git')
optdepends=('libpulse: PulseAudio audio driver'
            'ffmpeg: various video and audio support'
	          'gtk2: Required for NPAPI plugins')
source=(git+"https://repo.palemoon.org/MoonchildProductions/${_repo}?signed#commit=${_commit}"
        git+"https://repo.palemoon.org/MoonchildProductions/UXP"
        mozconfig.in)
validpgpkeys=('3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC')
sha1sums=('704546936d9b90b96294008357913cc8915f4195'
          'SKIP'
          '1b8d0a61a6239f05a0b33e19b51429ca4933fa52')
sha256sums=('59b061b1bf2874ee8164775bae2931ec2c324fa9602ff206dac4b8dfd012a5c2'
            'SKIP'
            '8b7740ae6cf141d959029acf15cc4cd7a67e4b1679871d8812454655a0ef0361')

if [ "$_npapi" = "yes" ]; then
  makedepends+=('gtk2')
fi

prepare() {
  sed 's#%SRCDIR%#'"${srcdir}"'#g' mozconfig.in > mozconfig
  if [ "$_npapi" != "yes" ]; then
    cat >> "$srcdir/mozconfig" <<EOF
ac_add_options --disable-npapi
EOF
  fi
  cd ${_repo}
  git submodule init
  git config submodule.platform.url "${srcdir}/UXP"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_repo}

  # Remove option not supported by ld.gold to prevent configure failure
  export LDFLAGS="${LDFLAGS/-Wl,-z,pack-relative-relocs/}"
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZCONFIG="${srcdir}/mozconfig"
  export CPPFLAGS="${CPPFLAGS} -O2"

  ./mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "${pkgdir}"/usr/{bin,lib}
  cp -r palemoon/ "${pkgdir}/usr/lib/${_pkgname}"
  cat > "${pkgdir}/usr/bin/palemoon" << EOF
#!/bin/bash

# Override system env to avoid that unable to open app
# SIGSEGV bug detail:
# gdk_x11_window_get_xid:
# assertion 'GDK_IS_X11_WINDOW (window)' failed
export GDK_BACKEND=x11

exec /lib/palemoon/palemoon "\${@}"
EOF
  chmod +x "${pkgdir}/usr/bin/palemoon"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  # install desktop file
  install -Dm644 "${srcdir}/${_repo}/palemoon/branding/official/palemoon.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
