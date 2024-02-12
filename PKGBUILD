# Maintainer: Paul Stemmet <aur@luxolus.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=open-nomad
_commit=6d44ce9f0914871a22403dfe24efaf0ad9148709
pkgver=1.6.5
pkgrel=1
pkgdesc='A simple and flexible workload orchestrator'
provides=('nomad')
conflicts=('nomad')
arch=('x86_64')
url='https://developer.hashicorp.com/nomad/docs/v1.6.x'
license=('MPL2')
depends=('glibc' 'gcc-libs' 'iptables')
makedepends=('go')
optdepends=('docker: for docker driver'
            'java-runtime: for java driver'
            'java-runtime-headless: for java driver - headless'
            'qemu: for qemu driver'
            'nomad-driver-nspawn: for systemd-nspawn driver'
            'nomad-driver-podman: for podman driver'
            'nomad-driver-lxc: for lxc driver'
            'nomad-driver-containerd: for containerd driver')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://git.st8l.com/luxolus/${pkgname}/archive/${_commit}.tar.gz"
        'systemd.service'
        'tmpfiles.conf'
        'defaults.hcl')
backup=('etc/nomad.d/defaults.hcl')
sha512sums=('SKIP'
            '4fe233272e6872cb9ec0c594944a3c701d93ee59952688a4bc45b126442ecf973d23e50b3c4c9c5c62778d0c555ace2e2781955448239249d39fe21d184c8f1b'
            '398724820ee6f1ffa7860b8dd0013b671ba97ffb001331a10e7795148e3e6ff711a06f2156187c23b71bfccb13dac70828df5a29d59441706753cc17afd1e3d7'
            '9bc9dc93b2683c848e94d5d7a59102ceebd6c4b64f14c85591b9502bc44e3c74589425f1f278ef21407d10c4a9a82abd95e2c748d347d76836bdb741bbff7f7c')

export CGO_LDFLAGS="${LDFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"

export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

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

  local _BUILD_TAGS=('ui' 'release')
  local _LDFLAGS=(
    '-linkmode external'
    '-compressdwarf=false'
    "-X main.GitCommit=${pkgver}"
  )

  go build -v \
    -tags "${_BUILD_TAGS[*]}" \
    -ldflags "${_LDFLAGS[*]}" \
    -o build \
    .
}

package() {
  cd "${srcdir}/${pkgname}"

  # configuration
  install -D -m644 -t   "${pkgdir}/etc/nomad.d"       "${srcdir}/defaults.hcl"
  install -D -m644      "${srcdir}/systemd.service"   "${pkgdir}/usr/lib/systemd/system/nomad.service"
  install -D -m644      "${srcdir}/tmpfiles.conf"     "${pkgdir}/usr/lib/tmpfiles.d/nomad.conf"

  install -D -m644      "LICENSE"                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # binaries
  install -D -m755      "build/nomad"                 "${pkgdir}/usr/bin/nomad"
}
