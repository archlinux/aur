# Maintainer:  bipin kumar <kbipinkumar@pm.me>

pkgname=pplacer
pkgver=1.1.alpha23
pkgrel=1
pkgdesc="Phylogenetic placement and downstream analysis"
arch=("x86_64")
url="https://matsen.fredhutch.org/pplacer/"
license=("GPL-3.0-or-later")
depends=(
        'glibc'
        'gsl'
        'zlib'
        'sqlite'
        'python'
        'python-biopython'
        'python-taxtastic'
        )
makedepends=('m4' 'ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam' 'python-sphinx' 'wget' 'git' 'rsync' 'bubblewrap' 'dune')

_mcl_commit=1f1932b64619e9bd9ecbcb421cb1e3f1eb535e80
source=("${pkgname}::git+https://github.com/matsen/pplacer.git#tag=v${pkgver}"
        "mcl::git+https://github.com/fhcrc/mcl.git#commit=${_mcl_commit}"
        )

sha256sums=('b946a84e98bce27b606551f177392248d22f5ceb1b4c9e35a85e1ce65c992d53'
            '45c49e1794fe1e1a2b884d8825e0e4b51644813c7c996fffa265077a570ea287')

prepare() {
  cd "${srcdir}"/"${pkgname}"
  
  # Initialize ONLY the mcl submodule
  git submodule init mcl
  # Point mcl submodule to the local source
  git config submodule.mcl.url "$srcdir/mcl"
  # Update mcl
  git -c protocol.file.allow=always submodule update mcl

  # Remove static linking flags to link dynamically against gsl
  sed -i "s/echo '(-ccopt -static -ccopt -no-pie)'/echo '()'/g" dune

  # patch to use mathjax with Sphinx docs
  if [ -d "docs" ]; then
    cd docs
    sed -i 's/pngmath/mathjax/g' conf.py
    cd ..
  fi

  # --- Python Shim Patches ---
  mkdir -p "$srcdir/scripts_backup"
  cp scripts/*.py "$srcdir/scripts_backup/"
  
  for f in scripts/*.py; do
      # skip if file already mentions cStringIO
      if grep -q 'cStringIO' "$f"; then
        echo "Skipping (already mentions cStringIO): $f"
        continue
      fi

      tmp=$(mktemp)
      if head -n1 "$f" | grep -q '^#!'; then
        head -n1 "$f" >"$tmp"
        printf '\ntry:\n    import cStringIO as cStringIO\nexcept ImportError:\n    import io as cStringIO\n\n' >>"$tmp"
        tail -n +2 "$f" >>"$tmp"
      else
        printf 'try:\n    import cStringIO as cStringIO\nexcept ImportError:\n    import io as cStringIO\n\n' >"$tmp"
        cat "$f" >>"$tmp"
      fi
      mv "$tmp" "$f"
      chmod +x "$f"
      echo "Patched: $f"
  done
}

build() {
  cd "${pkgname}"
  export pkgversion=${pkgver}
  # Setup local opam root
  export OPAMROOT="$srcdir/opam_root"
  mkdir -p "$OPAMROOT"
  opam init --bare --no-setup -y --root="$OPAMROOT"
  opam switch create system-opaml-switch --empty -y
  eval "$(opam env --switch=system-opaml-switch)"
  
  opam repo add pplacer-deps http://matsen.github.io/pplacer-opam-repository
  opam update
  opam install -y --no-depexts \
    csv \
    ounit2 \
    xmlm \
    batteries \
    gsl \
    sqlite3 \
    camlzip 

  # Build MCL manually
  cd mcl
  ./configure
  make
  cd ..
  
  # Build pplacer
  eval "$(opam env --switch=system-opaml-switch)"
  dune build
  
  # Build docs
  cd docs
  make man
}

package() {
  cd "${pkgname}/_build/default/"
  
  # Install Binaries
  for bin in {pplacer,guppy,rppr}; do
      install -Dm755 "${bin}.exe" "$pkgdir"/usr/bin/${bin}
  done

  # Install Man Pages
  cd ../../docs/_build/man/
  install -Dm644 pplacer.1 "${pkgdir}/usr/share/man/man1/pplacer.1"

  # Install Scripts
  cd ../../../scripts/
  chmod +x *.py
  for script in *.py; do
      [[ "$script" != "setup.py" ]] && install -Dm755 "$script" "$pkgdir/usr/bin/$script"
  done
}
