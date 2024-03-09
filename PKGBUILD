# Maintainer: Helio Loureiro <helio@loureiro.eng.br>
pkgname=doh-relay-git
pkgver=1.0.0+beta.9.r87.20240222.f4d8f69
pkgrel=1
gittag=v1.0.0-beta.9
pkgdesc="DNS-over-HTTPS relay service."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/tinkernels/doh-relay"
license=('Apache-2.0')
depends=('go>=1.20')
makedepends=('go' 'git')
provides=("dnslookup=${pkgver}")
conflicts=("dnslookup")
source=('git+https://github.com/tinkernels/doh-relay.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/doh-relay"
  git checkout -b $gittag tags/$gittag

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

build(){
    cd "${srcdir}/doh-relay"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    go install -x -v -modcacherw -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p "${pkgdir}/usr/bin"

    if [ -v GOBIN ]; then
      _binpath="${GOBIN}"
    else
      _binpath="${srcdir}/gopath/bin"
    fi
    install "${_binpath}/doh-relay" "${pkgdir}/usr/bin/doh-relay"
}
