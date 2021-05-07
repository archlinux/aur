# Maintainer: Aleksey V. Mikhaylov <gmikhalytch@gmail.com>
_pkgname="cue2tracks"
_pkgver_base="0.2.17"
_pkgver="${_pkgver_base}.afe350c"
pkgname="${_pkgname}-git"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Bash script for splitting audio CD image to tracks with cue sheet info"
url="https://github.com/ar-lex/cue2tracks"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
arch=('any')
depends=(
    'bash'
    'cuetools'
    'shntool'
    'file'
    'glibc'
    'flac'
)
makedepends=(
    'git'
)
optdepends=(
    'vorbis-tools: For OGG support'
    'flake: Alternative FLAC encoder'
    'mac: For APE support'
    'wavpack: For WavPack support'
    'optimfrog: For OptimFROG support'
    'shorten: For shorten support'
    'lame: For MP3 support'
    'musepack-tools: For MusePack support'
    'ttaenc: For True Audio Codec support'
    'faac: For AAC in M4A support'
    'faad2: For AAC in M4A support'
    'tak: For TAK support'
    'id3v2: For MP3 tagging support'
)
source=("${_pkgname}::git+https://github.com/ar-lex/cue2tracks.git")
md5sums=('SKIP')

pkgver() {
    # change dir to cloned upstream sources
  cd "${srcdir}/${_pkgname}"
    # first we need to check if the upstream still doesn't have tagged versions
  git_description_result="$(git describe --long --tags 2>/dev/null || true)"
  if [ x"${git_description_result}" != "x" ]; then
      # for upstreams with healthy tags (like Carla), there's whole version
    echo -n "${git_description_result}"
  else
      # even if there're no tags, the hash movement can provide some version dynamics
      # fallback to safer `git describe --always` call
    git_safe_description_result="$(git describe --long --tags --always 2>/dev/null || true)"
    if [ x"${git_safe_description_result}" != "x" ]; then
      echo -n "${_pkgver_base}.${git_safe_description_result}"
    else
        # last fallback - return const
      echo -n "${_pkgver}"
    fi
  fi
}

package() {
 cd "$srcdir"/"${_pkgname}"
 make install PREFIX="${pkgdir}/usr"
}
