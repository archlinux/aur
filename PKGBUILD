# Maintainer:  ramen <hendrikschick@hndrkk.sh>
pkgname=gomatrix-git
_pkgname=gomatrix
pkgver=101.0.0.r2.gb3aff13
pkgrel=3
pkgdesc='gomatrix connects to the The Matrix and displays its data streams in your terminal'
arch=('x86_64')
url='https://github.com/GeertJohan/gomatrix'
license=('BSD-2')
makedepends=('go' 'git')
source=('https://github.com/GeertJohan/gomtrix/releases/tag/v$pkgver')
provides=('gomatrix')
conflicts=('gomatrix')

source=(
  "${_pkgname}::git+https://github.com/GeertJohan/gomatrix#branch=${BRANCH:-master}"
)

md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  export GOPATH="${srcdir}/gopath"
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  echo ":: Building binary"
  go build -o build ./...
}


package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname 
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD-2"
}

