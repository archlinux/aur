# Maintainer: Paul Stemmet <aur@luxolus.com>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>

pkgname=open-consul
_commit=25957a17b5eddd1b95ebda13f8a667ec3c02b4c6
pkgver=1.16.4
pkgrel=2
pkgdesc="A tool for service discovery, monitoring and configuration."
provides=('consul')
conflicts=('consul')
arch=('x86_64')
url="https://developer.hashicorp.com/consul/docs/v1.16.x"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://git.st8l.com/luxolus/${pkgname}/archive/${_commit}.tar.gz"
        'consul.service'
        'consul.default'
        'consul.sysusers'
        'example.json')
install=consul.install
backup=('etc/default/consul')
sha512sums=('SKIP'
            'c70b9d1556f6c7ecb2e915ab685f289cef0e31198bd2e50c74a0483bbfb387beec67334f539a90adbf68b61b07946e98b300ab8a8e26e53b35f4ab4894adeb04'
            'ec5a800529a297c709fa383c094ecf106351cf0f8ac7b613b972d415d77fe001088902d7ab805e63e78a8e6360323fec1b795db5a4446df1e21b9b4ed31e7079'
            'ef872aedb2bc022a29292b7972a792b22e684c1ccb904a2b2cfec6d8966c28fb19be1452ce060821c419f1b646b236ba2e783175595e4bb6926d164c27a15c87'
            'c4292b8f56ee955ed7385a49843fd90d6434029891b3e1e724cb2fc841514c06e2554a26d3937c114371b18c2168c4e64319eb2cbd726ee8b35870df19089348')

export CGO_LDFLAGS="${LDFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"

export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

export XC_OSARCH='linux/amd64'

prepare() {
  cd "${srcdir}/${pkgname}"

  mkdir -p build

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -l -i "$srcdir/${filename##*/}"
    fi
  done

  go mod download
}

build() {
  cd "${srcdir}/${pkgname}"

  go build -o build ./...
}

check() {
  cd "${srcdir}/${pkgname}"

  # assert version number from commit hash matches pkgver metadata
  ./build/consul --version | head -1 | grep -qF -- "v${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}"

  # dirs
  install -D -m750 -o 208 -g 208 -d               "${pkgdir}/var/lib/consul"
  install -D -m755 -o   0 -g 208 -d               "${pkgdir}/etc/consul.d"

  # configuration
  install -D -m644  "${srcdir}/consul.default"    "${pkgdir}/etc/default/consul"
  install -D -m644  "${srcdir}/example.json"      "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
  install -D -m644  "LICENSE"                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644  "${srcdir}/consul.service"    "${pkgdir}/usr/lib/systemd/system/consul.service"
  install -D -m644  "${srcdir}/consul.sysusers"   "${pkgdir}/usr/lib/sysusers.d/consul.conf"

  # binaries
  install -Dm755    "build/consul"                "${pkgdir}/usr/bin/consul"
}

# vim:set ts=2 sw=2 et:
