# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="wuffs"
_pkgbase="${_gitname}"
pkgbase="${_pkgbase}-git"

pkgname=(
  "${_pkgbase}-lib-git"
  "${_pkgbase}-examples-git"
  "${_pkgbase}-fuzzers-git"
  "${_pkgbase}-lang-git"
  "${_pkgbase}-docs-git"
  "${_pkgbase}-license-git"
)

pkgdesc="A memory-safe programming language, and a standard library, for Wrangling Untrusted File Formats Safely. Wrangling includes parsing, decoding and encoding. Example file formats include images, audio, video, fonts and compressed archives."

pkgver=0.3.5+11.r3999.20260721.9d8285b5
pkgrel=2

arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
  'pentium4'
  'riscv64'
)
_githost='github.com'
_gituser='google'
url="https://${_githost}/${_gituser}/${_gitname}"
license=(
  "MIT"
  "Apache-2.0"
)
makedepends=(
  'gcc'   # Yes, it needs both clang and GCC!
  'gcc-libs'
  'glibc'
  'git'
  'go'
  "libxcb"
  "lz4"
  "sdl2"
  "sdl2_image"
  "xcb-util-image"
  "xcb-util-renderutil"
  "zlib"
  "zstd"
)

checkdepends=()

source=(
  "${_gitname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
  # "wuffs-build-all_disable-tests.patch"  # Not needed if we don't run build-all.sh.
  "wuffs-test-all.sh"
)
sha256sums=(
  'SKIP'  # Main upstream source.
  # '85cbe5911efa30fde54fc364aecf8f2d1e89f0cb387654127d020037caef447c'  # wuffs-build-all_disable-tests.patch
  '2cd9df1708364eb3db73c56beb5bd0400adef6d670033195c4647378ec612d29'  # wuffs-test-all.sh
)

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  cd "${srcdir}/${_gitname}"

  # for _patch in "${srcdir}"/wuffs-build-all_disable-tests.patch; do  # Not needed if we don't run build-all.sh.
  #   printf '%s\n' " -> Applying patch '$(basename "${_patch}")' ..."
  #   patch -Np1 --follow-symlinks -i "${_patch}"
  # done

  printf '%s\n' " --> running 'go get -v -modcacherw github.com/google/wuffs/cmd/...' ..."
  go get -v -modcacherw github.com/google/wuffs/cmd/...
  printf '\n'

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(git describe --tags | sed -E -e 's|^spin-in-||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"

  local _CFLAGSADDITIONS=""
  local _SILENCEWARNINGS=("stringop-overflow")
  local _warning
  for _warning in "${_SILENCEWARNINGS[@]}"; do
    _CFLAGSADDITIONS+=" -Wno-${_warning} -Wno-error=${_warning}"
  done
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/${_gitname}"

  # Excerpts from build-all.sh:
  printf '%s\n' " --> running 'go install -v -modcacherw github.com/google/wuffs/cmd/...' ..."
  go install -v -modcacherw github.com/google/wuffs/cmd/...
  printf '\n'
  printf '%s\n' " --> running 'wuffs gen -langs 'c'' ..."
  wuffs gen -langs 'c'
  printf '\n'
  printf '%s\n' " --> running 'wuffs genlib -ccompilers gcc -langs 'c' -skipgen' ..."
  wuffs genlib -ccompilers gcc -langs 'c' -skipgen
  printf '\n'
  printf '%s\n' " --> running './build-example.sh' ..."
  ./build-example.sh
  printf '\n'
  printf '%s\n' " --> running './build-fuzz.sh' ..."
  ./build-fuzz.sh
  printf '\n'
}

# ### 2026-08-03: `check()` Disabled, since `gen/bin/fuzz-pixel_swizzler` crashes with a segmentation fault.
# check() {
#   cd "${srcdir}/${_gitname}"
# 
#   "${srcdir}"/wuffs-test-all.sh
# }

package_wuffs-lib-git() {
  pkgdesc='A memory-safe standard library for Wrangling Untrusted File Formats Safely. Wrangling includes parsing, decoding and encoding. Example file formats include images, audio, video, fonts and compressed archives.'
  depends=(
    "glibc"
    "wuffs-license"
  )
  provides=(
    "wuffs-lib=${pkgver}"
    "libwuffs.so"
    "libwuffs.a"
  )
  conflicts=(
    "wuffs-lib"
  )
  optdepends=(
    "python-pywuffs:    For python binding."
    "wuffs-docs:        For the documentation of this software."
  )

  cd "${srcdir}/${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/include" release/c/*.c gen/c/*.c
  install -Dvm755 -t "${pkgdir}/usr/lib" gen/lib/c/gcc-dynamic/libwuffs.so
  install -Dvm644 -t "${pkgdir}/usr/lib" gen/lib/c/gcc-static/libwuffs.a

  install -Dvm644 -t "${pkgdir}/usr/share/doc/wuffs-lib" release/c/README.md

  install -dvm755 "${pkgdir}/usr/share/licenses"
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-lib-git
}

package_wuffs-examples-git() {
  pkgdesc='Example programmes for wuffs, a memory-safe programming language and standard library for Wrangling Untrusted File Formats Safely.'
  depends=(
    "gcc-libs"
    "glibc"
    "sdl2"
    "sdl2_image"
    "xcb-util-image"
    "xcb-util-renderutil"
    "wuffs-license"
  )
  provides=(
    "wuffs-examples=${pkgver}"
  )
  conflicts=(
    "wuffs-examples"
  )
  optdepends=(
    "wuffs-docs: For the documentation of this software."
  )

  cd "${srcdir}/${_gitname}"

  local _bins _bin
  _bins=`ls -1 gen/bin/example-*`
  for _bin in ${_bins}; do
    _name="$(basename "${_bin}" | sed -E -e 's|^example-||')"
    install -Dvm755 "${_bin}" "${pkgdir}/usr/bin"/wuffs-"${_name}"
  done

  install -Dvm644 -t "${pkgdir}/usr/share/doc/wuffs-examples" example/README.md

  install -dvm755 "${pkgdir}/usr/share/licenses"
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-examples-git
}

package_wuffs-fuzzers-git() {
  pkgdesc='Fuzzer programmes for wuffs, a memory-safe programming language and standard library for Wrangling Untrusted File Formats Safely.'
  depends=(
    "gcc-libs"
    "glibc"
    "wuffs-license"
  )
  provides=(
    "wuffs-fuzzers=${pkgver}"
  )
  conflicts=(
    "wuffs-fuzzers"
  )
  optdepends=(
    "wuffs-docs: For the documentation of this software."
  )

  cd "${srcdir}/${_gitname}"

  local _bins _bin
  _bins=`ls -1 gen/bin/fuzz-*`
  for _bin in ${_bins}; do
    _name="$(basename "${_bin}")"
    install -Dvm755 "${_bin}" "${pkgdir}/usr/bin"/wuffs-"${_name}"
  done

  install -Dvm644 -t "${pkgdir}/usr/share/doc/wuffs-fuzzers" fuzz/c/std/README.md

  install -dvm755 "${pkgdir}/usr/share/licenses"
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-fuzzers-git
}

package_wuffs-lang-git() {
  pkgdesc='A memory-safe programming language for Wrangling Untrusted File Formats Safely. Wrangling includes parsing, decoding and encoding. Example file formats include images, audio, video, fonts and compressed archives.'
  depends=(
    "wuffs-license"
  )
  provides=(
    "wuffs-lang=${pkgver}"
    "dumbindent=${pkgver}"
    "handsum=${pkgver}"
    "ractool=${pkgver}"
    "wuffs=${pkgver}"
    "wuffs-c=${pkgver}"
    "wuffsfmt=${pkgver}"
  )
  conflicts=(
    "wuffs-lang"
    "dumbindent"
    "handsum"
    "ractool"
    "wuffs"
    "wuffs-c"
    "wuffsfmt"
  )
  optdepends=(
    "glibc:      For 'ractool'."
    "liblz4.so:  For 'ractool'."
    "libz.so:    For 'ractool'."
    "libzstd.so: For 'ractool'."
    "wuffs-docs: For the documentation of this software."
  )

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  cd "${srcdir}/${_gitname}"

  install -Dvm755 -t "${pkgdir}/usr/bin"  "${GOBIN}"/{dumbindent,handsum,ractool,wuffs,wuffs-c,wuffsfmt}

  install -dvm755 "${pkgdir}/usr/share/licenses"
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-lang-git
}

package_wuffs-docs-git() {
  pkgdesc='Documentation for "Wuffs the Library" and "Wuffs the Language", as well as the corresponding example binaries.'
  depends=("wuffs-license")
  provides=(
    "wuffs-docs=${pkgver}"
  )
  conflicts=(
    "wuffs-docs"
  )
  optdepends=(
    "wuffs-lib:      The library this documentation is for."
    "wuffs-lang:     The programming language this documentation is for."
    "wuffs-examples: The example programmes this documentation is for."
    "wuffs-fuzzers:  The fuzzer programmes this documentation is for."
  )
  arch=('any')

  cd "${srcdir}/${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"  "${srcdir}"/git.log AUTHORS BUILD.md CONTRIBUTING.md CONTRIBUTORS README.md
  cp -rv doc "${pkgdir}/usr/share/doc/${_pkgbase}"/

  install -dvm755 "${pkgdir}/usr/share/licenses"
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-docs-git
}

package_wuffs-license-git() {
  pkgdesc='Common license for "Wuffs the Library" and "Wuffs the Language", as well as the corresponding example binaries.'
  depends=()
  provides=(
    "wuffs-license=${pkgver}"
  )
  conflicts=(
    "wuffs-license"
  )
  optdepends=(
    "wuffs-lib:      The library this license is for."
    "wuffs-lang:     The programming language this license is for."
    "wuffs-examples: The example programmes this license is for."
    "wuffs-fuzzers:  The fuzzer programmes this license is for."
  )
  arch=('any')

  cd "${srcdir}/${_gitname}"

  cd "${srcdir}/${_gitname}"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/wuffs"  LICENSE LICENSE-APACHE LICENSE-MIT
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-license-git
  ln -svr "${pkgdir}/usr/share/licenses/wuffs" "${pkgdir}/usr/share/licenses"/wuffs-license
}
