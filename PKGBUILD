# Contributor: Paul Mulders <justinkb at gmail dot com>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Maintainer: vcup <me@vcup.moe>

pkgname=sozu
pkgver=1.0.6
pkgrel=1
pkgdesc='Sōzu HTTP reverse proxy, configurable at runtime, fast and safe, built in Rust.'
arch=('i686' 'x86_64')
url='https://github.com/sozu-proxy/sozu'
license=('AGPL-3.0')
makedepends=('cargo' 'protobuf')
backup=('etc/sozu/config.toml')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sozu-proxy/sozu/archive/refs/tags/${pkgver}.tar.gz"
  'sysusers'
  'sozu.service'
  'sozu@.service'
)
sha512sums=(
  '65356ab1eb8b2fe3f11308b285abe5055ef4c60f78668581f1d5bbde8dc1dfcdda4fa40be3a6fb236c96313656c7314321215b5363e3da1f6b173cbc5a5c3db7'
  '7d21cdcb00632970bb379e2e4240110fad77c7475e18bbf9d7205e75dfbb4e79966ee083c814f0a08dc65cddf0ec2c537039e6356a2f8dc521da3f7ffcaf5054'
  'aaca9b4ef063313f9c77d3154b45c88b11ccc97b265d7d9957e0e99c78b8a5cae3e8516715ef4f73572db4ba28a5975e60ec90c8153a70478cbc6f0ff92debb4'
  '6c1e0dc797a94a5c9a4160b2a6949ad071d64eccf925a0b2b220f85fff1a54f42b253ca3c18c5c33d16b1ce31a32af011a284c7ad2004259bb423e21fa7f604d'
)
options=(!lto) # https://github.com/briansmith/ring/issues/1444#issuecomment-1813262575

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  declare -A _files
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/etc/sozu/"{pkg,html}

  _files=(
    ["target/release/sozu"]="usr/bin/sozu:755:0:0"
    ["os-build/config.toml"]="etc/sozu/config.toml:644:0:0"
    ["lib/assets/certificate.pem"]="etc/sozu/pki/certificate.pem:644:0:0"
    ["lib/assets/key.pem"]="etc/sozu/pki/key.pem:644:0:0"
    ["lib/assets/certificate_chain.pem"]="etc/sozu/pki/certificate_chain.pem:644:0:0"
    ["${srcdir}/sysusers"]="usr/lib/sysusers.d/sozu.conf:644:0:0"
    ["${srcdir}/sozu.service"]="usr/lib/systemd/system/sozu.service:644:0:0"
    ["${srcdir}/sozu@.service"]="usr/lib/systemd/system/sozu@.service:644:0:0"
    ["LICENSE"]="usr/share/licenses/${pkgname}/LICENSE:644:0:0"
  )

  for source_file in "${!_files[@]}"; do
    target_file="$(cut -f 1 -d ':' <<< "${_files[$source_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${_files[$source_file]}")"
    user="$(cut -f 3 -d ':' <<< "${_files[$source_file]}")"
    group="$(cut -f 4 -d ':' <<< "${_files[$source_file]}")"
    install -Dm "$mode" -o "$user" -g "$group" "${source_file}" "${pkgdir}/${target_file}"
  done
}

