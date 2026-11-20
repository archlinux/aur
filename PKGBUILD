# Maintainer: OxiRoute maintainers <https://github.com/oxiroute/oxiroute/issues>

pkgname=oxiroute-bin
pkgver=7.1.1
pkgrel=1
pkgdesc='Pingora-based HTTP, TCP, and RTMP proxy runtime (prebuilt, profile-guided release binaries)'
arch=('x86_64')
url='https://github.com/brauliobo/oxiroute'
license=('Apache-2.0')
# The release binaries link OpenSSL statically; only glibc and libgcc_s are dynamic.
depends=('ca-certificates' 'gcc-libs' 'glibc' 'systemd>=257')
optdepends=('certbot: provide certificate lineages consumed by configured Certbot sources')
provides=("oxiroute=${pkgver}")
conflicts=('oxiroute')
options=('!debug' '!strip' '!zipman' '!purge')
backup=('etc/oxiroute/oxiroute.env'
        'etc/oxiroute/oxiroute.kdl'
        'etc/oxiroute/oxiroute.lua')
install=oxiroute.install
_package="oxiroute-${pkgver}-1-x86_64.pkg.tar.zst"
# The checksum is the content of the release asset ${_package}.sha256.
source=("${_package}::${url}/releases/download/v${pkgver}/${_package}")
noextract=("${_package}")
sha256sums=('521c41f2df47c0ebfeb12b523f4bb2d7ad7d3d0b56ff2ef168f4725f8f47cb1e')

_release_metadata() { bsdtar -xOf "${srcdir}/${_package}" .PKGINFO; }

_declared() {
  case $1 in
    depend) printf '%s\n' "${depends[@]}" ;;
    optdepend) printf '%s\n' "${optdepends[@]}" ;;
    backup) printf '%s\n' "${backup[@]}" ;;
  esac | LC_ALL=C sort
}

_require_release_package() {
  local field
  [[ $(_release_metadata | sed -n 's/^pkgname = //p') == oxiroute ]] || { printf '%s is not the oxiroute package\n' "${_package}" >&2; return 1; }
  [[ $(_release_metadata | sed -n 's/^pkgver = //p') == "${pkgver}-1" ]] || { printf '%s is not version %s-1\n' "${_package}" "${pkgver}" >&2; return 1; }
  for field in depend optdepend backup; do
    diff <(_declared "${field}") <(_release_metadata | sed -n "s/^${field} = //p" | LC_ALL=C sort) > /dev/null || {
      printf 'the %s of this recipe differ from the ones of %s\n' "${field}" "${_package}" >&2
      return 1
    }
  done
  cmp -s <(bsdtar -xOf "${srcdir}/${_package}" .INSTALL) "${startdir}/${install}" || {
    printf 'the install script of %s is not %s\n' "${_package}" "${install}" >&2
    return 1
  }
}

package() {
  _require_release_package
  bsdtar -xpf "${srcdir}/${_package}" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE --exclude .INSTALL
}
