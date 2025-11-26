# Maintainer:  bipin kumar <kbipinkumar@pm.me>

pkgname=pplacer
pkgver=1.1.alpha20
pkgrel=1
pkgdesc="Phylogenetic placement and downstream analysis "
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
makedepends=( 'm4' 'ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam' 'python-sphinx' 'wget' 'git' 'rsync' 'bubblewrap' 'dune')

source=("${pkgname}::git+https://github.com/matsen/pplacer.git#tag=v${pkgver}"
        "${pkgname}-gh-pages::git+https://github.com/matsen/pplacer.git#branch=gh-pages"
        "mcl::git+https://github.com/fhcrc/mcl.git#commit=b1f7a969371d434eaa6848bdbb79a851de617c1f"
        )

sha256sums=('3e5422b358d3ef11869e7043f8273fd3a8425de6941c7c7865f97fb6b3387c59'
            'SKIP'
            'e416c1c4ba6c1ef5f1fb78b401eb9d9060d61fab5fa294d7d6734f785e7dc556')

prepare() {
  cd "${srcdir}"/"${pkgname}"
  sed -i 's|git@github.com:matsen/pplacer.git|https://github.com/matsen/pplacer.git|g' .gitmodules
  sed -i 's|git@github.com:fhcrc/mcl.git|https://github.com/fhcrc/mcl.git|g' .gitmodules
  git submodule init
  git config submodule.libs/https://github.com/fhcrc/mcl.git "$srcdir/mcl"
  git config submodule.libs/https://github.com/matsen/pplacer.git "$srcdir/${pkgname}-gh-pages"
  git -c protocol.file.allow=always submodule update
  cd mcl
  # Fix conflicting 'usage' prototype by changing the declaration in src/mcl/procinit.h
  sed -i 's/void usage();/void usage(const char **);/' src/mcl/procinit.h
  # Fix missing include for mclx_set_threads_or_die function
  sed -i '/#include "impala\/stream.h"/a #include "impala/app.h"' src/shmx/mcxclcf.c
  cd ../docs
  # Use mathjax instead of pngmath to avoid build issues
  sed -i 's/pngmath/mathjax/g' conf.py
  cd ..
  # make bundled python scripts compatible with python3 by adding cStringIO/io shim
  mkdir -p ~/pplacer-scripts-backup
  cp scripts/*.py ~/pplacer-scripts-backup/
  for f in scripts/*.py; do
  # skip if file already mentions cStringIO (no change needed)
  if grep -q 'cStringIO' "$f"; then
    echo "Skipping (already mentions cStringIO): $f"
    continue
  fi

  tmp=$(mktemp)
  # if file has shebang, keep it on first line and insert shim after it
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
  local OCAML_SYSTEM_VERSION=$(ocamlc -vnum 2>/dev/null)
  if [[ -z "$OCAML_SYSTEM_VERSION" ]]; then
    echo "Error: Could not detect OCaml version." >&2
    exit 1
  fi
    cd "${pkgname}"
    export pkgversion=${pkgver}
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

  cd mcl
  ./configure
  make
  cd ..
  eval "$(opam env --switch=system-opaml-switch)"
  dune build
  cd docs
  make man
}

package() {
  cd "${pkgname}/_build/default/"
    for bin in {pplacer,guppy,rppr}; do
      install -Dm755 "${bin}.exe" "$pkgdir"/usr/bin/${bin}
    done
  cd ../../docs/_build/man/
  install -Dm644 pplacer.1 ${pkgdir}/usr/share/man/man1/pplacer.1
  cd ../../../scripts/
  chmod +x *.py
  for script in *.py; do
  [[ "$script" != "setup.py" ]] && install -Dm755 "$script" "$pkgdir/usr/bin/$script"
done
}
