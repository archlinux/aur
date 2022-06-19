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
pkgver=0.34.0_345_g44ecf83a1b
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2 (git version)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
url='https://mpv.io'
_undetected_depends=('hicolor-icon-theme')
depends=('ffmpeg' "${_undetected_depends[@]}")
optdepends=('yt-dlp: for video-sharing websites playback (preferred over youtube-dl)'
            'youtube-dl: for video-sharing websites playback')
makedepends=('git'
             'meson'
             'python-docutils' # for rst2man, to generate manpage
             'pacman-contrib' # for pactree, used in find-deps.py
             'vulkan-headers')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/mpv-player/mpv'
        'find-deps.py')
sha256sums=('SKIP'
            '1ba780ede4a28b68ae5b7ab839958ff91ed01d3c6c1d24cce8a5dd24492f8d2b')

_opt_extra_flags=()

for feature in "${_opt_features[@]}"; do
  case "$feature" in
    dvd)
      depends+=('libdvdnav')
      _opt_extra_flags+=('-Ddvdnav=enabled')
      ;;
    cd)
      depends+=('libcdio-paranoia')
      _opt_extra_flags+=('-Dcdda=enabled')
      ;;
    lua)
      depends+=('lua52')
      _opt_extra_flags+=('-Dlua=enabled' '-Dlua=lua52')
      ;;
    luajit)
      depends+=('luajit')
      _opt_extra_flags+=('-Dlua=enabled' '-Dlua=luajit')
      ;;
    javascript)
      depends+=('mujs')
      _opt_extra_flags+=('-Djavascript=enabled')
      ;;
    x11)
      depends+=('libxinerama' 'libxpresent' 'libxss')
      _opt_extra_flags+=('-Dx11=enabled')
      ;;
    wayland)
      depends+=('wayland' 'libxkbcommon')
      _opt_extra_flags+=('-Dwayland=enabled')
      ;;
    sdl2|openal|uchardet|rubberband)
      depends+=("$feature")
      _opt_extra_flags+=("-D${feature}=enabled")
      ;;
    dvbin)
      _opt_extra_flags+=("-D${feature}=enabled")
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

build() {
  cd "$srcdir/$_gitname"

  # Removing build dir, if present, ensures features omitted from the configure
  # command get their default values, and cleans up after waf if it was
  # previously used (which can cause the build to fail otherwise).
  # Downside is wasted recompilation.
  rm -rf build

  meson setup build \
        --prefix=/usr \
        --sysconfdir=/etc \
        --buildtype=plain \
        --wrap-mode=nodownload \
        -Dlibmpv=true \
        "${_opt_extra_flags[@]}"

  meson compile -C build
}

package() {
  cd "$srcdir/$_gitname"
  meson install -C build --no-rebuild --destdir="$pkgdir"

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($(python3 "$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
