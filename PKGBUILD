# Maintainer: Suleyman Laarabi <suleyman.laarabi.dev@gmail.com>
pkgname=gbstudio-bin
pkgver=0.1.5
pkgrel=2
pkgdesc="Gameboy game development environment"
arch=('x86_64')
url="https://github.com/suleymanlaarabi/GBStudio"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
options=('!emptydirs')
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/GB-Studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('ef5978b194df20dacc88da2b8a9d714ec835e5ddda12846f9ca06e476c7c885d')

package() {
  cd "${srcdir}"

  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.xz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.zst -C "${pkgdir}/"

  chmod -R u=rwX,go=rX "${pkgdir}/"
  install -dm755 "${pkgdir}/usr/lib/gbstudio"
  mv "${pkgdir}/usr/bin/gb-studio" "${pkgdir}/usr/lib/gbstudio/gb-studio-bin"

  cat > "${pkgdir}/usr/bin/gb-studio" <<'EOF'
#!/bin/sh
set -eu

if [ "${XDG_SESSION_TYPE:-}" = "wayland" ] && [ -z "${WEBKIT_DISABLE_DMABUF_RENDERER+x}" ]; then
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi

exec /usr/lib/gbstudio/gb-studio-bin "$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/gb-studio"
}
