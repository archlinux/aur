# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase=tls-client
pkgbase="${_pkgbase}-git"
pkgname=("golang-${_pkgbase}-git" "lib-${_pkgbase}-git")
pkgver=1.3.4.r163.20230218.46e88e3
pkgrel=1
pkgdesc="An advanced HTTP library based on requests and tls-client."
arch=(
  'aarch64'
  'amd64'
  'x86_64'
)
_gitserver='github.com'
_gitauthor='bogdanfinn'
_gitproject="${_pkgbase}"
url="https://${_gitserver}/${_gitauthor}/${_gitproject}"
license=('custom: dontcare')
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
  'license-dontcare.txt'
)
sha256sums=(
  'SKIP'
  '8b45a1a51ac8989701a6119ef5ce0aa081dc4edd88132cf82f29d741a423a8f9'
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

  # go build -x -v -o build ./... # This would only build examples and ??

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

package_golang-tls-client-git() {
  pkgdesc="An advanced HTTP library based on requests and tls-client (Go module)."
  arch=(
    'any'
  )
  depends=()
  optdepends=(
    'bash: For build scripts.'
  )
  provides=(
    "golang-tls-client=${pkgver}"
  )
  conflicts=(
    "golang-tls-client"
  )

  cd "${srcdir}/${_pkgbase}"

  install -d -v -m755 "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"
  cp -rv *.go *.mod *.sum cffi_src cffi_dist shared tests test-all.sh "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"/
  rm -rv "${pkgdir}/usr/share/gocode/src/${_gitserver}/${_gitauthor}/${_gitproject}"/cffi_dist/{*.so,*.h,dist,Dockerfile*,example*}

  for _docfile in "Readme.md"; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/golang-tls-client/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/golang-tls-client/git.log"
  install -d -v -m755                               "${pkgdir}/usr/share/doc/golang-tls-client/examples"
  cp -rv example/*                                  "${pkgdir}/usr/share/doc/golang-tls-client/examples"/

  install -D -v -m644 "${srcdir}/license-dontcare.txt" "${pkgdir}/usr/share/licenses/golang-tls-client-git/license-dontcare.txt"
  ln -svf "/usr/share/licenses/golang-tls-client-git/license-dontcare.txt"  "${pkgdir}/usr/share/doc/golang-tls-client/license-dontcare.txt"
  # install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${golang-tls-client-git}/LICENSE"
  # ln -svf "/usr/share/licenses/${golang-tls-client-git}/LICENSE"  "${pkgdir}/usr/share/doc/${golang-tls-client}/LICENSE"
}

package_lib-tls-client-git() {
  pkgdesc="An advanced HTTP library based on requests and tls-client (shared library and include file)."
  arch=(
    'aarch64'
    'amd64'
    'x86_64'
  )
  depends=(
    'glibc'
  )
  optdepends=(
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

  install -D -v -m644 "cffi_dist/tls-client.so" "${pkgdir}/usr/lib/tls-client.so"
  install -D -v -m644 "cffi_dist/tls-client.h" "${pkgdir}/usr/include/tls-client.h"

  for _docfile in "Readme.md"; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/lib-tls-client/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/lib-tls-client/git.log"
  install -d -v -m755                               "${pkgdir}/usr/share/doc/lib-tls-client/examples"
  cp -rv cffi_dist/example*                                  "${pkgdir}/usr/share/doc/lib-tls-client/examples"/

  install -D -v -m644 "${srcdir}/license-dontcare.txt" "${pkgdir}/usr/share/licenses/lib-tls-client-git/license-dontcare.txt"
  ln -svf "/usr/share/licenses/lib-tls-client-git/license-dontcare.txt"  "${pkgdir}/usr/share/doc/lib-tls-client/license-dontcare.txt"
  # install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${lib-tls-client-git}/LICENSE"
  # ln -svf "/usr/share/licenses/${lib-tls-client-git}/LICENSE"  "${pkgdir}/usr/share/doc/${lib-tls-client}/LICENSE"
}
