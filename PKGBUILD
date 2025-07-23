# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-ncnn-runtime
pkgver=v15.12
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

# Why do I have to host this artifact (original source: https://github.com/AmusementClub/vs-mlrt/actions/runs/15625227862/artifacts/3319440768)
# on a separate server? Because:
# - We can't build the library from source without using custom versions of onnx and shit.
# - The maintainers of vs-mlrt only publish *Windows* binaries to their release tags, not Linux ones.
# - Apparently Github does not let you download Actions artifacts without being logged in.
# The last one of those being particularly stupid. It's a public artifact but you can't download it without a Github account.
# ANY Github account, even if it's not associated with AmusementClub.
# /rant
source=(
  "vsncnn-linux-x64.zip::https://files.bluefalcon.cc/vsncnn-linux-x64.zip"
  "scripts.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/v15.12/scripts.v15.12.7z"
  "models.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/v15.12/models.v15.12.7z"
)
sha256sums=(
  'edd4fa27b877f3b2e4dcbc57a758de89829bd44b60ff5f451c8ecfeaff1894bd'
  '4e707fb9d7f5ce13571d47ee07dc489347bfc76d39d5821428db8fcd89b16b97'
  'acaeb63191ab0b54307c9ca68cb6a9ec5278205f602241aeb1dabade7c2344da'
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
