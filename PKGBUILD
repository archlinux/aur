# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="pass-secret-service"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=0.5.0.r65.20250903.16ca040
pkgrel=1
pkgdesc="An org.freedesktop.secrets provider with a pass backend."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
_githost='github.com'
_gituser='grimsteel'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("GPL-3.0-or-later")
groups=("pass")
depends=(
  "gcc-libs"
  "glibc"
  "dbus"
  "pass"
)
makedepends=(
  "git"
  "cargo"
)
optdepends=(
  "${_pkgname}-openrc: For (system-wide, not recommended) OpenRC init script."
  "${_pkgname}-runit:  For (system-wide, not recommended) runit init script."
  "systemd:            To launch the DBUS service automatically on systemd based systems."
)
checkdepends=(
  "cargo"
)
provides=(
  "${_pkgname}=${pkgver}"
  "org.freedesktop.secrets"
)
conflicts=(
  "${_pkgname}"
  "gnome-keyring"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"

  cargo fetch

  git log > "${srcdir}/git.log"

}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"

  ## no library targets found in package `pass-secret-service`
  # printf '%s\n' " --> building library ..."
  # cargo build --offline --all-features --release --lib
  printf '\n'
  printf '%s\n' " --> building binaries ..."
  cargo build --offline --all-features --release --bins
  printf '\n'
  printf '%s\n' " --> building examples ..."
  cargo build --offline --all-features --release --examples
  printf '\n'
  printf '%s\n' " --> building tests ..."
  cargo build --offline --all-features --release --tests
}

check() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> running tests ..."
  cargo test --offline --release
}

package() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."

  install -Dvm755 -t "${pkgdir}/usr/bin"                     "target/release/pass-secret-service"
  # Install service files
  install -Dvm744 -t "${pkgdir}/usr/share/dbus-1/services/"  "systemd/org.freedesktop.secrets.service"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/user/"       "systemd/pass-secret-service.service"


  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
