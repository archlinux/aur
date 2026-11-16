# Maintainer: minpeter <minpeter@users.noreply.github.com>
# Contributor: minpeter <kali2005611@gmail.com>
# Repository: https://github.com/minpeter/aur-zuse-bin

pkgname=zuse-bin
pkgver=0.26.1
pkgrel=1
pkgdesc='Desktop and browser control plane for coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/opcodehq/zuse'
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'json-glib'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'openssl'
  'vulkan-icd-loader'
  'wayland'
  'webkit2gtk-4.1'
  'zlib'
)
optdepends=(
  'xdg-utils: open external links in the default browser'
)
# The upstream binary is called zuse. AUR's zuse-git is an unrelated IRC
# client that installs the same /usr/bin/zuse, so both cannot coexist.
provides=('zuse')
conflicts=('zuse' 'zuse-git')
options=('!debug' '!strip')
makedepends=('libarchive')

_deb='zuse.deb'
source_x86_64=("${_deb}::https://github.com/opcodehq/zuse/releases/download/v${pkgver}/zuse-${pkgver}-linux-x86_64.deb")
source_aarch64=("${_deb}::https://github.com/opcodehq/zuse/releases/download/v${pkgver}/zuse-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('8b8cc1707dd7086833260ff65bd4dd61d42bd6a5021e13faeaf74ff2bb6d2291')
sha256sums_aarch64=('14ef5c70137c797470da4b9d4da7ccf2f11c709cf28b40193387ffd86da4f8e2')
noextract=("${_deb}")

prepare() {
  rm -rf "${srcdir}/deb"
  mkdir -p "${srcdir}/deb/data"
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}/deb"
  bsdtar -xf "${srcdir}"/deb/data.tar.* -C "${srcdir}/deb/data"
}

package() {
  cd "${srcdir}/deb/data"

  install -dm755 "${pkgdir}/usr/lib"
  cp -a opt/zuse "${pkgdir}/usr/lib/"
  # The user-level installer is not used by a system package.
  rm -f "${pkgdir}/usr/lib/zuse/install.py"

  install -Dm644 usr/share/applications/sh.zuse.app.desktop \
    "${pkgdir}/usr/share/applications/sh.zuse.app.desktop"
  sed -i 's|^Exec=.*|Exec=zuse %u|' \
    "${pkgdir}/usr/share/applications/sh.zuse.app.desktop"

  install -Dm644 usr/share/icons/hicolor/1024x1024/apps/sh.zuse.app.png \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/sh.zuse.app.png"

  # Keep the package manager in charge: the built-in updater stays
  # report-only unless the user explicitly opts back in.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/zuse" <<'EOF'
#!/bin/sh
export ZUSE_AUTO_UPDATE="${ZUSE_AUTO_UPDATE:-0}"
exec /usr/lib/zuse/bin/zuse "$@"
EOF
  ln -s /usr/lib/zuse/bin/zuse-server "${pkgdir}/usr/bin/zuse-server"
  ln -s /usr/lib/zuse/bin/zuse-relay "${pkgdir}/usr/bin/zuse-relay"
}
