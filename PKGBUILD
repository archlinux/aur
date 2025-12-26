# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-ncnn-runtime
pkgver=v15.14
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (Vulkan ncnn runtime)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('GPL-3.0')
depends=('vapoursynth' 'protobuf' 'onnx' 'ncnn')
makedepends=()
optdepends=()
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")

# Why do I have to host this artifact (original source: https://github.com/AmusementClub/vs-mlrt/actions/runs/19187416567)
# on a separate server? Because:
# - We can't build the library from source without using custom versions of onnx and shit.
# - The maintainers of vs-mlrt only publish Windows binaries to their release tags, not Linux ones.
# - Apparently Github does not let you download Actions artifacts without being logged in.
# The last one of those being particularly stupid. It's a public artifact but you can't download it without a Github account.
# ANY Github account, even if it's not associated with AmusementClub.
# /rant
source=(
  "vsncnn-linux-x64.zip::https://files.bluefalcon.cc/vsncnn-linux-x64-v15.14.zip"
  "scripts.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/v15.14/scripts.v15.14.7z"
  "models.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/v15.14/models.v15.14.7z"
)
sha256sums=(
  '4bffbd7451a963ae68c6e4e59ea312baa16bb4d24019a4aac688f12df2c7d11a'
  '19c6f89d2e34c714479b069290b1bae17e91ab3048f298264b8ab57cf0871849'
  '08cd1361cf3cb68cec8db6c6ac58d69347e5bcfc039db3f8136cffb3940c36b0'
)

package() {
  # The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
  install -Dm755 "libvsncnn.so" "${pkgdir}/usr/lib/vapoursynth/libvsncnn.so"
  for i in $(find models* -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/${i}"; done

  _sitedir=$(python -c 'import site; print(site.getsitepackages())')
  # remove first two and last two characters, which are array and string delimiters
  _sitedir="${_sitedir#?}"
  _sitedir="${_sitedir#?}"
  _sitedir="${_sitedir%?}"
  _sitedir="${_sitedir%?}"
  install -Dm644 "vsmlrt.py" "${pkgdir}${_sitedir}/vsmlrt.py"
}
