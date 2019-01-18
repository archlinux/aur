# $Id$
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

# Remember to sdlmame --newini after downgrading

# Shouldn't we have a .desktop file?

set -u
pkgname='sdlmame-0137'
pkgver='0.137u2'
pkgrel='1'
pkgdesc='A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support.'
arch=('i686' 'x86_64')
url='http://mamedev.org/'
license=('custom:MAME License')
depends=('sdl>=1.2.11' 'libxinerama' 'gconf')
_gcver='4.5'
makedepends=('unzip' 'nasm' 'mesa' "gcc${_gcver/./}")
provides=("${pkgname%%-*}=${pkgver}")
conflicts=("${pkgname%%-*}")
options=('!strip')
install='sdlmame.install'
source=(
  "https://github.com/mamedev/mame/releases/download/mame${pkgver//./}/mame${pkgver//./}s.zip"
  'sdlmame.sh'
  'extras.tar.gz'
)
if [ "${pkgver/u//}" != "${pkgver}" ]; then
  source[0]="https://github.com/mamedev/mame/archive/mame${pkgver//./}.zip"
  _unzip=0
else
  _unzip=1
fi
noextract=('extras.tar.gz')
_srcdir="mame-mame${pkgver//./}"
sha256sums=('647ce4c846918d7ade7f62aca1e8f5f1aeebecfd1dafa79c2b206a378d8fc615'
            '36efc2fb5981f7595a631e9d399af853a42ec62ce0146a1820d92be224d6a20f'
            '5ba55ce8c33743207a12a7509efdf13dd98f5d87fa12f0e471ea523d3ae4f4ac')

prepare() {
  set -u
  if [ "${_unzip}" -ne 0 ]; then
    unzip -oaq -d "${_srcdir}" 'mame.zip'
  fi
  cd "${_srcdir}"
  bsdtar -xf "${srcdir}/extras.tar.gz"
  #find . -type 'f' -not -name '*.png' | xargs perl -pi -e 's/\r\n?/\n/g'
  #find . -type 'f' -not -name 'uismall.png' | xargs perl -pi -e 's/\r\n?/\n/g'
  sed -e 's/-Werror//' \
      -e '#s/LDFLAGS = -Wl,--warn-common/LDFLAGS = -Wl,--warn-common -Wl,-zmuldefs/' \
    -i 'makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  # Modify the make options based on the user's architecture
  case "${CARCH}" in
  'x86_64')
    echo 'Compiling for AMD64...'
    nice make -j "${_nproc}" AMD64=1 PTR64=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    make tools AMD64=1 PTR64=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    ;;
  'i686')
    echo 'Compiling for i686...'
    nice make -j "${_nproc}" I686=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    make tools I686=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    ;;
  *)
    echo 'Compiling for i386...'
    nice make -j "${_nproc}" PM=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    make tools PM=1 CC="gcc-${_gcver}" LD="g++-${_gcver}"
    ;;
  esac
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  # Install the sdlmame script
  install -Dpm755 "${srcdir}/${pkgname%-*}.sh" "${pkgdir}/usr/bin/${pkgname%-*}"

  # Install the applications and the UI font in /usr/share
  install -Dpm755 'mame' "${pkgdir}/usr/share/${pkgname%-*}/${pkgname%-*}" || \
  install -Dpm755 'mame64' "${pkgdir}/usr/share/${pkgname%-*}/${pkgname%-*}"

  install -Dpm755 {'chdman','jedutil','regrep','romcmp','testkeys','src2html','srcclean','ldverify','ldresample'} -t "${pkgdir}/usr/share/${pkgname%-*}/"

#  install -Dpm755 {makemeta,runtest} -t "${pkgdir}/usr/share/${pkgname%-*}/"
#  install -Dpm644 'ui.bdf' -t "${pkgdir}/usr/share/${pkgname%-*}/"

  # Install the extra bits
  install -Dpm644 artwork/* -t "${pkgdir}/usr/share/${pkgname%-*}/artwork/"
  install -Dpm644 ctrlr/* -t "${pkgdir}/usr/share/${pkgname%-*}/ctrlr/"
  install -Dpm644 src/osd/sdl/keymaps/* -t "${pkgdir}/usr/share/${pkgname%-*}/keymaps/"

  # Include the license
  install -Dpm644 'docs/license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname%-*}/license.txt"

  find "${pkgdir}" -type 'f' -exec strip '{}' ';'
  set +u
}
set +u
