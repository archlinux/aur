# Maintainer: czyt <czytcn@gmail.com>
pkgname=mieru-bin
pkgver=3.40.0
pkgrel=1
pkgdesc="Secure proxy client (SOCKS5, HTTP, HTTPS) of the Mieru proxy system"
arch=('x86_64' 'aarch64')
url="https://github.com/enfein/mieru"
license=('GPL-3.0-or-later')
# The published program is a static Go build, so it needs no library at run
# time. It starts itself in the background and never calls a shell.
provides=('mieru')
conflicts=('mieru' 'mieru-git')
# The program is already stripped, and stripping it again may break it.
options=('!strip' '!debug')

# The release carries the client as a Debian package for each architecture.
# The name of those files holds the version already.
_deb_x86_64="mieru_${pkgver}_amd64.deb"
_deb_aarch64="mieru_${pkgver}_arm64.deb"

source=("LICENSE-${pkgver}::https://github.com/enfein/mieru/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_deb_x86_64}::https://github.com/enfein/mieru/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::https://github.com/enfein/mieru/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('c45bfaa30178bd98130ff5480e48065b6bc35cc6da4d3ce4d3db488501062af1')
sha256sums_aarch64=('f6316c6fb513d500907a96dc0cf26ed4261df2a7468c9d53f050dcdd1faf7d1e')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  # Do not assume a compression for the payload of the Debian package: look
  # the member up instead.
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # The Debian package carries no copyright file, so the licence is taken from
  # the repository of the release.
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
