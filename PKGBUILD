# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=luciole-git
_pkgname=luciole
pkgver=0.1.0.r0.g000000000
pkgrel=4
pkgdesc='A smooth, native Wayland file manager with fast previews, tabs, split view and Miller columns'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/luciole'
license=('MIT')
options=('!debug')
depends=(
  'acl'
  'adwaita-icon-theme'
  'cairo'
  'curl'
  'dconf'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gsettings-desktop-schemas'
  'gvfs'
  'harfbuzz'
  'hicolor-icon-theme'
  'libarchive'
  'libgcc'
  'libglvnd'
  'libpng'
  'librsvg'
  'libstdc++'
  'libxkbcommon'
  'libxml2'
  'pango'
  'shared-mime-info'
  'tomlplusplus'
  'wayland'
  'xz'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
optdepends=(
  'ffmpeg: video and audio thumbnails and metadata'
  'ffmpegthumbnailer: filmstrip edges on video thumbnails'
  'poppler: PDF thumbnails and metadata'
  '7zip: encrypted 7z archives'
  'gvfs-smb: SMB network locations'
  'gvfs-dnssd: WebDAV and DNS-SD network discovery'
  'glib-networking: secure WebDAV (TLS)'
  'xdg-terminal-exec: automatic terminal selection'
  'xdg-desktop-portal: use Luciole as the Open and Save file picker'
)
provides=('luciole')
conflicts=('luciole')
source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || return 1

  local version
  version="$(tr -d '[:space:]' < VERSION)"
  printf '%s.r%s.g%s' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
  arch-meson "${_pkgname}" build-release \
    -Db_ndebug=true \
    -Dtests=disabled \
    -Dbuild_revision="$(git -C "${_pkgname}" rev-parse --short=9 HEAD)"
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
