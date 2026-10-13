# Maintainer: Tom Hale at hale dot ee
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
# Derived from the upstream installer:
# https://raw.githubusercontent.com/opensec-git/Pi-Bolt/refs/heads/pi-bolt/install.sh

pkgname=pi-bolt-avx2-bin-release-git
pkgver=0.8.5
pkgrel=1
pkgdesc='Pi coding agent, compiled ahead of time to native code (latest Git binary release, x86-64 with AVX2)'
arch=('x86_64')
url='https://github.com/opensec-git/Pi-Bolt'
license=('MIT')
# namcap: the bundled linux-platform-x11.node needs libxcb (the main pi binary
# needs only the implicit glibc toolchain).
depends=('libxcb')
makedepends=('git' 'openssl')
optdepends=(
  'fd: system-provided backend for the find tool'
  'ripgrep: system-provided backend for the grep tool'
  'tmux: for background bash capabilities'
)
provides=('pi-bolt' 'pi-bolt-bin' 'pi-bolt-git' 'pi-bolt-bin-git')
conflicts=('pi-bolt' 'pi-bolt-bin' 'pi-bolt-git' 'pi-bolt-bin-git'
           'pi-bolt-avx2' 'pi-bolt-avx2-bin' 'pi-bolt-avx2-git' 'pi-bolt-avx2-bin-git')
options=('!strip')
install=${pkgname}.install
# This asset needs AVX2 (Intel Haswell / AMD Zen and later, 2013+).
_variant=x64
# No baseline variant shipped. To support pre-AVX2 CPUs, publish a second AUR
# package named pi-bolt-bin-release-git: copy this PKGBUILD, set
# pkgname=pi-bolt-bin-release-git with _variant=x64-baseline below, keep the
# same pkgver()/prepare()/check() logic, and add a mutual conflicts entry
# with pi-bolt-avx2-bin-release-git (both install /usr/bin/pi-bolt).
# Upstream binary name inside the asset; differs from pkgname.
_pkgname=pi
_repo=opensec-git/Pi-Bolt
source=()
# Variant 1 (§3): binary-only -bin-release-git, no git clone.

# Release signing key (keys/release.pub upstream; cf. install.sh RELEASE_KEY).
_release_key='-----BEGIN PUBLIC KEY-----
MCowBQYDK2VwAyEAoLboJqtKaoISPqffk03vHZr+1sRBG3uIRIWeKOew+aY=
-----END PUBLIC KEY-----'

_update_and_cache_flag='update_and_cache'
# Allow download of versioned files in prepare().  build() must not download files
# Usually, pkgver() is called after prepare() and before build()
# Called from prepare() with arg: "${_update_and_cache_flag}" to write to file.
# With no argument (eg usual makepkg), print the version already cached.
pkgver() {
  local _pkgver_cache_file="${srcdir}/.pkgver"

  if [[ -e "${_pkgver_cache_file}" && $1 != "${_update_and_cache_flag}" ]]; then
    cat "${_pkgver_cache_file}" && return 0
  fi

  # Get the latest release's version
  # Nice side effect: tee removes the cache file if there's any error
  git ls-remote --tags "https://github.com/${_repo}.git" 'bolt-v[0-9]*' \
    | awk '{print $2}' | sed 's|^refs/tags/||; s/\^{}$//' \
    | sort -V -u | tail -1 | sed 's/^bolt-v//' | tee "${_pkgver_cache_file}"
}

prepare() {
  pkgver=$(pkgver "${_update_and_cache_flag}")  # pkgver() is usually only run after prepare()
  local _base="https://github.com/${_repo}/releases/download/bolt-v${pkgver}"
  cd "${srcdir}"

  # Download checksums and their own signature
  curl -fSL --retry 2 -o SHA256SUMS "${_base}/SHA256SUMS"
  curl -fSL --retry 2 -o SHA256SUMS.sig "${_base}/SHA256SUMS.sig"

  # Verify checksums
  # Anti-swap: the checksums must name this exact release (cf. install.sh check_release_version).
  [[ "$(head -n 1 SHA256SUMS)" == "# pi-bolt ${pkgver}" ]] || error "SHA256SUMS is not for Pi-Bolt ${pkgver}"
  # Ed25519 release signature (cf. install.sh verify_signature).
  printf '%s\n' "${_release_key}" > release.pub
  openssl pkeyutl -verify -pubin -inkey release.pub -rawin -in SHA256SUMS -sigfile SHA256SUMS.sig \
    || error 'release signature does not verify'

  # Build directly from the latest tag: the asset comes from the same
  # bolt-v${pkgver} release that pkgver() resolved above.
  local _asset="pi-bolt-linux-${_variant}.tar.xz"
  curl -fSL --retry 2 -o "${_asset}" "${_base}/${_asset}"
  grep " ${_asset}$" SHA256SUMS | sha256sum -c --quiet - || error "checksum mismatch: ${_asset}"
  tar --no-same-owner -xf "${_asset}"
}

check() {
  # Smoke-test the binary (cf. install.sh post-extract pi --version).
  # HOME is sandboxed: the TUI must not write outside ${srcdir} during checks.
  # A builder without AVX2 cannot execute this binary (SIGILL); its integrity
  # is already proven by the SHA256SUMS check in prepare().
  if ! grep -q ' avx2 ' /proc/cpuinfo 2>/dev/null; then
    echo 'builder CPU lacks AVX2: skipping --version smoke test'
    return 0
  fi
  HOME="${srcdir}/check-home" "${srcdir}/pi-bolt-linux-${_variant}/${_pkgname}" --version \
    | grep -q "Pi-Bolt ${pkgver}" \
    || error "binary does not report Pi-Bolt ${pkgver}"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/pi-bolt"
  # --no-preserve=ownership: plain -a chowns under fakeroot fail on this
  # payload (EINVAL on docs/, export-html/); --reflink=auto keeps CoW copies.
  cp -a --reflink=auto --no-preserve=ownership "${srcdir}/pi-bolt-linux-${_variant}/." "${pkgdir}/usr/lib/pi-bolt/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/pi-bolt/pi "${pkgdir}/usr/bin/pi-bolt"
  install -Dm644 "${pkgdir}/usr/lib/pi-bolt/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/pi-bolt/LICENSE.pi" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pi"
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
