# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus
# Contributor: Mufflone
# Contributor: switchnode
pkgname=palemoon-gtk3
_pkgname=palemoon
_repo=Pale-Moon
epoch=1
pkgver=34.1.0
# Commit ID can be found at https://repo.palemoon.org/MoonchildProductions/Pale-Moon/tags
_commit=c76e36ebf51ec201f74228384f2bc6ea6cf24f6f
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="https://www.palemoon.org/"
license=('MPL-2.0')
provides=('palemoon')
conflicts=('palemoon')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib')
makedepends=('python2' 'unzip' 'zip' 'yasm' 'libpulse' 'git' 'gtk3')
optdepends=('libpulse: PulseAudio audio driver'
            'ffmpeg: various video and audio support'
	    'gtk2: Required for NPAPI plugins')
source=(git+"https://repo.palemoon.org/MoonchildProductions/${_repo}?signed#commit=${_commit}"
        git+"https://repo.palemoon.org/MoonchildProductions/UXP"
        mozconfig.in)
validpgpkeys=('3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC')
sha1sums=('40518e7956bf17c7301d6696387e135aaeb0d35b'
          'SKIP'
          'c44cbce39eac59a84757456676891a398c8d7508')
sha256sums=('928ee152404ffa712c9f5a5fd7a473297fcf470128b89e449c6f53e917b199a3'
            'SKIP'
            '97c11dd56388c7359fc1f7d6ad32bc68faaf00a634f6724a4562a3707eff3ca7')

prepare() {
  sed 's#%SRCDIR%#'"${srcdir}"'#g' mozconfig.in > mozconfig
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
