# Maintainer: kappy <kappy777@proton.me>
#
# kappastream-bin: repackages the upstream prebuilt native binary (no
# compilation — no rust/cargo/node toolchain). The companion to
# kappastream-git (which builds from source). Use -bin for a fast install
# from the release artifact; use -git to build locally.
#
# Submission notes: see packaging/aur/README.md

_pkgname=kappastream
_repo="https://github.com/kappy7777/kappastream"

pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=3
pkgdesc="A lightweight, account-free Twitch viewer (live stream, chat, favorites) for Linux"
arch=('x86_64')
url="${_repo}"
license=('GPL-3.0-only')
# Same runtime deps as kappastream-git; the prebuilt binary links the same
# webkit2gtk-4.1 / gtk3 / glib2 / libsoup3 libs. streamlink resolves HLS URLs.
# WebKitGTK plays media via GStreamer; webkit2gtk-4.1 pulls only
# gst-plugins-base-libs (the libs), not the plugin packages, so the runtime
# media pipeline must be declared explicitly (else "autoaudiosink not found"
# → no audio and streams never start).
depends=(
  'streamlink'
  'webkit2gtk-4.1'
  'gtk3'
  'gst-libav'           # avdec_h264 / avdec_aac (Twitch H.264 + AAC)
  'gst-plugins-base'    # autoaudiosink + audioconvert/resample + videoconvert
  'gst-plugins-good'    # pulsesink → PulseAudio/PipeWire
  'hicolor-icon-theme'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
# One self-contained release archive: prebuilt native binary + desktop +
# metainfo + Wayland-workaround wrapper + icons (built by
# packaging/aur/build-release-tarball.sh). No makedepends, no build() — this
# is a pure -bin repackage.
source=("${_repo}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('269ed72112800da6555a7544dafca83932585635af5bb02d76b67c7754a77f00')   # kappastream-0.1.3-x86_64.tar.gz (v0.1.3 release asset)

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-x86_64"
	# Real binary → /usr/lib/kappastream (out of $PATH); wrapper at /usr/bin
	# exports WEBKIT_DISABLE_COMPOSITING_MODE=1 (Wayland workaround).
	install -Dm755 "${_pkgname}"                          "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
	install -Dm755 "${_pkgname}.sh"                        "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop entry + AppStream metainfo.
	install -Dm644 "${_pkgname}.desktop"                   "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "dev.kappy.kappastream.metainfo.xml"    "${pkgdir}/usr/share/metainfo/dev.kappy.kappastream.metainfo.xml"

	# Icons (hicolor). Sizes mirror the -git package.
	install -Dm644 "32x32.png"      "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
	install -Dm644 "64x64.png"      "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
	install -Dm644 "128x128.png"    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 "128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	install -Dm644 "icon.png"       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

	# License (Arch convention: /usr/share/licenses/<pkgname>/).
	install -Dm644 "LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
