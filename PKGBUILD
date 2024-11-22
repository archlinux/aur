# Maintainer: lafleur <lafleur at boum dot org>
# shellcheck disable=2034

# The makepkg --geninteg command doesn't fetch the aarch64 binary under an x86_64 machine.
# You may do it manually as so :
#   - update pkgver in PKGBUILD
#   - `makepkg --printsrcinfo > .SRCINFO`
#   - `wget "$(awk '/source_aarch64/ {print $NF}' .SRCINFO | sed s/^conduit:://)"`
#   - `sha256sum [the file that was downloaded]`
#   - put that in the PKGBUILD
#   - rerun makepkg --printsrcinfo to update .SRCINFO with this PKGBUILD's content
#   - remove the downloaded file

pkgname=conduit-bin
_pkgname=${pkgname/-bin/}
pkgver=0.9.0
pkgrel=1
pkgdesc="stable, binary, static versions of the Conduit server (Matrix protocol)"
arch=('x86_64' 'aarch64')
url="https://conduit.rs"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/${_pkgname}.toml")

source=(
  "${_pkgname}.toml"
  "${_pkgname}.service"
  'tmpfiles.conf'
  'sysusers.conf'
)
source_x86_64=("${_pkgname}::https://gitlab.com/api/v4/projects/famedly%2Fconduit/jobs/artifacts/v${pkgver}/raw/x86_64-unknown-linux-musl?job=artifacts")
source_aarch64=("${_pkgname}::https://gitlab.com/api/v4/projects/famedly%2Fconduit/jobs/artifacts/v${pkgver}/raw/aarch64-unknown-linux-musl?job=artifacts")

package() {
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.toml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.toml"
  install -vDm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}

sha256sums=('59289b3d3b4b20684acb86033477ffab18a82947cb6559b37772da02507ec1d9'
            '1c5f53cc49bae88b80281ab6edcf08e18430e5db668eaa186b8be4928f850594'
            '4316952810a2295b81d7faf3e28c371dd63629671c4b7e3c39bfbae5ab9e2db6'
            '0f454a2a5af857fe978e2276798fb357b4578c6ee705664a794426c8b7576a4c')
sha256sums_x86_64=('ae67b0fa1b74571de0363cb1a0c47930e615c340290215cbbbff6f8a60bbca0d')
sha256sums_aarch64=('f88477fb05d73df068116595783ab628aff94f4857f8de8d5818bb55ece5fb49')
