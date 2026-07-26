pkgname=shrieker-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='GUI client for the sculk P2P tunnel library (prebuilt binary)'
arch=('x86_64')
url='https://github.com/KercyDing/shrieker'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'wayland' 'libx11' 'libglvnd' 'glib2')
provides=('shrieker')
conflicts=('shrieker')
source=(
  'shrieker-linux-amd64.deb::https://github.com/KercyDing/shrieker/releases/download/v0.2.0/shrieker-linux-amd64.deb'
  'shrieker.desktop::https://raw.githubusercontent.com/KercyDing/shrieker/v0.2.0/shrieker.desktop'
  'icon.png::https://raw.githubusercontent.com/KercyDing/shrieker/v0.2.0/assets/icon.png'
)
sha256sums=(
  'c2a3e8c7228fff8e78aeb57dd1c7efe5e591e1d9e5f74af16a7db2b29b7cbe45'
  'b23ed24be29740d0138d94045415f73ab563eb3b94bd7f7937aaae1a33f6c977'
  'df06d92c1ed31506aebfb9af388e22ac5bd0b4b95152d499c7905065d1d5aebc'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "shrieker-linux-amd64.deb"
  local data_tar
  data_tar="$(find . -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "${data_tar}" ]]; then
    echo "failed to locate data.tar.* in shrieker-linux-amd64.deb" >&2
    exit 1
  fi
  bsdtar -xf "${data_tar}" "./usr/bin/shrieker"
  install -Dm755 "${srcdir}/usr/bin/shrieker" "${pkgdir}/usr/bin/shrieker"
  install -Dm644 "${srcdir}/shrieker.desktop" "${pkgdir}/usr/share/applications/shrieker.desktop"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/shrieker.png"
}
