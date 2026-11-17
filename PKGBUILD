# Maintainer: Dominik Kummer <admin@arkades.org>
pkgname=texlive-dirtreex
pkgver=1.2
pkgrel=1
pkgdesc='LaTeX directory-tree rendering package built on TikZ and zref'
arch=('any')
url='https://github.com/CloudCauldron/dirtreex'
license=('LPPL-1.3c')
depends=(
  'texlive-bin'
  'texlive-latex'
  'texlive-latexextra'
  'texlive-latexrecommended'
  'texlive-pictures'
)
source=("$pkgname-$pkgver.zip::https://mirrors.ctan.org/macros/latex/contrib/dirtreex.zip")
sha256sums=('5a4393cee3223c1192dede621c421fe899425ecd356ccc77588ca1d7b8009a5c')

package() {
  local sty docdir name file

  # dirtreex is distributed as a single LaTeX style file.
  sty=$(find "$srcdir" -type f -name 'dirtreex.sty' -print -quit)
  [[ -n "$sty" ]] || {
    error 'dirtreex.sty was not found in the CTAN archive'
    return 1
  }

  install -Dm644 "$sty" \
    "$pkgdir/usr/share/texmf/tex/latex/dirtreex/dirtreex.sty"

  # Install the upstream documentation and worked examples when present.
  docdir="$pkgdir/usr/share/texmf/doc/latex/dirtreex"
  for name in README.md LICENSE dirtreex_examples.tex dirtreex_examples.pdf; do
    file=$(find "$srcdir" -type f -name "$name" -print -quit)
    if [[ -n "$file" ]]; then
      install -Dm644 "$file" "$docdir/$name"
    fi
  done

  # Refresh the TeX filename database after install/upgrade/removal.
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/texlive-dirtreex.hook" <<'HOOK'
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Operation = Remove
Target = texlive-dirtreex

[Action]
Description = Updating TeX filename database...
When = PostTransaction
Exec = /usr/bin/mktexlsr /usr/share/texmf
HOOK
}
