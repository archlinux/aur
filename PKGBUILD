# Maintainer: vcup <me@vcup.moe>
# 'stalwart-mail.service' 'stalwart-mail.tmpfiles' 'stalwart-mail.sysusers' are copy and modified from 'https://gitlab.archlinux.org/archlinux/packaging/packages/stalwart-mail-server'

pkgname=stalwart-cli-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Stalwart Command Line Interface'
arch=('x86_64' 'aarch64' 'arm' 'armv7')
url='https://github.com/stalwartlabs/cli'
license=('AGPL-3.0-only' 'LicenseRef-SEL')
_download_url="${url}/releases/download/v$pkgver"
_platform=linux-gnu
source=(
  "stalwart-cli-v$pkgver-${CARCH}-unknown-${_platform}.tar.xz::${_download_url}/stalwart-cli-${CARCH}-unknown-${_platform}.tar.xz"
)
sha512sums=('cea2d4ff2ea1bed1f24abf458daa960688adf53984194f36c76ad164531b72d296f4b3c8dced622fbc069a55bd874d84229c2e6edd640520b655cc56d24aa0d8')
provides=('stalwart-cli')
conflicts=('stalwart-cli' 'stalwart-mail-server')

package() {
  declare -A _files
  _files=(
    ["stalwart-cli-${CARCH}-unknown-${_platform}/stalwart-cli"]="usr/bin/stalwart-cli:755:0:0"
    ["stalwart-cli-${CARCH}-unknown-${_platform}/CHANGELOG.md"]="usr/share/doc/stalwart-cli/CHANGELOG.md:644:0:0"
    ["stalwart-cli-${CARCH}-unknown-${_platform}/README.md"]="usr/share/doc/stalwart-cli/README.md:644:0:0"
  )

  for source_file in "${!_files[@]}"; do
    target_file="$(cut -f 1 -d ':' <<< "${_files[$source_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${_files[$source_file]}")"
    user="$(cut -f 3 -d ':' <<< "${_files[$source_file]}")"
    group="$(cut -f 4 -d ':' <<< "${_files[$source_file]}")"
    install -Dm "$mode" -o "$user" -g "$group" "${srcdir}/${source_file}" "${pkgdir}/${target_file}"
  done
}

