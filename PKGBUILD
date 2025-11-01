# Maintainer: vcup <me@vcup.moe>
# 'stalwart-mail.service' 'stalwart-mail.tmpfiles' 'stalwart-mail.sysusers' are copy and modified from 'https://gitlab.archlinux.org/archlinux/packaging/packages/stalwart-mail-server'

pkgbase=stalwart-bin
pkgname=('stalwart-mail' 'stalwart-cli')
pkgver=0.14.1
pkgrel=1
pkgdesc='All-in-one Mail & Collaboration server. Secure, scalable and fluent in every protocol (IMAP, JMAP, SMTP, CalDAV, CardDAV, WebDAV).'
arch=('x86_64' 'aarch64' 'arm' 'armv7')
url='https://github.com/stalwartlabs/stalwart'
license=('AGPL-3.0-only' 'LicenseRef-SEL')
_download_url="${url}/releases/download/v$pkgver"
_platform=linux-gnu
source=(
  "stalwart-v$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  "stalwart-v$pkgver-${CARCH}-unknown-${_platform}.tar.gz::${_download_url}/stalwart-${CARCH}-unknown-${_platform}.tar.gz"
  "stalwart-cli-v$pkgver-${CARCH}-unknown-${_platform}.tar.gz::${_download_url}/stalwart-cli-${CARCH}-unknown-${_platform}.tar.gz"
  'stalwart-mail.service'
  'stalwart-mail.sysusers'
  'stalwart-mail.tmpfiles'
)
sha512sums=(
  '844db6c54a4b5d20facc97a675ec7ff3a565bb0936e53e6f14661bdfd4dc248879657f0d71e842aa8f0d569af014261111c210a4267cc4102bb02dd61ae3a686'
  'c8fca16e7cffb0bedfa6ef0d34192b118d323c53130a003b8b6fb917f46bd222f2a0cd0fc64801f7aa2decba6eed468df51eafcf2b01c08a040296d3e685cc4e'
  '2ef4e53716fbef6006bc69175645a8a18e3aae8d57f73b97a9d7d0e326a39ed8a09f5f32aa6ea4763ee5b7f1dc054ebdee355f53dbd79d72b41c987753f40a36'
  '32e9718f9bc8ddf63f92d10c0a9b03ba7b1f6582682876c06cd9ae971e7be5e08593b9df4692828bde17f9317ea37d17ba9469940d000344f89bd6c216e084ee'
  '547d97e94931079b06e3da459313b16467986d37eb8688210a6f6eff974dbdf60383217ea65d6f306eb81958b9c5eab72648e7645d95cf83ca418b8791f899f8'
  'dcbd241ab98a37cf900d22b418f0e757db6b0b4d4133a55343794d1655e77a4c372a9d754f8ee977766ab5e77b12de6b9eff4dbebddc6e9ba5d5185af4b4190c'
)

package_stalwart-mail() {
  conflicts=('stalwart-mail-server')
  pkgdesc='Stalwart Mail and Collaboration Server'
  optdepends=(
    'mariadb: for using MariaDB as storage backend on the same host'
    'postgresql: for using PostgreSQL as storage backend on the same host'
    'redis: for using Redis as lookup storage backend on the same host'
    'sqlite: for using SQLite as storage backend on the same host'
    'stalwart-cli: for using the CLI to the mail server on the same host'
  )

  backup=('etc/stalwart-mail/config.toml')
  install=$pkgname.install

  declare -A _files
  _files=(
    ["stalwart"]="usr/bin/stalwart:755:0:0"
    ["stalwart-$pkgver/resources/config/config.toml"]="etc/stalwart-mail/config.toml:600:0:0"
    ["stalwart-mail.service"]="usr/lib/systemd/system/stalwart-mail.service:644:0:0"
    ["stalwart-mail.sysusers"]="usr/lib/sysusers.d/${pkgname}.conf:644:0:0"
    ["stalwart-mail.tmpfiles"]="usr/lib/tmpfiles.d/${pkgname}.conf:644:0:0"
    ["stalwart-$pkgver/CHANGELOG.md"]="usr/share/doc/$pkgname/CHANGELOG.md:644:0:0"
    ["stalwart-$pkgver/CONTRIBUTING.md"]="usr/share/doc/$pkgname/CONTRIBUTING.md:644:0:0"
    ["stalwart-$pkgver/README.md"]="usr/share/doc/$pkgname/README.md:644:0:0"
    ["stalwart-$pkgver/SECURITY.md"]="usr/share/doc/$pkgname/SECURITY.md:644:0:0"
    ["stalwart-$pkgver/SECURITY_PROCESS.md"]="usr/share/doc/$pkgname/SECURITY_PROCESS.md:644:0:0"
    ["stalwart-$pkgver/UPGRADING.md"]="usr/share/doc/$pkgname/UPGRADING.md:644:0:0"
  )

  for source_file in "${!_files[@]}"; do
    target_file="$(cut -f 1 -d ':' <<< "${_files[$source_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${_files[$source_file]}")"
    user="$(cut -f 3 -d ':' <<< "${_files[$source_file]}")"
    group="$(cut -f 4 -d ':' <<< "${_files[$source_file]}")"
    install -Dm "$mode" -o "$user" -g "$group" "${srcdir}/${source_file}" "${pkgdir}/${target_file}"
  done
}

package_stalwart-cli() {
  conflicts=('stalwart-mail-server')
  pkgdesc='Stalwart Server CLI'
  declare -A _files
  _files=(
    ["stalwart-cli"]="usr/bin/stalwart-cli:755:0:0"
    ["stalwart-$pkgver/CHANGELOG.md"]="usr/share/doc/$pkgname/CHANGELOG.md:644:0:0"
    ["stalwart-$pkgver/CONTRIBUTING.md"]="usr/share/doc/$pkgname/CONTRIBUTING.md:644:0:0"
    ["stalwart-$pkgver/README.md"]="usr/share/doc/$pkgname/README.md:644:0:0"
    ["stalwart-$pkgver/SECURITY.md"]="usr/share/doc/$pkgname/SECURITY.md:644:0:0"
    ["stalwart-$pkgver/SECURITY_PROCESS.md"]="usr/share/doc/$pkgname/SECURITY_PROCESS.md:644:0:0"
    ["stalwart-$pkgver/UPGRADING.md"]="usr/share/doc/$pkgname/UPGRADING.md:644:0:0"
  )

  for source_file in "${!_files[@]}"; do
    target_file="$(cut -f 1 -d ':' <<< "${_files[$source_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${_files[$source_file]}")"
    user="$(cut -f 3 -d ':' <<< "${_files[$source_file]}")"
    group="$(cut -f 4 -d ':' <<< "${_files[$source_file]}")"
    install -Dm "$mode" -o "$user" -g "$group" "${srcdir}/${source_file}" "${pkgdir}/${target_file}"
  done
}

