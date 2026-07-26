# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: beest <gnubeest at zoho dot com>
# Contributor: c0mmando <c0mmand0_88 at yahoo dot com dot ar>
# Contributor: Farhan Yousasf <farhany at gmail dot com>
# Contributor: Vinzenz Vietzke <vinz at archlinux dot us>

set -u
pkgname='atari800'
#pkgname+='-git'
pkgver=7.1.1
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
md5sums=('c8659eff057d8e2ab3f32d49d312dc8b'
         '6cb048df098263556dd7529d22e83f05'
         '82d425a60aa04f7596ffe0d3cf3dfd92')
sha256sums=('9a7d1435649982af0022ad77f565d408a18caaee40613cdcd1b8f96c3f646320'
            'cc88a1b8e91d248e575e42410c2c6eb05bdff28f883f2990a4362565df1b8ccf'
            '95e03020358a0855e12ee19b62abebb336e472fcf525f7eb42dcc28419588df9')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${_giturl}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  local -; set -u
  cd "${_srcdir}"
  local _ver="$(git describe --tags --long)"
  _ver="${_ver#ATARI800_}"
  _ver="${_ver/-/-r}"
  _ver="${_ver//_/.}"
  _ver="${_ver//-/.}"
  printf '%s' "${_ver}"
}
else
  if [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${pkgver%.r*}"
}
  fi
fi

build() {
  local -; set -u
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
}

package() {
  local -; set -u
  cd "${_srcdir}"
  if [ -s 'src/autogen.sh' ]; then
    cd 'src'
  fi
  make DESTDIR="${pkgdir}/" install
  install -Dm755 "${srcdir}/atari800.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm755 'data/atari2.png' "${pkgdir}/usr/share/pixmaps/atari800.png"
  set +u
  msg2 "\e[1;32mThis package has some options you might interested in. Have a look at _copts[@] in PKGBUILD.\e[0m"
}
set +u
