# Maintainer:  dreieck
# Contributor: buckket <felix+arch at buckket dot org>
# Contributor: tippfehlr <tippfehlr at tippfehlr dot eu>

# Need a special download agent for 'git-lfs', otherwise source code checkout fails with  
# ```
# Downloading .github/logo.afdesign (19 KB)
# Error downloading object: .github/logo.afdesign (f6acf1c): Smudge error: Error downloading .github/logo.afdesign (f6acf1c9e8ed0165eeca4eb354ac370e773578b09fd9fb981d0cc2b8df47f652): error transferring "f6acf1c9e8ed0165eeca4eb354ac370e773578b09fd9fb981d0cc2b8df47f652": [0] remote missing object f6acf1c9e8ed0165eeca4eb354ac370e773578b09fd9fb981d0cc2b8df47f652
# ```  
# See also [this forum thread](https://bbs.archlinux.org/viewtopic.php?id=250669).

VCSCLIENTS+=('git-lfs::git-lfs')

_pkgname=autorestic
pkgname="${_pkgname}-git"
pkgver=1.8.3+14.r545.20250831.9cf919b
pkgrel=1
pkgdesc='Config driven, easy backup cli for restic. Latest git checkout.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/$_pkgname"
license=('Apache-2.0')
depends=(
  'glibc'
  'restic'
)
makedepends=(
  'git'
  'git-lfs'
  'go'
  'makepkg-git-lfs-proto'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-doc"
)
source=("${_pkgname}::git-lfs+${url}.git")
sha256sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOCACHE="${GOPATH}/cache"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOENV="${GOPATH}/env"
  export GOBIN="${GOPATH}/bin"

  cd "${srcdir}/${_pkgname}"
  mkdir -p build/

  # download go modules so build() works offline
  #go mod download -x
  go get -v ./...

  # Add write permission to downloaded go files so that downloaded files can be removed again.
  chmod -R ug+Xwr "${GOPATH}"

  git log > "${srcdir}/git.log"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
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
  export GOCACHE="${GOPATH}/cache"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOENV="${GOPATH}/env"
  export GOBIN="${GOPATH}/bin"

  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build

  for shell in bash zsh fish; do
    ./build/"${_pkgname}" completion "${shell}" > "build/${shell}_completion"
  done
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 "build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  install -Dvm644 "build/bash_completion" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dvm644 "build/zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dvm644 "build/fish_completion" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/git.log" CHANGELOG.md DEVELOPMENT.md README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"

  cp -rv docs/pages "${pkgdir}/usr/share/doc/${_pkgname}/docs"
}
