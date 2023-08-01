# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: juanrubio

_pkgname='tizonia'
_githubname="${_pkgname}-openmax-il"
pkgname="${_pkgname}-all-git"
pkgver=0.22.0+28.r3903.20210110.a1e8f8bd
pkgrel=3
pkgdesc="Command-line cloud music player and downloader for Linux with support for YouTube, SoundCloud, Plex servers, Chromecast devices and generic streams and websites."
arch=(
  'x86_64'
)
url="https://www.tizonia.org"
license=('LGPL3')
depends=(
  # official repositories:
  'boost-libs'
  'faad2'
  'hicolor-icon-theme'
  'lame'
  'libcurl-gnutls'
  'libfishsound'
  'libmad'
  'liboggz'
  'libpulse'
  'libvpx'
  'mediainfo'
  'mpg123'
  'opusfile'
  'python-eventlet'
  'python-joblib' # Needed by 'usr/lib/python3.11/site-packages/tizyoutubeproxy.py', 'usr/lib/python3.11/site-packages/tiziheartproxy.py', 'usr/lib/python3.11/site-packages/tiztuneinproxy.py'.
  'python-levenshtein'
  'python>=3'
  'sdl'
  'sqlite'
  'taglib'
  'youtube-dl'

  # AUR:
  'log4c'
  'python-fuzzywuzzy'
  'python-gmusicapi' # [2023-07-31] Google Music service is dead, but `python-gmusicapi` is still needed by `/usr/lib/python3.11/site-packages/tizgmusicproxy.py`, see https://aur.archlinux.org/packages/tizonia-all-git#comment-927188 and follow up.
  'python-pafy'
  'python-plexapi'
  'python-pychromecast'
  'python-soundcloud'
  'python-spotipy'

)
makedepends=(
  # For retrieving the source code:
  'git'

  # For building the software:
  'boost'
  'check'
  'meson'
  'samurai'

  # For building the documentation:
  'doxygen'
  'python-breathe'
  'python-recommonmark'
  'python-sphinx-alabaster-theme'
)
optdepends=()
provides=(
  "${_pkgname}-all=${pkgver}"
  "${_pkgname}=${pkgver}"
  # "${_pkgname}-docs=${pkgver}"
  "${_pkgname}-bash-completions=${pkgver}"
  "${_pkgname}-zsh-completions=${pkgver}"
)
conflicts=(
  "${_pkgname}-all"
  "${_pkgname}"
  # "${_pkgname}-docs"
  "${_pkgname}-bash-completions"
  "${_pkgname}-zsh-completions"
)
options=()
source=(
  "${_pkgname}"::git+https://github.com/tizonia/${_githubname}.git
  "fix_chromecast_placeholders_error.patch::https://github.com/tizonia/tizonia-openmax-il/files/9795320/fix_chromecast_placeholders_error.patch.txt"
)
sha256sums=(
  'SKIP'
  '8b538221bb0bf0d068a8502fc3bd9e2d6cea1fc9311a32d93e5aec13db646eea'
)
if which ccache > /dev/null 2>&1; then
  makedepends+=('ccache')
  options+=('ccache')
  _USE_CCACHE=true
else
  _USE_CCACHE=false
fi

prepare() {
  if command -v tizonia > /dev/null 2>&1 || [ -n "`pacman -Qqs tizonia`" ]; then
    plain ''
    error "'tizonia' executable found in \$PATH."
    error "`pacman -Qqs tizonia | tr '\n' ' '` packages found installed."
    error "Please uninstall tizonia (packages are likely: 'tizonia', 'tizonia-all' or 'tizonia-all-git') before proceeding."
    error '(See https://github.com/tizonia/tizonia-openmax-il/issues/485.)'
    plain ''
    exit 1
  fi

  cp -a "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}.unpatched"

  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/fix_chromecast_placeholders_error.patch; do
    msg2 "Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  cp -a "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}.patched"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}"

  ## Silence warnings that are due to old codebase.
  _no_cc_warnings=(
    'address'
    'attribute-warning'
    'deprecated-declarations'
    'format-security'
    'strict-aliasing'
    'unused-result'
  )
  _CFLAGSAPPEND=''
  for _no_cc_warn in "${_no_cc_warnings[@]}"; do
    _CFLAGSAPPEND+=" -Wno-error=${_no_cc_warn} -Wno-${_no_cc_warn}"
  done
  _CFLAGSAPPEND+=' -DBOOST_BIND_GLOBAL_PLACEHOLDERS=1' # Work around warning message '/usr/include/boost/bind.hpp:36:1: note: ‘#pragma message: The practice of declaring the Bind placeholders (_1, _2, ...) in the global namespace is deprecated. Please use <boost/bind/bind.hpp> + using namespace boost::placeholders, or define BOOST_BIND_GLOBAL_PLACEHOLDERS to retain the current behavior.’'.
  CFLAGS+=" ${_CFLAGSAPPEND}"
  CXXFLAGS+=" ${_CFLAGSAPPEND}"
  export CFLAGS
  export CXXFLAGS

  # CC and CXX environment variables seem to be ignored.

  # Meson build options: See `meson_options.txt`.
  # * [2023-06-24] libspotify does no longer exist & also does no longer work, so disable it (`libspotify` would be the needed dependency), see https://aur.archlinux.org/packages/tizonia-all-git#comment-921052.
  # * [2023-07-31] Google Music service is dead, but `python-gmusicapi` is still needed by `/usr/lib/python3.11/site-packages/tizgmusicproxy.py`, see https://aur.archlinux.org/packages/tizonia-all-git#comment-927188 and follow up.
  # * [2023-08-01] Building tests fails with `clients/youtube/libtizyoutube/tests/check_tizyoutube.c:121:12: error: too few arguments to function ‘tiz_youtube_init’`, see https://github.com/tizonia/tizonia-openmax-il/issues/799.
  export SAMUFLAGS="-j1" # Eats a lot of ram.
  meson setup --prefix=/usr --buildtype=plain \
    -Dplayer=true \
    -Dlibspotify=false \
    -Dalsa=true \
    -Daac=true \
    -Dgcc-warnings=false \
    -Dtest=false \
    -Dbashcompletiondir=/etc/bash_completion.d \
    -Dzshcompletiondir=/usr/share/zsh/site-functions \
    -Ddocs=true \
    -Ddocs_options='["man"]' \
    -Ddocs_paper=a4 \
    -Dclients=true \
    -Dplugins='["aac_decoder","chromecast_renderer","file_reader","file_writer","flac_decoder","http_renderer","http_source","inproc_reader","inproc_writer","mp3_decoder","mp3_encoder","mp3_metadata","mp4_demuxer","mpeg_audio_decoder","ogg_demuxer","ogg_muxer","opus_decoder","opusfile_decoder","pcm_decoder","pcm_renderer_alsa","pcm_renderer_pa","spotify","vorbis_decoder","vp8_decoder","webm_demuxer","yuv_renderer"]' \
    "${_pkgname}" build
  samu -v -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" samu -C build install

  cd "${srcdir}/${_pkgname}"

  for _docfile in git.log BUILDING.md BUILDING_with_meson.md CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md ISSUE_TEMPLATE.md PROJECT.md README.md ROADMAP.md; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _licensefile in COPYING.LESSER COPYING.LESSER.md; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
