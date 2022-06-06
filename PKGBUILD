# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: beest <gnubeest at zoho dot com>
# Contributor: c0mmando <c0mmand0_88 at yahoo dot com dot ar>
# Contributor: Farhan Yousasf <farhany at gmail dot com>
# Contributor: Vinzenz Vietzke <vinz at archlinux dot us>

set -u
pkgname='atari800'
#pkgname+='-git'
pkgver=5.0.0
pkgrel=1
pkgdesc='An emulator of the Atari 800/800XL/130XE/5200 with various extensions'
arch=('i686' 'x86_64')
arch+=('aarch64') # Idorobots
#url='https://atari800.sourceforge.net/'
url='https://atari800.github.io/'
_giturl='https://github.com/atari800/atari800'
license=('GPL2')
depends=('sdl')
optdepends=('libpng: PNG screenshot support')
options=('!strip')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
_srcf="${_srcdir^^}"
_srcf="${_srcf//./_}"
_srcf="${_srcf//-/_}"
source=(
  "${_giturl}/releases/download/${_srcf}/${_srcdir}-src.tgz"
  'atari.sh'
  'atari800.desktop'
)
if ! :; then
  source[0]="${_giturl}/archive/refs/tags/${_srcf}.tar.gz"
  _srcdir="${pkgname%-git}-${_srcf}"
fi
unset _srcf
md5sums=('f5dc10d461d0241a5978a0998028e49a'
         '4f6ae0290954e7132c705c9f9fc37dd2'
         '82d425a60aa04f7596ffe0d3cf3dfd92')
sha256sums=('eaa2df7b76646f1e49d5e564391707e5a4b56d961810cff6bc7c809bfa774605'
            '832fcb80e3eb02e7d5d8d50512e82c28aef9110e4f764f288b12228e99c13f42'
            '95e03020358a0855e12ee19b62abebb336e472fcf525f7eb42dcc28419588df9')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${_giturl}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  set -u
  cd "${_srcdir}"
  local _ver="$(git describe --tags --long)"
  _ver="${_ver#ATARI800_}"
  _ver="${_ver/-/-r}"
  _ver="${_ver//_/.}"
  _ver="${_ver//-/.}"
  printf '%s' "${_ver}"
  set +u
}
else
  if [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${pkgver%.r*}"
}
  fi
fi

build() {
  set -u
  cd "${_srcdir}"
  if [ -s 'src/autogen.sh' ]; then
    cd 'src'
  fi
  if [ ! -s 'configure' ]; then
    sh -e -u 'autogen.sh'
  fi
  if [ ! -s 'Makefile' ]; then
    local _copts=(
      --prefix='/usr'
      #--enable-riodevice        # The R: Network device, enabled as of 4.2
      #--enable-seriosound       # SIO Sound for true retro feeling
      #--enable-onscreenkeyboard # OnScreen Keyboard
      --enable-linuxjoystick
    )
    ./configure "${_copts[@]}"
  fi
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ -s 'src/autogen.sh' ]; then
    cd 'src'
  fi
  make DESTDIR="${pkgdir}/" install
  install -Dm755 "${srcdir}/atari800.desktop" "${pkgdir}/usr/share/applications/atari800.desktop"
  install -Dm755 'data/atari2.png' "${pkgdir}/usr/share/pixmaps/atari800.png"
  set +u
  msg2 "\e[1;32mThis package has some options you might interested in. Have a look at _copts[@] in PKGBUILD.\e[0m"
}
set +u
