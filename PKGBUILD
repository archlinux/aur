# Maintainer: czyt <czytcn@gmail.com>
pkgname=mingle-bin
pkgver=0.4.11
pkgrel=1
pkgdesc="Bring your agent companion into the chat apps you already use: it runs on your machine, no server needed"
arch=('x86_64' 'aarch64')
url="https://github.com/earayu/Mingle"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gtk3' 'gtk-layer-shell' 'libayatana-appindicator' 'libsecret' 'webkit2gtk-4.1')
optdepends=('gnome-keyring: keep the credentials of the agents in the system keyring'
            'nodejs: run the scripts that come with the agents by hand')
provides=('mingle')
conflicts=('mingle')
# The program is an upstream build: stripping it would rewrite upstream's
# binaries, and a debug package would be just as large.
options=('!strip' '!debug')

_deb_x86_64="mingle_${pkgver}_amd64.deb"
_deb_aarch64="mingle_${pkgver}_arm64.deb"

_releases="https://github.com/earayu/Mingle/releases/download/v${pkgver}"

source_x86_64=("${_deb_x86_64}::${_releases}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${_releases}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('9e35b75b0b7c156651f8057cd48578336c3ff8e88628cb142f99fff3f27835e3')
sha256sums_aarch64=('19bf09098ed4d42c89cdecdfcfe14237c5bfa5631b19ea881f99fb9fcd52d422')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  # The Debian package keeps the program in /opt; Arch keeps such files in
  # /usr/lib.
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -d "${pkgdir}/usr/lib"
  mv "${pkgdir}/opt/mingle" "${pkgdir}/usr/lib/mingle"
  rmdir "${pkgdir}/opt"

  # The launcher keeps the name of the program, which the window and the
  # tray icon take from it.
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/mingle/mingle "${pkgdir}/usr/bin/mingle"

  # The desktop entry of the Debian package points into /opt.
  sed -i 's|^Exec=.*|Exec=mingle|' "${pkgdir}/usr/share/applications/mingle.desktop"

  # The licence of the program itself; the bundled Node.js keeps its own.
  install -Dm644 "${pkgdir}/usr/lib/mingle/core/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
