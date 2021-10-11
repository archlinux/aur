# Maintainer:  Philip Sequeira <phsequei@gmail.com>
# Contributor: Rudolf Polzer <divVerent@xonotic.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_opt_features=(

  # Disabled by default, need to be enabled every build:

  #dvd
  #cd
  #sdl2
  #openal

  # Lua is automatically detected, so you don't need to enable these if you
  # already have it installed. If you have both lua52 and luajit installed, mpv
  # will use the former. Uncommenting luajit below will tell mpv to use that
  # even if lua52 is also installed.

  #lua
  #luajit

  # The rest of these are autodetected, and are just provided to set
  # dependencies the first time you build. If you have the dependencies
  # installed, subsequent builds will pick them up automatically.

  #javascript

  #x11
  #wayland

  #uchardet
  #rubberband

  # Features disabled by default, but don't require any extra dependencies on an
  # Arch system:

  dvbin

)

# Note: The configure script will automatically enable most optional features it
# finds support for on your system. The dependencies of the built package will
# be updated based on dynamic libraries, but if you want to avoid linking
# against something you have installed, you'll have to disable it in the
# configure below.

pkgname=mpv-git
_gitname=mpv
pkgver=0.33.0_360_gb3f3c3fec0
pkgrel=1
_waf_version=2.0.20
pkgdesc='Video player based on MPlayer/mplayer2 (git version)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
url='https://mpv.io'
_undetected_depends=('hicolor-icon-theme')
depends=('ffmpeg' "${_undetected_depends[@]}")
optdepends=('youtube-dl: for --ytdl')
makedepends=('git' 'python-docutils' 'pacman-contrib' 'vulkan-headers')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/mpv-player/mpv'
        'find-deps.py'
        "https://waf.io/waf-${_waf_version}")
sha256sums=('SKIP'
            '1ba780ede4a28b68ae5b7ab839958ff91ed01d3c6c1d24cce8a5dd24492f8d2b'
            'bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f')

_opt_extra_flags=()

for feature in "${_opt_features[@]}"; do
  case "$feature" in
    dvd)
      depends+=('libdvdnav')
      _opt_extra_flags+=('--enable-dvdnav')
      ;;
    cd)
      depends+=('libcdio-paranoia')
      _opt_extra_flags+=('--enable-cdda')
      ;;
    lua)
      depends+=('lua52')
      _opt_extra_flags+=('--enable-lua' '--lua=lua52')
      ;;
    luajit)
      depends+=('luajit')
      _opt_extra_flags+=('--enable-lua' '--lua=luajit')
      ;;
    javascript)
      depends+=('mujs')
      _opt_extra_flags+=('--enable-javascript')
      ;;
    x11)
      depends+=('libxinerama' 'libxrandr' 'libxss')
      _opt_extra_flags+=('--enable-x11')
      ;;
    wayland)
      depends+=('wayland' 'libxkbcommon')
      _opt_extra_flags+=('--enable-wayland')
      ;;
    sdl2|openal|uchardet|rubberband)
      depends+=("$feature")
      _opt_extra_flags+=("--enable-$feature")
      ;;
    dvbin)
      _opt_extra_flags+=("--enable-$feature")
      ;;
    *)
      echo "ERROR: Unknown feature option: $feature" >&2
      exit 1
  esac
done

pkgver() {
  cd "$srcdir/$_gitname"
  ./version.sh | sed s/-/_/g
}

prepare() {
  cd "$srcdir/$_gitname"
  install -m755 "${srcdir}/waf-${_waf_version}" waf
  ./bootstrap.py --no-download
}

build() {
  cd "$srcdir/$_gitname"

  ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --enable-libmpv-shared \
        "${_opt_extra_flags[@]}"

  ./waf build
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="$pkgdir"

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($(python3 "$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
