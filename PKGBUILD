# Maintainer: Paul Stemmet <aur@luxolus.com>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Sebastian Rakel <sebastian@devunit.eu>
# Contributor: Andrew Tyler <assimilat@gmail.com>

pkgname=open-vault
_commit='9f12e0f892b27c5518a918b15c46133cfdd2dff5'
pkgver=1.14.8
pkgrel=1
pkgdesc='A tool for managing secrets'
provides=('vault')
conflicts=('vault')
arch=('x86_64')
url="https://developer.hashicorp.com/vault/docs/v1.14.x"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git' 'yarn' 'bower' 'nodejs-lts-iron' 'npm' 'zip')
install=vault.install
backup=('etc/vault.hcl' 'etc/default/vault')
source=("${pkgname}-${pkgver}.tar.gz::https://git.st8l.com/luxolus/${pkgname}/archive/${_commit}.tar.gz"
        'vault.sysusers'
        'vault.tmpfiles'
        'vault.hcl')
sha512sums=('SKIP'
            '92616ccf83fa5ca9f8b0d022cf8ceb1f3549e12b66bf21d9f77f3eb26bd75ec1dc36c155948ec987c642067b85fbfc30a9217d6c503d952a402aa5ef63e50928'
            'db327aae6f821ee1ea608abdb3fc82aeeae72ce873d78ada44461644add32afd6c0197019427734498bc28ae187b6f741a02196e40a620caab597e5eef32ca7a'
            '75d654ec4eadfe983f57951d470fff8b9eb953b42c08e7b6b3a1baaa0721fd7a9d5be37480b0e4f4fd8518f375348bdd8394848f0fb27cb1d425279acb67f693')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"

export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

prepare() {
  cd "${srcdir}/${pkgname}"

  mkdir -p http/web_ui bin dist

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -l -i "$srcdir/${filename##*/}"
    fi
  done

  sed -i \
    's|/etc/vault.d/vault.hcl|/etc/vault.hcl|g' \
    .release/linux/package/usr/lib/systemd/system/vault.service
  sed -i \
    's|/etc/vault.d/vault.env|/etc/default/vault|g' \
    .release/linux/package/usr/lib/systemd/system/vault.service

  # Vault UI
  (
    cd "ui"

    yarn install
  )

  # Vault service
  (
    go mod download
  )
}

build() {
  cd "${srcdir}/${pkgname}"

  # Vault UI
  (
    cd "ui"

    npm rebuild node-sass ; yarn run build
  )

  # Vault service
  (
    local _flags=github.com/hashicorp/vault/sdk/version
    local _ldflags=(
      "-linkmode=external"
      "-compressdwarf=false"
      $(
        printf -- "-X ${_flags}.%s " \
          "Version=${pkgver}" \
          "GitCommit=${_commit}" \
          "BuildDate=$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
      )
    )

    go build -tags ui -ldflags "${_ldflags[*]}" -o dist .
  )
}

package() {
  cd "${srcdir}/${pkgname}"

  local file release='.release/linux/package'

  # configuration
  install -Dm644 "${srcdir}/vault.hcl"                "${pkgdir}/etc/vault.hcl"
  install -Dm644 "${srcdir}/vault.sysusers"           "${pkgdir}/usr/lib/sysusers.d/vault.conf"
  install -Dm644 "${srcdir}/vault.tmpfiles"           "${pkgdir}/usr/lib/tmpfiles.d/vault.conf"
  install -Dm644 \
    "$release/etc/vault.d/vault.env"                  "${pkgdir}/etc/default/vault"
  install -Dm644 \
    "$release/usr/lib/systemd/system/vault.service"   "${pkgdir}/usr/lib/systemd/system/vault.service"

  install -Dm644 "LICENSE"                            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for file in 'README.md' 'CHANGELOG.md'; do
    install -Dm644 "${file}"                          "${pkgdir}/usr/share/doc/${pkgname}/${file}"
  done

  # binaries
  install -Dm755 "dist/vault"                         "${pkgdir}/usr/bin/vault"
}
