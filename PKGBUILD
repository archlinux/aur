# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>

pkgname=chihaya-git
_pkgname=chihaya
pkgver=r1050.be555c3
pkgrel=1
pkgdesc='Customizable, multi-protocol BitTorrent Tracker'
arch=('x86_64')
url='https://github.com/chihaya/chihaya'
license=('BSD')
options=('!strip')
source=("git+https://github.com/chihaya/chihaya.git"
        'chihaya.service'
        'chihaya.sysusers')
makedepends=('git'
             'go'
             'dep')
provides=('chihaya')
conflicts=('chihaya')
sha256sums=('SKIP'
            '5f2bdd78f224fc657ed69d46e0e08f400ab8932bba7d86a2a91fa7badc91c252'
            'de424d50a9de3a63f45b064f78aa74075e65ce0a9f8b6b5a6bc84d12fd0a3e11')

pkgver() {
  cd "${srcdir}/${_pkgname}"    
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir"
  mkdir -p src/github.com/chihaya/
  rm -rf src/github.com/chihaya/${_pkgname}
  mv "${_pkgname}" src/github.com/chihaya/
  
  export GOPATH="$srcdir"
  cd "${srcdir}/src/github.com/chihaya/${_pkgname}"
  dep ensure
  go install github.com/chihaya/chihaya/cmd/...
}

check()
{
  export GOPATH="$srcdir"
  cd "${srcdir}/src/github.com/chihaya/${_pkgname}"  
  go test -bench $(go list ./...)
}

package()
{
  # binaries
  install -Dsm755 $srcdir/bin/$_pkgname       "$pkgdir/usr/bin/$_pkgname"
  install -Dsm755 $srcdir/bin/${_pkgname}-e2e "$pkgdir/usr/bin/${_pkgname}-e2e"

  # example config
  install -Dm644 "$srcdir/src/github.com/chihaya/${_pkgname}/example_config.yaml" \
          "$pkgdir/etc/chihaya.yaml"

  # systemd integration
  install -Dm644 "${srcdir}/chihaya.service" \
          "${pkgdir}/usr/lib/systemd/system/chihaya.service"
  install -Dm644 "${srcdir}/chihaya.sysusers" \
          "${pkgdir}/usr/lib/sysusers.d/chihaya.conf"

  # license
  install -Dm644 "$srcdir/src/github.com/chihaya/${_pkgname}/LICENSE" \
          "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
