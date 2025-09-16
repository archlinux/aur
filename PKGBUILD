# Maintainer: jakka <jakka@jakka.su>

pkgname="pass-secret-service"
pkgver=0.5.1
pkgrel=3
pkgdesc="An org.freedesktop.secrets provider with a pass backend."
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/grimsteel/pass-secret-service"
license=("GPL-3.0-or-later")
groups=("pass")
depends=(
  "gcc-libs"
  "glibc"
  "dbus"
)
makedepends=(
  "cargo"
)
optdepends=(
  "pass:            To init and manage password store"
)
provides=(
  "pass-secret-service"
  "org.freedesktop.secrets"
)
conflicts=(
  "pass-secret-service-git"
  "pass-secret-service-bin"
  "gnome-keyring"
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/grimsteel/pass-secret-service/archive/v$pkgver.tar.gz"
)
sha256sums=('04eb97a3432d24e1fea59174681de77c66406ddd90c1ec0e5222ca14c505760f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen --all-features --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dvm755 -t "${pkgdir}/usr/bin"                     "target/release/pass-secret-service"
  install -Dvm744 -t "${pkgdir}/usr/share/dbus-1/services/"  "systemd/org.freedesktop.secrets.service"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/user/"       "systemd/pass-secret-service.service"

  _docfiles=(
    README.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
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
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
