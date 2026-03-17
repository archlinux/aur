# Maintainer: terpinedream <terpinedream@gmail.com>

pkgname=bashd
pkgver=2.0.0
pkgrel=1
pkgdesc="Bulk data management toolkit for Linux CLI — single dispatcher, 49 commands (rename, organize, clipboard, cleanup)"
arch=('any')
url="https://github.com/terpinedream/Bashd"
license=('GPL3')
depends=('bash')
optdepends=('figlet: pretty headers for bashd --<command>')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47d402fbf55e8e42f8367dbe172907daa4c597cdd68f6c41dcca41d0f6a74ddf')

package() {
  _bd="${srcdir}/Bashd-${pkgver}"
  if [[ ! -d "$_bd" ]]; then
    _bd=$(find "$srcdir" -maxdepth 1 -type d -name 'Bashd*' | head -1)
  fi

  # Dispatcher and scripts layout (dispatcher looks for bashd-scripts/ next to itself)
  install -Dm755 "${_bd}/scripts/bashd" "${pkgdir}/usr/bin/bashd"
  install -d "${pkgdir}/usr/bin/bashd-scripts"/{core,helpers,extra}
  install -m755 "${_bd}/scripts/bashd-init.sh" "${pkgdir}/usr/bin/bashd-scripts/"
  install -m644 "${_bd}/scripts/_bashd_log" "${pkgdir}/usr/bin/bashd-scripts/"
  for _dir in core helpers extra; do
    for _s in "${_bd}/scripts/${_dir}"/*; do
      [[ -e "$_s" ]] && install -m755 "$_s" "${pkgdir}/usr/bin/bashd-scripts/${_dir}/"
    done
  done

  # Login shells: load aliases and cd-helpers (hop, crush, ld, etc.)
  install -d "${pkgdir}/etc/profile.d"
  printf '%s\n' '[ -f /usr/bin/bashd-scripts/bashd-init.sh ] && . /usr/bin/bashd-scripts/bashd-init.sh' >"${pkgdir}/etc/profile.d/bashd.sh"
  chmod 644 "${pkgdir}/etc/profile.d/bashd.sh"

  # License
  install -Dm644 "${_bd}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
