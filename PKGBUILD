# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="yeetfile"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}"
  "${pkgbase}-server"
)
pkgver=0.2.0
pkgrel=1
pkgdesc="A self-hosted service for encrypted file sharing and storage"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://yeetfile.com"
_url="https://github.com/benbusby/${pkgbase}"
license=(
  'AGPL-3.0-only'
)
makedepends=(
  'git'
  'go>=1.20'
  # 'typescript'
  'npm'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
  "benbusby-StreamSaver.js::git+https://github.com/benbusby/StreamSaver.js.git"
  "yeetfile-js::git+https://git.sr.ht/~benbusby/yeetfile-js"
)
sha256sums=('bbc0f9b364f35b5f4d0f538a467a8fa84d9cd13be85ac99e8d2dc997e3163f76'
            'SKIP'
            'SKIP')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.backend/static/stream_saver.url "${srcdir}/benbusby-StreamSaver.js"
  git config submodule.backend/static/js.url "${srcdir}/yeetfile-js"
  git -c protocol.file.allow=always submodule update

  # https://github.com/benbusby/yeetfile/commit/d3af0cbd1c85b630a38a5a09f1da93889b25efa8
  npm install --no-save typescript@5.5.4

  go mod download -modcacherw -x
  go mod verify

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  go run utils/generate_typescript.go ./web/ts
  # tsc --removeComments
  npx tsc --removeComments

  go build -v -tags "${pkgbase}"        -o "build/${pkgbase}"        ./cli
  go build -v -tags "${pkgbase}-server" -o "build/${pkgbase}-server" ./backend
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package_yeetfile-common() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_yeetfile() {
  pkgdesc+=" (CLI)"
  depends=(
    "${pkgbase}-common>=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

package_yeetfile-server() {
  pkgdesc+=" (server)"
  depends=(
    "${pkgbase}-common>=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
