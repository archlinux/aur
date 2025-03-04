# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca> (package `aur/loop`, which in fact was a `-git` package already.)

_pkgname=loop
pkgname="${_pkgname}-git"
pkgver=0.6.1.r140.20201117.209927c
pkgrel=1
pkgdesc="UNIX's missing loop command"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Miserlou/Loop"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc')
makedepends=(
  'cargo'
  'git'
)
provides=("loop=${pkgver}")
conflicts=('loop')
replaces=("loop=944df76")
source=("$_pkgname::git+https://github.com/Miserlou/Loop")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  git log > git.log

  cargo fetch -v
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  _ver="$(cargo pkgid | awk -F@ '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS+="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS+="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  install -Dvm755 "target/release/loop" "$pkgdir/usr/bin/loop"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE.txt
}

# vim:set ts=2 sw=2 et:
