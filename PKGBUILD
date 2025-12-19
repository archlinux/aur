# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-snmp-exporter-git
_pkgname=snmp_exporter
pkgver=r985.7425fee
pkgrel=1
pkgdesc='Prometheus exporter for SNMP metrics'
arch=('x86_64')
url='https://github.com/prometheus/snmp_exporter'
license=('Apache-2.0')
depends=('glibc' 'net-snmp')
makedepends=('git' 'go')
backup=("etc/conf.d/$pkgname")
install='package.install'
options=('!lto')
source=(
  "git+${url}.git"
  "systemd.service"
  "sysusers.conf"
  "config.env"
)
provides=('prometheus-snmp-exporter')
conflicts=('prometheus-snmp-exporter')
sha512sums=('SKIP'
            '9ca53c18fe84d49cf283a402dc3162d0e6a2045f7030a7c05b9d31a39cc16e86557d49361d985e4993993cf59acbe65d12ebedeebdff87c87b647f49499ec321'
            '3bba31222b6fdc19a2df3d3ce08c4802816f8ec55b58f606c0b27c1aa8981a9fd4f0a78f99e1a815a00f698384f2b2012b5f74591b5259586ecc59eed2642830'
            '3cac11e6c0935b2c123a4ed85791fbab4585d35820e89baa927883619a03c3925876bdc5e385ac7df48f7adec8ee1082aaa347bce2ad6c237f7401eba58e2905')
b2sums=('SKIP'
        'ac862a1fecc719c04684836b0c0e0aaff93912ad09f676555fc3212dcb8fa93bd4569550247fb0aaca9e7083e6d4707ebd7f6332d28ab14ba0774625fc176737'
        '08c063a6626e53100e971f10437a9dc17eeb962bedcd6c9e746ae0d336205c68991518103e0ca393d3711ca4d4394d65574e9c611bcc98e61b9224d3b5d5d6a7'
        '88d48f0485a485a7840f9cc9aa6c5c3a0de2c28542bd77f16fa181772532287375e214f214bf925c30705a60ee48ebf15ac6ca707f58a7b3ed74984afb22aded')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # create directory for build output
  mkdir -p build/

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags \"${LDFLAGS}\" \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=main \
    -X github.com/prometheus/common/version.BuildUser=archlinux \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build \
    ./generator .
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/${pkgname/-git/}.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/${pkgname/-git/}.conf"
  install -vDm644 config.env "$pkgdir/etc/conf.d/${pkgname/-git/}"

  cd "${_pkgname}"

  # binaries
  install -vDm755 "build/$_pkgname" "$pkgdir/usr/bin/${pkgname/-git/}"
  install -vDm755 build/generator "$pkgdir/usr/bin/${pkgname/exporter-git}generator"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/${pkgname/-git/}" README.md auth-split-migration.md
  install -vDm644 snmp.yml "$pkgdir/usr/share/doc/${pkgname/-git/}/snmp_example.yml"
  install -vDm644 -t "$pkgdir/usr/share/doc/${pkgname/-git/}/generator" generator/{README.md,generator.yml}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/${pkgname/-git/}" LICENSE
}
