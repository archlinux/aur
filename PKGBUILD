# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: juanrubio

_githubname=tizonia-openmax-il
pkgname=tizonia-all-git
pkgver=0.22.0+28.r3903.20210110.a1e8f8bd
pkgrel=1
pkgdesc="Command-line cloud music player for Linux with support for Spotify, Google Play Music, YouTube, SoundCloud, Plex servers and Chromecast devices."
arch=('x86_64')
url="https://www.tizonia.org"
license=('LGPL')
makedepends=('git' 'boost' 'check' 'meson' 'samurai')
depends=(
    # official repositories:
    'libmad'
    'taglib'
    'mediainfo'
    'sdl'
    'sqlite'
    'lame'
    'faad2'
    'libcurl-gnutls'
    'libvpx'
    'mpg123'
    'opusfile'
    'libfishsound'
    'liboggz'
    'youtube-dl'
    'libpulse'
    'boost-libs'
    'hicolor-icon-theme'
    'python-eventlet'
    'python-levenshtein'

    # AUR:
    'log4c'
    'python-pafy'
    'python-gmusicapi'
    'python-soundcloud'
    'python-pychromecast'
    'python-plexapi'
    'python-fuzzywuzzy'
    'python-spotipy'
)
provides=(
  "tizonia-all=${pkgver}"
  "tizonia=${pkgver}"
)
conflicts=(
  'tizonia-all'
  'tizonia'
)
options=()
source=(
  "${pkgname}"::git+https://github.com/tizonia/${_githubname}.git
  "fix_chromecast_placeholders_error.patch::https://github.com/tizonia/tizonia-openmax-il/files/9795320/fix_chromecast_placeholders_error.patch.txt"
)
sha256sums=(
  'SKIP'
  '8b538221bb0bf0d068a8502fc3bd9e2d6cea1fc9311a32d93e5aec13db646eea'
)

prepare() {
  if command -v tizonia > /dev/null 2>&1; then
    plain ''
    error "Please uninstall tizonia, tizonia-all or tizonia-all-git before proceeding."
    error "See https://github.com/tizonia/tizonia-openmax-il/issues/485."
    plain ''
    exit 1
  fi

  cd "$pkgname"

  for _patch in "${srcdir}/fix_chromecast_placeholders_error.patch"; do
    msg2 "Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

pkgver() {
  cd "$pkgname"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  #export CFLAGS='-O2 -s -DNDEBUG'
  #export CXXFLAGS='-O2 -s -DNDEBUG -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security'
  #export CC=gcc-9
  #export CXX=c++-9
  # libspotify does no longer exist & also does no longer work, so disable it.
  export SAMUFLAGS="-j1" # Eats a lot of ram.
  meson setup --prefix=/usr --buildtype=plain -Dlibspotify=false "${pkgname}" build
  samu -v -C build
}

package() {
  DESTDIR=$pkgdir samu -C build install
}
