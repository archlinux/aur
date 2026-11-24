# Maintainer: czyt <czytcn@gmail.com>
pkgname=unifyterm-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="One terminal for Windows, macOS and Linux: the same Unix commands everywhere, a command history you can search as you type, pictures and markdown in the terminal"
arch=('x86_64')
url="https://github.com/newdee/unifyterm"
license=('MIT')
# The program opens the Vulkan loader itself when it starts, so that
# dependency does not show up in the libraries it links against.
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=('mesa: software Vulkan rendering when the machine has no GPU driver'
            'ffmpeg: play video and audio inside the terminal')
provides=('unifyterm')
conflicts=('unifyterm')
# The program is an upstream build of a Rust program: stripping it would
# rewrite upstream's binary for no gain, and a debug package would be just
# as large.
options=('!strip' '!debug')

# The Debian package names the release version with a Debian revision.
_deb_rev="1"
_deb="unifyterm_${pkgver}-${_deb_rev}_amd64.deb"

source=("${_deb}::https://github.com/newdee/unifyterm/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums=('0eeb51fe35b6bc9250490637ff8e22f66abfc9186dbe7f5214ded8105325a8c9')

package() {
  local data_archive

  # The member is looked up instead of assumed: the Debian build has used
  # different compressions over time.
  data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${_deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${_deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # The Debian copyright file holds the MIT licence, and the notices of the
  # bundled third party code belong next to it.
  install -Dm644 "${pkgdir}/usr/share/doc/unifyterm/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/unifyterm/THIRD-PARTY-NOTICES" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
  rm -rf "${pkgdir}/usr/share/doc/unifyterm"
  rmdir "${pkgdir}/usr/share/doc" 2>/dev/null || true
}
