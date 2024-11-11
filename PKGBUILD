# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="pass-secret-service"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=0.2+1.r46.20240720.f9dbcbb
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
)
conflicts=(
  "${_pkgname}"
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
  #cargo add futures-util  # Needed in the `cargo install` step.

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

  #cargo build --offline --release --tests
  cargo build --offline --release
}

check() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"

  ## This actually compiles stuff again. Even if `--tests` is added to `cargo build`.
  cargo test --offline
}

package() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."

  ## I give up here trying to download all cargo specific stuff in `prepare()` and compile all in `build()`: This actually needs to download stuff again (so, `--offline` will result in failure) and I could not find a way to download it in `prepare()`. Also, it compiles stuff again.
  #  On the other side, `cargo build` as above does not generate the file `pass-secret-service` so that we cannot manually copy, but we need `cargo install` actually.
  cargo install --root "${pkgdir}" --path .

  # Remove junk
  rm "${pkgdir}"/{.crates2.json,.crates.toml}
  # Use correct directories
  install -dvm755 "${pkgdir}/usr/bin"
  install -Dvm755 -t "${pkgdir}/usr/bin"  "${pkgdir}/bin/pass-secret-service"
  rm "${pkgdir}/bin/pass-secret-service"
  rmdir "${pkgdir}/bin"

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

