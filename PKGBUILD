# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai-desktop-bin
_pkgname=mold-ai-desktop
_binname=mold-desktop
pkgver=0.34.0
pkgrel=1
pkgdesc="Mold desktop app for remote GPU hosts — gallery, model manager and job queue (prebuilt, GPU-free)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

# GPU-free release, built like the Windows desktop installer: generation runs
# on a remote mold server (or slowly on the CPU). No NVIDIA driver or CUDA
# runtime required.
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'hicolor-icon-theme'
  'gcc-libs'
  'glibc'
)

optdepends=(
  'ffmpeg: video upscaling and mp4 mux fallback'
  'gst-plugins-good: in-app video playback'
  'gst-plugins-bad: in-app video playback'
  'gst-libav: H.264 in-app video playback'
)

# Installs /usr/bin/mold-desktop only, so it coexists with the `mold-ai*`
# CLI packages and with extra/mold (the rui314 linker).
provides=("${_pkgname}=${pkgver}")
conflicts=('mold-ai-desktop')

# The release binary is already stripped (desktop profile.release: strip = true).
options=(!strip !debug)

source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}-x86_64-unknown-linux-gnu-cpu.tar.gz")

# Rewritten by scripts/aur/update-pkgbuild.sh on every release. SKIP is only
# the in-tree placeholder: the first release that publishes the archive
# replaces it with the real digest.
sha256sums_x86_64=('b33410a961290de5c4ae910050844a5796700fe5e9d67d979a32f7466632e78c')

package() {
  # The archive is the `usr/` tree scripts/install-linux-desktop-files.sh lays
  # out, plus LICENSE. Installs files only; never executes the payload.
  if [[ ! -x "${srcdir}/usr/bin/${_binname}" ]]; then
    echo "error: release archive v${pkgver} carries no usr/bin/${_binname};" >&2
    echo "       this recipe requires the GPU-free Linux desktop release archive" >&2
    return 1
  fi
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
