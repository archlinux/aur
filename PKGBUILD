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
epoch=2
pkgver=34.2.0
# Commit ID can be found at https://repo.palemoon.org/MoonchildProductions/Pale-Moon/tags
_commit=a1043b6a581b2e9b12b34159c26dcf198058d525
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="https://www.palemoon.org/"
license=('MPL-2.0')
provides=('palemoon')
conflicts=('palemoon')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib')
makedepends=('python2' 'unzip' 'zip' 'yasm' 'libpulse' 'git')
optdepends=('libpulse: PulseAudio audio driver'
            'ffmpeg: various video and audio support'
	    'gtk2: Required for NPAPI plugins')
source=(git+"https://repo.palemoon.org/MoonchildProductions/${_repo}?signed#commit=${_commit}"
        git+"https://repo.palemoon.org/MoonchildProductions/UXP"
        mozconfig.in)
validpgpkeys=('3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC')
sha1sums=('8a287fd50942645a557e7cf054dc065a43cc807e'
          'SKIP'
          '0cc72ae4909479d031508146d037a3daffb0bbe7')
sha256sums=('1b7b96ab385f7eb23a41ffb0247f010b1601006dbe4bbd3e03d4760d25145c9f'
            'SKIP'
            '3562dcaeb658475bb35e9f90d96a40c45417c2c7d0c63623449e95e3c1dbfaa8')

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
