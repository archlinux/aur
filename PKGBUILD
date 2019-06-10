# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=ambientsound
_upstream_pkgname=pms
pkgname=pms-git
pkgver=0.42.r822.g000c5c0
pkgrel=1
pkgdesc="Practical Music Search is an interactive Vim-like console client for the Music Player Daemon."
arch=('x86_64')
groups=()
depends=()
makedepends=(
  "go"
  "git"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
license=("MIT")
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
# https://github.com/ambientsound/pms
source=("${_upstream_pkgname}::git+https://github.com/${_pkgauthor}/${_upstream_pkgname}.git"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "SKIP"
  "SKIP"
)


prepare() {
  # https://github.com/ambientsound/pms/blob/master/Makefile
  local OP="prepare"

  if [ "$PKGBUILD_DEBUG" = "true" ];
  then
	  cd "${srcdir}/${_upstream_pkgname}"

	  echo "pkgver: $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"

    echo "running function: $OP"
    echo "CWD: $CWD"
    echo "PWD: $PWD"
    echo "CI: $CI"
    echo "PKGBUILD_DEBUG: $PKGBUILD_DEBUG"
    echo "BUILDDIR: $BUILDDIR"
    echo "PKGDEST: $PKGDEST"
    echo "SRCDEST: $SRCDEST"
    echo "SRCPKGDEST: $SRCPKGDEST"
    echo "LOGDEST: $LOGDEST"
    echo "PACKAGER: $PACKAGER"
  fi

}

pkgver() {
	cd "${srcdir}/${_upstream_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  local OP="build"

  if [ "$PKGBUILD_DEBUG" = "true" ];
  then
    echo "running function: $OP"
    echo "CWD: $CWD"
    echo "PWD: $PWD"
    echo "CI: $CI"
    echo "PKGBUILD_DEBUG: $PKGBUILD_DEBUG"
    echo "BUILDDIR: $BUILDDIR"
    echo "PKGDEST: $PKGDEST"
    echo "SRCDEST: $SRCDEST"
    echo "SRCPKGDEST: $SRCPKGDEST"
    echo "LOGDEST: $LOGDEST"
    echo "PACKAGER: $PACKAGER"
  fi

  if [ "$PKGBUILD_DEBUG" = "true" ];
  then
    sed -i 's|go install -ldflags="-X main.buildVersion=${VERSION}"|CGO_ENABLED=0 go install -x -ldflags="-X main.buildVersion=${VERSION}"|' "$BUILDDIR/${pkgname}/src/${_upstream_pkgname}"/Makefile
    sed -i "s|go get|go get -v|" "$BUILDDIR/${pkgname}/src/${_upstream_pkgname}"/Makefile
    cat "$BUILDDIR/${pkgname}/src/${_upstream_pkgname}"/Makefile
  else
    sed -i 's|go install -ldflags="-X main.buildVersion=${VERSION}"|CGO_ENABLED=0 go install -ldflags="-X main.buildVersion=${VERSION}"|' "$BUILDDIR/${pkgname}/src/${_upstream_pkgname}"/Makefile
  fi

  cd "$BUILDDIR/${pkgname}/src/${_upstream_pkgname}" && make get-deps && make install

  if [ "$PKGBUILD_DEBUG" = "true" ];
  then
    ls -lhtra "$HOME/go/bin/${_upstream_pkgname}"
    file "$HOME/go/bin/${_upstream_pkgname}"
  fi

}

package() {
  install -Dm755 "$HOME/go/bin/${_upstream_pkgname}" "${pkgdir}/usr/bin/${_upstream_pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"
}
