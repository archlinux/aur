# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=8.01.110581.857
pkgrel=1
pkgdesc='Static code analyzer for C and C++'
arch=('x86_64')
url='https://pvs-studio.com/en/pvs-studio/'
license=('LicenseRef-pvs-studio')
optdepends=('bash-completion: for bash completion'
            'strace: for pvs-studio-analyzer trace')
conflicts=("${pkgname}-bin")
options=('!debug')
_name=${pkgname}-${pkgver}-x86_64
source=("${_name}.tgz::https://files.${pkgname}.com/${_name}.tgz")
sha256sums=('2633ac22f36202992e600c42334a91b8682c418100ca063db6778745582faf05')

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
  # static ELF executables: makepkg's inherited strip only runs --strip-debug on
  # them (a no-op, no DWARF present); --strip-unneeded removes .symtab/.strtab,
  # verified behavior-identical
  strip --strip-unneeded bin/*

  install -Dm755 -t "${pkgdir}/usr/bin" bin/*

  install -Dm644 "etc/bash_completion.d/${pkgname}.sh" \
    "${pkgdir}/usr/share/bash-completion/completions/plog-converter"
  ln -s plog-converter \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-analyzer"

  install -Dm644 "share/doc/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
