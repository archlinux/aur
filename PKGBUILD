# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ergochat
_upstream_pkgname=ergo
pkgver=2.19.1
pkgrel=2
_pkgfeatures="i18n mysql postgresql sqlite"
pkgdesc="Modern IRC server written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ergo"
license=('MIT')
depends=('glibc')
optdepends=('ergochat-ldap: LDAP authentication support'
  'ergochat-dnsbl: DNSBL filtering'
  'mariadb: MariaDB backend for history storage'
  'sqlite: SQLite backend for history storage'
  'postgresql: PostgreSQL backend for history storage'
  'tor: Tor integration'
  'hopm: HOPM proxy scanner integration')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver"
  "config.patch"
  "systemd-service-unit.patch"
  "ergochat.sysusers"
  "ergochat.tmpfiles")
sha512sums=('147ae466ed2c08be06ce70a25c8e35702e07e78439a810194a75d719af625f87f2316cae5d4fb2350a666ce1e242b4c3b713816d2df6f1d6810e19cedc0be522'
  'b886a78d3c1cf9c7bfbb1313577b1bb6e541c080df66ed79132eb6f2f565277e8731896f5d1ea3326fc28fec4b671e11e861a794aaade249a55f120a046fed23'
  'dc69aa579bb294e99605c1d9f9cf325c8093e8794a15d56293d7d730fe72b3a15ae1ba2f888935d081d32181c4287427dade70058e1bcefcb77e59f5d2521241'
  'bfb225680bdcda6b3bb66f98042984ced23dd7bfece088118bdf7612190945168e94b5184a3c96d3769d363b5c817c42ebeb51aac838ab7e99137e34abd7c877'
  '3093c832962bb5e69036821f1db4165f92c59ee49c450d1fe3abef503a56d8fa4d12fd23d230ceab4eb207efdcd46202703ebe58b37dff60bb87581f5826f812')
b2sums=('da81c6f5e90d96fa61ba4bde68f205044cd3d6fe1f61032f579fd52aa969404941537928985c63cd90ff7fca6a4a11dc5b2a3bccc2bc6758683939dca223349d'
  'aa2a5e5eceaed3b47205ba7af373b9a400aba672c0d9c2d2dc3917701f5225879344416bd3da248380355b16dcbc4c8e616767e2732da28d8bb5a04e3b5f9a53'
  '2ec758b9adf4abf9cac33dca9375334493cdb101454c907a2742248b2127b75abf9d42e7f4d696844edbc22decf1b5d245ed26a2921adc0f374ba849393f20a7'
  'fad48b41ab4465dad7e196e79ee52a0854fe8b5effe8bedf709e20409452de5f7556e0ed3fc1e69cb6a22907c5c8e14e442ce2454d9878bb46d89cf17de4aac5'
  '0d3a5fbc2e0a9a3752a5a17299e7603a5f4f1781c5d8981ecb27ef219bbd6b201d80adbe9e6a1a85be5e2635045fcf3b336b84c075da15c885a68317a30144b9')
backup=("etc/$pkgname/ircd.yaml"
  "etc/$pkgname/ircd.motd")

prepare() {
  cd "$srcdir/$_upstream_pkgname" || exit
  patch --backup <../config.patch

  cd "$srcdir/$_upstream_pkgname/distrib/systemd" || exit
  patch --backup <../../../systemd-service-unit.patch
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "${srcdir}/$_upstream_pkgname" || exit

  GIT_COMMIT="$(git rev-parse HEAD 2>/dev/null)"

  # flags from https://wiki.archlinux.org/index.php/Go_package_guidelines
  # to address issues namcap warns about:
  #   ergo W: ELF file ('usr/bin/ergo') lacks FULL RELRO, check LDFLAGS.
  #   ergo W: ELF file ('usr/bin/ergo') lacks PIE.
  # related: https://bugs.archlinux.org/task/60928
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -tags "$_pkgfeatures" \
    -ldflags "-X main.commit=${GIT_COMMIT} -compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
    -v \
    .

  rm languages/README.md
  rm -rf languages/example
}

check() {
  export GOPATH="$srcdir/gopath"
  cd "${srcdir}/$_upstream_pkgname" || exit

  go test ./...
}

package() {
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$srcdir/$_upstream_pkgname" || exit
  install -Dm644 "distrib/systemd/$_upstream_pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm755 -d "$pkgdir/usr/share/$pkgname/i18n"
  cp languages/* "$pkgdir/usr/share/$pkgname/i18n/"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 "$_upstream_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 default.yaml "$pkgdir/etc/$pkgname/ircd.yaml"
  install -Dm644 "$_upstream_pkgname".motd "$pkgdir/etc/$pkgname/ircd.motd"
}
