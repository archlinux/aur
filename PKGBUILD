# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor:
pkgname=sensu
_pkgname=sensu-go
pkgver=2.0.0beta3.1
_pkgver=2.0.0-beta.3-1
pkgrel=2
pkgdesc="A monitoring framework that aims to be simple, malleable, and scalable."
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
makedepends=('go' 'nodejs' 'yarn' 'git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/${pkgname}/${_pkgname}#tag=${_pkgver}"
        "sensu.sysusers"
        "sensu.tmpfiles")
md5sums=('SKIP'
         '9181bba06fbc17b8596e3345abd0d97c'
         '08d250d9b908dc638f0491acac001fff')
_gourl=github.com/sensu/sensu-go

prepare(){
  # apply fix for yarn.lock
  cd "${srcdir}/sensu-go"
  git cherry-pick bc7cc911e37190512c4ff01f541da301e967003a

  mkdir -p "$srcdir/gopath/src/${_gourl}"
  rm -rf "$srcdir/gopath/src/${_gourl}"
  mv "${srcdir}/sensu-go" "$srcdir/gopath/src/${_gourl}"
}

build() {
  export GOPATH="${srcdir}/gopath"

  cd ${GOPATH}/src/${_gourl}
  ./build.sh build_cli
  ./build.sh build_agent
  ./build.sh build_backend
}

package() {
  install -Dm755 "${srcdir}/gopath/src/${_gourl}/bin/sensuctl" "$pkgdir/usr/bin/sensuctl"
  install -Dm755 "${srcdir}/gopath/src/${_gourl}/bin/sensu-agent" "$pkgdir/usr/bin/sensu-agent"
  install -Dm755 "${srcdir}/gopath/src/${_gourl}/bin/sensu-backend" "$pkgdir/usr/bin/sensu-backend"

  install -Dm644 "${srcdir}/gopath/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "${srcdir}/gopath/src/${_gourl}/packaging/files/backend.yml.example" "$pkgdir/etc/sensu/backend.yml.example"
  install -Dm644 "${srcdir}/gopath/src/${_gourl}/packaging/files/agent.yml.example" "$pkgdir/etc/sensu/agent.yml.example"

  install -Dm644 "${srcdir}/gopath/src/${_gourl}/packaging/services/sensu-backend/systemd/etc/systemd/system/sensu-backend.service" "$pkgdir/usr/lib/systemd/system/sensu-backend.service"
  install -Dm644 "${srcdir}/gopath/src/${_gourl}/packaging/services/sensu-agent/systemd/etc/systemd/system/sensu-agent.service" "$pkgdir/usr/lib/systemd/system/sensu-agent.service"

  install -Dm644 "${srcdir}/sensu.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "${srcdir}/sensu.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
