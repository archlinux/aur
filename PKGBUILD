# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud
pkgname=opencloud-git
pkgver=7.1.0.r7.g4414bd0
pkgrel=1
pkgdesc="Open source platform for file management, sharing & collaboration - git build"
url="https://opencloud.eu"
arch=('aarch64' 'x86_64')
license=(Apache-2.0)
depends=(glibc sqlite)
makedepends=(
  git
  go
  pnpm
)
optdepends=("opencloud-web: if wanting to use a customized web interface")
install="opencloud.install"
backup=('etc/opencloud/opencloud.env')
conflicts=('opencloud' 'opencloud-bin')
provides=('opencloud')
source=(
  "git+https://github.com/opencloud-eu/opencloud.git"
  version-strings.patch
  opencloud.env
  opencloud.service
  opencloud.sysusers
  opencloud.tmpfiles
)
sha512sums=('SKIP'
            '861ab227953acb1fe8f687766cc46389c1c2d8ae7c80998e69ceb34907abdaa48ab473953fb67aa6b2c38251286af49827fdc73593d87cc1e080e63fab0c5d5d'
            '5e133e8d5037fd33c9a1ff915273a985fab7703b8f71979aef92bae4beac4e884d97ce27ee074576abf049a082712bcd3e2d6da2a45e20220fa385babc6826ac'
            '62e701e9630aae725ef978198cce706ffdaa6be02ce509ef5b0051cc6b01a9e8374431a9b6fc5189432d3ecfe25edcbb4cc934d8908b1c1ae773e2f6aa55b62d'
            'bd4c449165e0b314cde60437b30214286a0605ccf8ae233fa587d904c16f9225cb822d8636d182b11f91224aa42969f28fc99400b692c2265c47b51b49e2d188'
            'db82871e0f1e57cf852d4ad10116505c62b46d5dab5c87a15628847cdde16331e09cc7968ed7e1ad0bed266ba30e22b48a9673e2a334e6c7b1be709fe6fd986a')


pkgver() {
    cd "${_pkgname}"
    git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${_pkgname}"

  # ensure reproducible strings
  patch -p1 -i "$srcdir/version-strings.patch"
}

build() {
  cd ${_pkgname}

  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  # generate web assets
  make generate

  # generate binary
  make TAGS="disable_crypt libsqlite3" -C opencloud build

  # generate shell completions
  for shell in bash fish zsh; do
    ./opencloud/bin/opencloud completion "$shell" > "$shell.completion"
  done
}

package() {
  install -vDm755 "${_pkgname}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-server"

  # shell completions
  install -vDm644 ${_pkgname}/bash.completion "$pkgdir/usr/share/bash-completion/completions/opencloud"
  install -vDm644 ${_pkgname}/fish.completion "$pkgdir/usr/share/fish/vendor_completions.d/opencloud.fish"
  install -vDm644 ${_pkgname}/zsh.completion "$pkgdir/usr/share/zsh/site-functions/_opencloud"

  # systemd integration
  install -vDm640 -t "${pkgdir}/etc/${_pkgname}" "${_pkgname}.env"
  install -vDm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
