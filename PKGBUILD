# Maintainer: nezu <nezu@nezu.cc>
# Contributor: Forest Crossman <cyrozap at gmail dot com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff-ida9-bin
pkgver=8
pkgrel=1
pkgdesc="bindiff fork with IDA 9 support"
arch=('x86_64')
url="https://www.zynamics.com/bindiff.html"
license=('Apache-2.0')  # NOTE: Despite being released as open source, the GUI can't be built from source as it depends on a proprietary graph visualization library.
depends=('java-runtime>=11')
options=('!strip')
backup=("etc/opt/bindiff/bindiff.json")
source=(
  "https://github.com/google/bindiff/releases/download/v${pkgver}/bindiff_${pkgver}_amd64.deb"{,.asc}
  "https://github.com/cs2-analysis/bindiff/releases/download/ida-9/BinDiff-Linux.zip"
)
sha256sums=('821990e3974a9df6733794370e485486ac276ba5d777a06b4ebe575f092f4dda'
            'SKIP'
            'd7a9e94438a5b8d810b11ff7cbf4da62448c31d33724ef927a68bd79b4038826')
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')  # Google Inc. (Linux Packages Signing Authority)

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # remove the bundled binaries
  bindest="${pkgdir}"/opt/bindiff
  rm "${bindest}"/bin/{bindiff,binexport2dump}
  rm "${bindest}"/libexec/bindiff_config_setup
  rm "${bindest}"/plugins/{binaryninja,idapro}/*

  # replace with new binaries
  binsrc="${srcdir}"/BinDiff-Linux
  install -Dm755 "${binsrc}"/bindiff "${bindest}"/bin/bindiff
  install -Dm755 "${binsrc}"/tools/binexport2dump "${bindest}"/bin/binexport2dump
  install -Dm755 "${binsrc}"/tools/bindiff_config_setup "${bindest}"/libexec/bindiff_config_setup
  install -Dm644 "${binsrc}"/binaryninja/binexport12_binaryninja.so "${bindest}"/plugins/binaryninja
  install -Dm644 "${binsrc}"/ida/{bindiff8_ida.so,binexport12_ida.so} "${bindest}"/plugins/idapro

  # Remove the bundled Java runtime
  rm -r "${bindest}"/jre

  # Write install location to config file
  "${bindest}/libexec/bindiff_config_setup" \
    --config "${pkgdir}"/etc/opt/bindiff/bindiff.json \
    "directory=/opt/bindiff" "ida.directory=/opt/ida-pro"
}

# vim:set et sw=2 sts=2 tw=80:
