# Maintainer: Caleb Mignano <swagcalebwolf at gmail dot com>
pkgname=aurora-viewer-bin
_pkgname=aurora-viewer
pkgver=0.9.13
pkgrel=1
pkgdesc="Free, open source Second Life viewer built in Rust with a Vulkan renderer (prebuilt release)"
arch=('x86_64')
url="https://aurora-viewer.org"
license=('GPL-3.0-only')
# Most of these are loaded at runtime (dlopen) by the window system, the Vulkan
# loader, or the downloaded media plugins, so namcap can't see them. They match
# upstream's documented Arch dependency list.
depends=(
  'glibc' 'libgcc' 'libstdc++' 'systemd-libs' 'hicolor-icon-theme'
  'vulkan-icd-loader' 'alsa-lib' 'libxkbcommon' 'wayland'
  'libx11' 'libxcursor' 'libxrandr' 'libxi'
  'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
  'gst-plugins-ugly' 'gst-libav'
  'nss' 'nspr' 'at-spi2-core' 'libcups' 'libxcomposite' 'libxdamage'
  'mesa' 'pango' 'cairo'
)
optdepends=(
  'vulkan-radeon: Vulkan driver for AMD GPUs'
  'vulkan-intel: Vulkan driver for Intel GPUs'
  'nvidia-utils: Vulkan driver for NVIDIA GPUs'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
# Stable releases only: tags are vX.Y.Z. Skip -test.N pre-releases and the
# non-viewer tags (media-plugins-N, assets-N).
_tag="v${pkgver}"
_dir="Aurora-Viewer-${_tag}-linux-x64"
_rel="https://github.com/Aurora-Viewer/Aurora-Viewer/releases/download/${_tag}"
source=("${_rel}/${_dir}.tar.gz"
        "${_rel}/${_dir}.tar.gz.sha256")
sha256sums=('25ae42f988a11d4d5fb53c938b7fed403d392c9c4e483ef21502ccce19a2dced'
            '0d99e48194413de1444c080356e149fb2278e2e77acd66ebaaaa15e7b6c1216d')

prepare() {
  # Cross-check the tarball against upstream's published checksum
  sha256sum -c "${_dir}.tar.gz.sha256"
}

package() {
  cd "$srcdir/$_dir"

  # App files live in /opt, launcher symlink in /usr/bin
  install -d "$pkgdir/opt/$_pkgname"
  cp -a --no-preserve=ownership . "$pkgdir/opt/$_pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/aurora-viewer" "$pkgdir/usr/bin/aurora-viewer"

  # Icon
  install -Dm644 aurora-viewer.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurora-viewer.svg"

  # Desktop entry, with Exec= pointed at the system launcher
  sed 's|^Exec=.*|Exec=/usr/bin/aurora-viewer|' aurora-viewer.desktop \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/aurora-viewer.desktop"

  # Licence files shipped in the archive
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  find . -maxdepth 1 -type f -iname '*licen*' \
    -exec install -m644 {} "$pkgdir/usr/share/licenses/$pkgname/" \;
}
