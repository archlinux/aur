# Maintainer: shbernal <shbernal.01@gmail.com>

_repo=shift
_user=shift-editor
_appname=Shift
pkgname=${_user}-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A cross-platform font editor built in Rust and TypeScript'
arch=('x86_64')
url="https://github.com/${_user}/${_repo}"
license=('MIT OR Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=('libsecret: store credentials in the system keyring')
provides=("${_user}")
conflicts=("${_user}")
options=('!strip' '!debug')

_deb="${_appname}-${pkgver}-Linux-x64.deb"
source=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums=('4b8a93f03048247cb6d64e3e8b1d7377d666394533c322fff02adfe75bf5822d')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_deb}" data.tar.xz | bsdtar -xf - -C deb
}

package() {
  cp -a deb/. "${pkgdir}/"

  # APT repository config and the Debian changelog don't belong on Arch
  rm -rf "${pkgdir}/etc" "${pkgdir}/usr/share/doc"

  # Arch has unprivileged user namespaces, so the sandbox helper needs no SUID
  chmod 755 "${pkgdir}/opt/${_appname}/chrome-sandbox"

  # /usr/bin/shift is too generic a name; expose the app as shift-editor
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/shift" "${pkgdir}/usr/bin/${_user}"
  sed -i "s|^Exec=.*|Exec=${_user} %U|" "${pkgdir}/usr/share/applications/shift.desktop"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${_appname}/resources/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  ln -s "/opt/${_appname}/resources/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
