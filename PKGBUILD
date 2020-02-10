# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=cni
pkgname=${_pkgname}-git
pkgver=r923.f69d1f2
pkgrel=1
pkgdesc="Specification and libraries for writing plugins to configure network interfaces in Linux containers"
conflicts=('cni')
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/cni"
license=('apache')
makedepends=('git' 'go')
depends=('glibc')
options=('!strip' '!emptydirs')
source=("${_pkgname}::git+https://github.com/containernetworking/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  if [ -L "$srcdir/$_pkgname" ]; then
    rm "$srcdir/$_pkgname" -rf
    mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
  fi

  rm -rf "$srcdir/go/src"

  mkdir -p "$srcdir/go/src"

  export GOPATH="$srcdir/go"

  mv "$srcdir/$_pkgname" "$srcdir/go/src/"

  cd "$srcdir/go/src/$_pkgname/"
  ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

  echo ":: Building binary"
  go get -v -gcflags "-trimpath $GOPATH/src" ./...
}

package() {
  find "$srcdir/go/bin/" -type f -executable | while read filename; do
    install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
  done

  find "${srcdir}/${_pkgname}/scripts/" -type f -executable | while read filename; do
    install -DT "${filename}" "${pkgdir}/opt/cni/$(basename $filename)"
  done

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
