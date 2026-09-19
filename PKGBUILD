# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=concat-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Free and open-source CapCut replacement, a video editor with a Rust engine (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jub0t/Concat"
# The binary is Concat under the AGPL; the FFmpeg libraries it ships beside
# itself are a GPL build. Both licence texts land in the package: the
# repository's LICENSE, and upstream's notices file, which is what names the
# terms of everything linked in - FFmpeg, Slint under its GPL option,
# whisper.cpp, sherpa-onnx.
license=('AGPL-3.0-or-later' 'GPL-3.0-or-later')
# Nothing is spawned at run time: FFmpeg is linked, whisper.cpp and
# sherpa-onnx are compiled in, and ONNX Runtime ships in the same lib/
# directory. What is left is what the binary loads by name - the ALSA backend
# of cpal, fontconfig and freetype for text, and the windowing libraries
# winit and the renderer open: EGL, Wayland, X11 and xkbcommon. dbus is the
# XDG portal, which is how the file dialogs and "reveal in file manager" work
# without a toolkit.
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libglvnd' 'libxkbcommon'
         'libxkbcommon-x11' 'libx11' 'libxcursor' 'libxi' 'libxrender'
         'wayland' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=('concat')
conflicts=('concat')
# !strip: upstream's binary is already stripped, and the FFmpeg and ONNX
# Runtime libraries beside it are theirs to ship as they are.
options=('!strip' '!debug')
# Upstream's Linux packages carry one self-contained folder: the binary and
# the libraries it was linked against - FFmpeg 8 (Arch is on 9) and ONNX
# Runtime, the cutout models' runtime. They go to /opt/concat, where the
# binary's own rpath ($ORIGIN/lib) finds them, which is also where upstream's
# .deb puts them and what its desktop entry points at.
#
# Of the three Linux artifacts - .deb, .rpm and AppImage - the .deb is the
# plain one: an ar archive around that folder, with no runtime wrapped around
# it and nothing to mount.
#
# The asset name carries the workspace's version, not the tag (a prerelease of
# 0.2.4 ships Concat-0.2.4-linux-x86_64.deb whatever its tag says), so both
# the tag and that version are resolved through the release manifest and
# synced here along with the checksums; see pkg.sh.
_tag="v0.2.3"
_relver="0.2.3"
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/jub0t/Concat/releases/download/${_tag}/Concat-${_relver}-linux-x86_64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/jub0t/Concat/releases/download/${_tag}/Concat-${_relver}-linux-aarch64.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
sha256sums_x86_64=('01d2fb58521038a426429f1543ab2ec2359aa428a9dfd1b8948ce97b7d79c6c3')
sha256sums_aarch64=('3bd3f6bcfb165141b50b1ca2d3ab1b070f7e5a0e9f86a3c9ec121c4b5085a220')

package() {
  # -p: lib/ is the usual set of soname symlinks beside the real files, and
  # only an extraction that preserves them keeps the rpath working.
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./opt ./usr

  # upstream ships them as documentation; on Arch they belong here
  install -d "$pkgdir/usr/share/licenses"
  mv "$pkgdir/usr/share/doc/concat" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/share/doc"
}
