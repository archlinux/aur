# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-bolt-avx2-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Pi coding agent compiled ahead of time to native code (prebuilt binary, x86-64 with AVX2)'
arch=('x86_64')
url='https://github.com/opensec-git/Pi-Bolt'
license=('MIT')
depends=('libxcb')
optdepends=('ripgrep: native backend for the grep tool, instead of the built-in walker')
provides=('pi-bolt')
conflicts=('pi-bolt' 'pi-bolt-bin' 'pi-bolt-avx2-bin-release-git')
# The executable carries its JavaScript payload after the ELF section table, so
# strip discards it and leaves a bare Bun runtime reporting Bun's own version.
# Nothing here is compiled by makepkg, so there are no symbols to keep.
options=('!strip' '!debug')
install="${pkgname}.install"

_repo=opensec-git/Pi-Bolt
_release_url="https://github.com/${_repo}/releases/download/bolt-v${pkgver}"

# Runs only on CPUs with AVX2 (Intel Haswell, AMD Zen and later); there is no
# way to say that in depends=(). pi-bolt-bin carries the same program for any
# x86-64 and for ARM64. Both report their variant in --version.
_payload=pi-bolt-linux-x64
_label=linux-x64

source_x86_64=("${_payload}-${pkgver}.tar.xz::${_release_url}/${_payload}.tar.xz")
sha256sums_x86_64=('db1caa7f07a733a402677569fe44fda15c19a42402f0940d5a6934ebcc9df4da')

latestver() {
  git ls-remote --tags "https://github.com/${_repo}.git" 'bolt-v[0-9]*' |
    awk '{print $2}' | sed -e 's|^refs/tags/||' -e 's/\^{}$//' |
    sort -V -u | tail -1 | sed 's/^bolt-v//'
}

check() {
  # Without AVX2 the payload dies on SIGILL; makepkg's checksum already proved
  # its integrity, so the smoke test is skipped rather than failed.
  if ! grep -qw avx2 /proc/cpuinfo; then
    warning "builder CPU lacks AVX2: skipping --version smoke test"
    return 0
  fi

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
