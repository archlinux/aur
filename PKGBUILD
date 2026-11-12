# Maintainer: Dominik Kummer <admin@arkades.org>
pkgname=texlive-mermaid
pkgver=1.1
pkgrel=1
pkgdesc='LaTeX packages for embedding Mermaid diagrams with pdfLaTeX, XeLaTeX, upLaTeX and LuaLaTeX'
arch=('any')
url='https://github.com/ryoya9826/ltMermaid'
license=('LPPL')
depends=(
  'mermaid-cli'
  'texlive-bin'
  'texlive-latex'
  'texlive-latexextra'
  'texlive-latexrecommended'
  'texlive-luatex'
)
provides=('mermaid' 'ltmermaid')
source=("$pkgname-$pkgver.zip::https://mirrors.ctan.org/macros/latex/contrib/ltmermaid.zip")
sha256sums=('SKIP')

package() {
  local name sty texdir docdir

  # Install both engine implementations from the same CTAN distribution:
  # mermaid.sty supports pdfLaTeX and other engines; ltmermaid.sty is
  # the LuaLaTeX-specific implementation.
  for name in mermaid ltmermaid; do
    sty=$(find "$srcdir" -type f -name "$name.sty" -print -quit)
    [[ -n "$sty" ]] || {
      error "$name.sty was not found in the CTAN archive"
      return 1
    }

    texdir="$pkgdir/usr/share/texmf/tex/latex/$name"
    install -Dm644 "$sty" "$texdir/$name.sty"
  done

  # Keep the documentation for both implementations, plus shared metadata.
  docdir="$pkgdir/usr/share/texmf/doc/latex/ltmermaid"
  local file
  for name in README.md LICENSE \
              mermaid-doc.pdf mermaid-doc.tex \
              mermaid-doc-ja.pdf mermaid-doc-ja.tex \
              ltmermaid-doc.pdf ltmermaid-doc.tex \
              ltmermaid-doc-ja.pdf ltmermaid-doc-ja.tex; do
    file=$(find "$srcdir" -type f -name "$name" -print -quit)
    if [[ -n "$file" ]]; then
      install -Dm644 "$file" "$docdir/$name"
    fi
  done

  # Refresh the TeX filename database after install/upgrade/removal.
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/texlive-mermaid.hook" <<'EOF'
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Operation = Remove
Target = texlive-mermaid

[Action]
Description = Updating TeX filename database...
When = PostTransaction
Exec = /usr/bin/mktexlsr /usr/share/texmf
EOF
}
