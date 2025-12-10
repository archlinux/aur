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

pkgver=0.4.0+alpha.9+49.r3887.20251111.072595ae
pkgrel=1

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
  'gcc'
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
)
sha256sums=(
  'SKIP'
)

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  cd "${srcdir}/${_gitname}"

  go get -v github.com/google/wuffs/cmd/...

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

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
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"

  cd "${srcdir}/${_gitname}"
  printf '%s\n' " --> building ..."

  ./build-all.sh
  #./build-example.sh
  #./build-fuzz.sh
  #go install -v ./cmd/wuffs*
  #wuffs gen
}

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

  install -dvm644 "${pkgdir}/usr/share/licenses"
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

  install -dvm644 "${pkgdir}/usr/share/licenses"
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

  install -dvm644 "${pkgdir}/usr/share/licenses"
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

  install -dvm644 "${pkgdir}/usr/share/licenses"
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

  install -dvm644 "${pkgdir}/usr/share/licenses"
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
