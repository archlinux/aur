# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-bolt-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Pi coding agent compiled ahead of time to native code (prebuilt binary, x86-64 baseline and ARM64)'
arch=('x86_64' 'aarch64')
url='https://github.com/opensec-git/Pi-Bolt'
license=('MIT')
depends=('libxcb')
optdepends=('ripgrep: native backend for the grep tool, instead of the built-in walker')
provides=('pi-bolt')
conflicts=('pi-bolt' 'pi-bolt-avx2-bin' 'pi-bolt-avx2-bin-release-git')
# The executable carries its JavaScript payload after the ELF section table, so
# strip discards it and leaves a bare Bun runtime reporting Bun's own version.
# Nothing here is compiled by makepkg, so there are no symbols to keep.
options=('!strip' '!debug')
install="${pkgname}.install"

_repo=opensec-git/Pi-Bolt
_release_url="https://github.com/${_repo}/releases/download/bolt-v${pkgver}"

# Upstream's default x64 build needs AVX2, which depends=() cannot express, so
# this package ships the baseline build that runs on any x86-64. The AVX2 build
# is pi-bolt-avx2-bin. Both report their variant in --version.
_payload_x86_64=pi-bolt-linux-x64-baseline
_label_x86_64=linux-x64-baseline
_payload_aarch64=pi-bolt-linux-arm64
_label_aarch64=linux-arm64

case "${CARCH}" in
  aarch64) _payload="${_payload_aarch64}" _label="${_label_aarch64}" ;;
  *)       _payload="${_payload_x86_64}"  _label="${_label_x86_64}"  ;;
esac

source_x86_64=("${_payload_x86_64}-${pkgver}.tar.xz::${_release_url}/${_payload_x86_64}.tar.xz")
source_aarch64=("${_payload_aarch64}-${pkgver}.tar.xz::${_release_url}/${_payload_aarch64}.tar.xz")
sha256sums_x86_64=('b25a15ae164f169d60316379b6197d444bf7f52b46c056ed4bd9e12d0cddc79a')
sha256sums_aarch64=('f0b99778ed246bf1acaeb3d0e5e632a4fc8570880a35381c6169f8b9aa5f9cc4')

latestver() {
  git ls-remote --tags "https://github.com/${_repo}.git" 'bolt-v[0-9]*' |
    awk '{print $2}' | sed -e 's|^refs/tags/||' -e 's/\^{}$//' |
    sort -V -u | tail -1 | sed 's/^bolt-v//'
}

check() {
  # --version names the variant it was built for, so a swapped asset fails the
  # build instead of a user's CPU. HOME is redirected: the TUI writes state.
  HOME="${srcdir}/check-home" "${srcdir}/${_payload}/pi" --version |
    grep -qF "Pi-Bolt ${pkgver}, ${_label}" || error "unexpected --version output from ${_label}"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/pi-bolt"
  # Plain -a chowns under fakeroot, which the payload rejects on some of its own
  # files (EINVAL on docs/ and export-html/).
  cp -a --reflink=auto --no-preserve=ownership "${srcdir}/${_payload}/." "${pkgdir}/usr/lib/pi-bolt/"

  install -dm755 "${pkgdir}/usr/bin"
  # /usr/bin/pi belongs to the 'pi' package, which runs the same agent on Node.
  ln -s /usr/lib/pi-bolt/pi "${pkgdir}/usr/bin/pi-bolt"

  install -Dm644 "${pkgdir}/usr/lib/pi-bolt/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/pi-bolt/LICENSE.pi" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pi"
}
