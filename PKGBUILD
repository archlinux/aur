# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgbase=pvs-studio
pkgname=${_pkgbase}-bin
pkgver=7.39.99307.684
pkgrel=1
pkgdesc='Static code analyzer for C and C++'
arch=('x86_64')
url='https://pvs-studio.com/en/pvs-studio/'
license=('custom:pvs-studio')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code'
            'bash-completion: for bash completion'
            'strace: for analyzing via using strace logs')
options=('!strip' '!debug')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
_name=${_pkgbase}-${pkgver}-x86_64
source=("${_name}.tgz::https://files.${_pkgbase}.com/${_name}.tgz")
sha256sums=('3c9eed7d6c209914738e0db383a8725a2c59d63e0cdf8a79a2797ad21b4ee4a9')

pkgver() {
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
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${_name}/bin/${_pkgbase}" \
    "${_name}/bin/${_pkgbase}-analyzer" \
    "${_name}/bin/plog-converter"

  install -Dm644 "${_name}/etc/bash_completion.d/${_pkgbase}.sh" \
    "${pkgdir}/etc/bash_completion.d/${_pkgbase}.sh"

  install -Dm644 "${_name}/share/doc/${_pkgbase}/License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
