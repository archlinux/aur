# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Ricardo Vieira (https://aur.archlinux.org/account/ricardomv)
# Contributor: MuPuF (https://aur.archlinux.org/account/MuPuF)

_pkgname="liquid-dsp"
pkgname="${_pkgname}-git"
pkgver=1.7.0+177.r8095.20251116.7133af0e2
pkgrel=1
pkgdesc="Digital signal processing library for software-defined radios"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://liquidsdr.org"
license=('MIT')
groups=()
depends=(
  'glibc'
)
optdepends=(
  'fftw: efficient FFT'
)
makedepends=(
  'autoconf'
  'automake'
  'git'
  'gcc'
  'fftw'
  'make'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+https://github.com/jgaeddert/liquid-dsp.git")
noextract=()
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}"

  ./bootstrap.sh

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${_pkgname}"
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
  cd "$srcdir/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --disable-debug-messages \
    --disable-fftoverride

  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "CHANGELOG.md" "README.rst" "${srcdir}/git.log"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
