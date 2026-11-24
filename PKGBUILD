# Maintainer: czyt <czytcn@gmail.com>

pkgname=lig-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Fig-style IDE autocomplete for your terminal: subcommands, options, branches and paths in a popup (zsh, bash, fish)"
arch=('x86_64' 'aarch64')
url="https://github.com/KevenGoncalves/lig"
license=('MIT')
# The published binaries are static (musl/glibc-free) Rust builds: nothing is
# linked at run time, so the package needs no libraries of its own.
optdepends=(
  'curl: package search on npm, crates.io, Docker Hub, PyPI, Snap and Flathub'
  'ttf-nerd-fonts-symbols: icons in the suggestion popup (any Nerd Font works)'
)
provides=('lig')
conflicts=('lig' 'lig-git')
# The popup only turns on after `lig install` has touched the user's shell
# configuration, which a package install must not do on the user's behalf.
install=lig-bin.install
options=('!strip' '!debug')

_deb_x86_64="lig_${pkgver}_amd64.deb"
_deb_aarch64="lig_${pkgver}_arm64.deb"
source_x86_64=("${_deb_x86_64}::https://github.com/KevenGoncalves/lig/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::https://github.com/KevenGoncalves/lig/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('697c3e0e92ea676dbe266ce5fdef3f6c0461ba3775345e187650e26bf7a95e07')
sha256sums_aarch64=('1aa603a2100927c30438b8c0a5974ff4e94a287922cf3bfa71aca8ab043369f1')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  # 1.3.0 uses data.tar.gz and older builds have used other compressions, so
  # look the member up instead of assuming one.
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # Keep the README (it documents `lig install`), and take the Debian
  # copyright file, which is the MIT text, as the licence file.
  install -Dm644 "${pkgdir}/usr/share/doc/lig/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgdir}/usr/share/doc/lig/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/lig"
}
