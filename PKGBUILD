# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus
pkgname=palemoon-gtk3
_pkgname=palemoon
_repo=Pale-Moon
epoch=1
pkgver=32.5.2
# Commit can be found at https://repo.palemoon.org/MoonchildProductions/Pale-Moon/tags
_commit=ae12e17cd3
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="https://www.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
provides=('palemoon')
conflicts=('palemoon')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib'
         'startup-notification')
makedepends=('python2' 'autoconf2.13' 'unzip' 'zip' 'yasm'
             'libpulse' 'gtk2' 'git')
optdepends=('libpulse: PulseAudio audio driver'
            'ffmpeg: various video and audio support')
source=(git+"https://repo.palemoon.org/MoonchildProductions/${_repo}?signed#commit=${_commit}"
        git+"https://repo.palemoon.org/MoonchildProductions/UXP"
        mozconfig.in
        "patch::https://git.videolan.org/?p=ffmpeg.git;a=patch;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb")
validpgpkeys=('3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC'
              '3059E09144F56804F0FBF4E126B40624BDBFD9F3')
sha1sums=('SKIP'
          'SKIP'
          'bc6bfbbe499ff8b2c846208ac6627c52d021201a'
          '0202b18ac4afb56d3a3e5033a9872cdc3e13b422')

prepare() {
  sed 's#%SRCDIR%#'"${srcdir}"'#g' mozconfig.in > mozconfig
  cd ${_repo}
  git submodule init
  git config submodule.platform.url "${srcdir}/UXP"
  git submodule--helper update
  cd platform/media/ffvpx
  patch -p1 -i "${srcdir}"/patch
}

build() {
  cd ${_repo}
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZCONFIG="${srcdir}/mozconfig"
  export CPPFLAGS="${CPPFLAGS} -O2 -Wno-format-overflow"
  ./mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "${pkgdir}"/usr/{bin,lib}
  cp -r palemoon/ "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "../lib/${_pkgname}/palemoon" "${pkgdir}/usr/bin/palemoon"

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
