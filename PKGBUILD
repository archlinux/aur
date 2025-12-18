# Maintainer:  dreieck
# Contributor: Plague-doctor <plague at privacyrequired dot com >

_pkgbase="mullvad-tray"
_pkgname="${_pkgbase}"
pkgname="${_pkgname}-git"
pkgver=2.0.4.r42.20251212.ea35158
pkgrel=1
pkgdesc="Mullvad VPN connection status in system tray. Latest git checkout."
arch=(
  'i586'
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
)
depends=(
  'gcc-libs'
  'glibc'
  'libadwaita-1.so'      # libadwaita
  'libcrypto.so'         # openssl
  'libgdk_pixbuf-2.0.so' # gdk-pixbuf2
  'libgio-2.0.so'        # glib2
  'libglib-2.0.so'       # glib2
  'libgobject-2.0.so'    # glib2
  'libgtk-4.so'          # gtk4
  'libssl.so'            # openssl
)
makedepends=(
  "git"
  "cargo"
  "parallel"  # For parallel execution of 'zopflipng'.
  "zopfli"    # For 'zopflipng'.

  "gdk-pixbuf2"
  "glib2>=0.20"
  "gtk4>=0.9"
  "libadwaita>=0.7"
  "openssl"
)
checkdepends=(
  "cargo"
)
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL-3.0-or-later')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  printf '%s\n' "Fetching rust dependencies ..."
  cargo fetch
}

pkgver () {
  cd "${srcdir}/${_pkgbase}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
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
  cd "${srcdir}/${_pkgbase}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  printf '%s\n' "Size-optimising PNG files ..."
  printf '%s\n' aur/*.png resources/icons/*.png | parallel -j`nproc` zopflipng -m -y {} {}

  printf '%s\n' "Compiling ..."
  cargo build --offline --release

}

check() {
  cd "${srcdir}/${_pkgbase}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  #cargo fmt
  printf '%s\n' "Performing check ..."
  cargo check --offline --all-targets
}

package() {
  cd "${srcdir}/${_pkgbase}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  printf '%s\n' "Installing binary ..."
  install -Dvm755 -t "${pkgdir}/usr/bin"  "target/release/mullvad-tray"

  printf '%s\n' "Inatalling logo and desktop file ..."
  install -Dvm644  aur/mullvad-logo.png      "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dvm644  aur/mullvad-tray.desktop  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  printf '%s\n' "Inatalling documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"       git.log README.md CHANGELOG.md CLAUDE.md
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/docs"  docs/*

  printf '%s\n' "Inatalling license file ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"   LICENSE
}
