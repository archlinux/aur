pkgname=gomatrix-git
_pkgname=gomatrix
pkgver=101.0.0.r2.gb3aff13
pkgrel=1
pkgdesc='gomatrix connects to the The Matrix and displays its data streams in your terminal'
arch=('x86_64')
url='git+https://github.com/GeertJohan/gomatrix'
license=('BSD-2')
makedepends=('go' 'git')
source=('https://github.com/GeertJohan/gomtrixz/releases/tag/v$pkgver')
provides=('gomatrix')
conflicts=('gomatrix')

source=(
  "${_pkgname}::git+https://github.com/GeertJohan/gomatrix#branch=${BRANCH:-master}"
)

md5sums=(
  'SKIP'
)

prepare(){
  cd "$_pkgname"
  mkdir -p build/
  chmod u+w -R "$GOPATH"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


check() {
  cd "$_pkgname"
  go test ./...
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgname}"

  if [ -L "${srcdir}/${_pkgname}" ]; then
    rm "${srcdir}/${_pkgname}" -rf
    mv "${srcdir}/go/src/${_pkgname}/" "${srcdir}/${_pkgname}"
  fi

  rm -rf "${srcdir}/go/src"

  mkdir -p "${srcdir}/go/src"

  export GOPATH="${srcdir}/go"

  mv "${srcdir}/${_pkgname}" "${srcdir}/go/src/"

  cd "${srcdir}/go/src/${_pkgname}/"
  ln -sf "${srcdir}/go/src/${_pkgname}/" "${srcdir}/${_pkgname}"

  echo ":: Updating git submodules"
  git submodule update --init

  echo ":: Building binary"
  go get -v \
    -gcflags "-trimpath $GOPATH/src"
}


package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/etc

  find "${srcdir}/go/bin/" -type f -executable | while read filename; do
    install -Dm 755 "${filename}" "${pkgdir}/usr/bin/$(basename ${filename})"
  done

  find "${srcdir}/go/src/${_pkgname}" -name "LICENSE" -type f | while read filename; do
    if [ "$(basename ${filename})" == "LICENSE" ]; then
        install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD-2"
    fi
  done

  chmod u+w -R "$GOPATH"
}

