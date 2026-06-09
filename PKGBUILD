# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgbase=pvs-studio
pkgname=${_pkgbase}-bin
pkgver=7.43.107142.799
pkgrel=1
pkgdesc='Static code analyzer for C and C++'
arch=('x86_64')
url='https://pvs-studio.com/en/pvs-studio/'
license=('LicenseRef-pvs-studio')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code'
            'bash-completion: for bash completion'
            'strace: for analyzing via using strace logs')
options=('!debug')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
_name=${_pkgbase}-${pkgver}-x86_64
source=("${_name}.tgz::https://files.${_pkgbase}.com/${_name}.tgz")
sha256sums=('251e141b3c66c065cdbfd7db6478eb88ad81c871f7c444227e9ecdaabed0ee67')

latestver() {
  local html ver
  html=$(curl -fsSL -H 'User-Agent: Mozilla/5.0' \
    'https://pvs-studio.com/en/pvs-studio/download-all/') || return 1
  ver=$(sed -n "s/.*pvs-studio-\([0-9.]\{1,\}\)-x86_64\\.tgz.*/\\1/p" <<< "$html" |
    head -n1)
  if [[ -z $ver ]]; then
    printf 'Unable to determine latest PVS-Studio version\n' >&2
    return 1
  fi
  printf '%s\n' "$ver"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" bin/*

  install -Dm644 "etc/bash_completion.d/${_pkgbase}.sh" \
    "${pkgdir}/usr/share/bash-completion/completions/plog-converter"
  ln -s plog-converter \
    "${pkgdir}/usr/share/bash-completion/completions/${_pkgbase}-analyzer"

  install -Dm644 "share/doc/${_pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
