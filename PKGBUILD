# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase=tls-client

_gitservice='github'
_gittld='com'
_gitserver="${_gitservice}.${_gittld}"
_gitauthor='bogdanfinn'
_gitproject="${_pkgbase}"

pkgbase="${_pkgbase}-git"
pkgname=("golang-${_gitservice}-${_gitauthor}-${_pkgbase}-git" "lib-${_pkgbase}-git")
pkgver=1.3.5.r168.20230224.ec493f9
_releasever="$(awk -F. '{print $1"."$2"."$3}' <<<"${pkgver}")"
pkgrel=1
pkgdesc="Go module and shared library providing a TLS Client is built upon https://github.com/Carcraftz/fhttp and https://github.com/Carcraftz/utls."
arch=(
  'aarch64'
  'amd64'
  'x86_64'
)
url="https://${_gitserver}/${_gitauthor}/${_gitproject}"
license=('custom')
makedepends=(
  'git'
  'go>=1.18'
)
# checkdepends=(
#   'go>=1.18'
#   'nodejs'
#   'nvm'
#   'python>=3'
# )
source=(
  "${_pkgbase}::git+${url}.git"
  "${_pkgbase}.pc.in"
)
sha256sums=(
  'SKIP'                                                             # main source: git+${url}.git
  '082b1fb28aa31320960d5f523dc2419f09958602577ed3f5184f5bb55896a2bc' # ${_pkgbase}.pc.in
)

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgbase}"
  export GOPATH="${srcdir}/go"
  # export GOPATH="${srcdir}/go:/usr/share/gocode:/usr/share/gocode/src"

  git log > "${srcdir}/git.log"

  # Don't download main source dependencies, since we don't compile anyway (this is only a library).
  # go get # Download dependencies
  # go mod tidy
  # mkdir -p build

  # This is for the shared C library, this we want to compile.
  cd cffi_dist
  go get # Download dependencies
  go mod tidy
}

build() {
  cd "${srcdir}/${_pkgbase}"
  export GOPATH="${srcdir}/go"
  # export GOPATH="${srcdir}/go:/usr/share/gocode:/usr/share/gocode/src"

  sed -E -e "s|%%LIBVER%%|${_releasever}|g" "${srcdir}/${_pkgbase}.pc.in" > "${srcdir}/${_pkgbase}.pc"

  # go build -x -v -o build ./... # This would only build examples and ??

  go build -x -v ./tests

  cd cffi_dist
  go build -x -v -buildmode=c-shared -o tls-client.so
}

# check() {
#   cd "${srcdir}/${_pkgbase}"
#   export GOPATH="${srcdir}/go"
# 
#   # go test -x -v ./...
# 
#   # ./test-all.sh
# 
#   # cd tests
#   # go test -x -v
# }

package_golang-github-bogdanfinn-tls-client-git() {
  pkgdesc="Go module providing a TLS Client is built upon https://github.com/Carcraftz/fhttp and https://github.com/Carcraftz/utls."
  arch=(
    'any'
  )
  depends=()
  optdepends=(
    'bash: For build scripts.'
    'go: To compile software using this module, and for examples.'
  )
  provides=(
    "golang-github-bogdanfinn-tls-client=${pkgver}"
  )
  conflicts=(
    "golang-github-bogdanfinn-tls-client"
  )
  replaces=(
    'golang-tls-client-git'
    'golang-bogdanfinn-tls-client-git'
  )

  cd "${srcdir}/${_pkgbase}"

  install -d -v -m755 "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"
  cp -rv *.go *.mod *.sum cffi_src cffi_dist shared tests  "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"/
  if [ -e "test-all.sh" ]; then
    install -D -v -m775 test-all.sh                        "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"/test-all.sh
  fi
  rm -rv "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"/cffi_dist/{*.so,*.h,dist,Dockerfile*,example*}

  for _docfile in "Readme.md"; do
    install -D -v -m644 "${_docfile}"                      "${pkgdir}/usr/share/doc/golang-github-bogdanfinn-tls-client/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"                  "${pkgdir}/usr/share/doc/golang-github-bogdanfinn-tls-client/git.log"
  install -d -v -m755                                      "${pkgdir}/usr/share/doc/golang-github-bogdanfinn-tls-client/examples"
  cp -rv example/*                                         "${pkgdir}/usr/share/doc/golang-github-bogdanfinn-tls-client/examples"/

  install -D -v -m644 LICENSE                              "${pkgdir}/usr/share/licenses/golang-github-bogdanfinn-tls-client-git/LICENSE"
  ln -svf "/usr/share/licenses/golang-github-bogdanfinn-tls-client-git/LICENSE"  "${pkgdir}/usr/share/doc/golang-github-bogdanfinn-tls-client/LICENSE"
}

package_lib-tls-client-git() {
  pkgdesc="Shared library providing a TLS Client is built upon https://github.com/Carcraftz/fhttp and https://github.com/Carcraftz/utls."
  arch=(
    'aarch64'
    'amd64'
    'x86_64'
  )
  depends=(
    'glibc'
    ### Even if the below mentioned `golang-` packages are installed and `$GOPATH` contains `/usr/share/gocode` and `/usr/share/gocode/src`, they are beeing downloaded nevertheless.
    # 'golang-golang-x-crypto'
    # 'golang-golang-x-net'
    # 'golang-golang-x-sys'
    # 'golang-golang-x-term'
    # 'golang-golang-x-text'
    # 'golang-golang-x-tools'
  )
  optdepends=(
    'nodejs: For some examples.'
    'python: For some examples.'
    'python-psutil: For some examples.'
  )
  provides=(
    "lib-tls-client=${pkgver}"
    'tls-client.so'
  )
  conflicts=(
    "lib-tls-client"
  )

  cd "${srcdir}/${_pkgbase}"

  install -D -v -m644 "cffi_dist/tls-client.so"              "${pkgdir}/usr/lib/tls-client.so"
  install -D -v -m644 "cffi_dist/tls-client.h"               "${pkgdir}/usr/include/tls-client.h"

  install -D -v -m644 "${srcdir}/${_pkgbase}.pc"             "${pkgdir}/usr/share/pkgconfig/${_pkgbase}.pc"

  for _docfile in "Readme.md"; do
    install -D -v -m644 "${_docfile}"                        "${pkgdir}/usr/share/doc/lib-tls-client/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"                    "${pkgdir}/usr/share/doc/lib-tls-client/git.log"
  install -d -v -m755                                        "${pkgdir}/usr/share/doc/lib-tls-client/examples"
  cp -rv cffi_dist/example*                                  "${pkgdir}/usr/share/doc/lib-tls-client/examples"/

  install -D -v -m644 LICENSE                                "${pkgdir}/usr/share/licenses/lib-tls-client-git/LICENSE"
  ln -svf "/usr/share/licenses/lib-tls-client-git/LICENSE"   "${pkgdir}/usr/share/doc/lib-tls-client/LICENSE"
}
