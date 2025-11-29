# Maintainer:  bipin kumar <kbipinkumar@pm.me>

pkgname=pplacer
pkgver=1.1.alpha20
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

_mcl_commit=b1f7a969371d434eaa6848bdbb79a851de617c1f
source=("${pkgname}::git+https://github.com/matsen/pplacer.git#tag=v${pkgver}"
        "mcl::git+https://github.com/fhcrc/mcl.git#commit=${_mcl_commit}"
        )

sha256sums=('3e5422b358d3ef11869e7043f8273fd3a8425de6941c7c7865f97fb6b3387c59'
            'e416c1c4ba6c1ef5f1fb78b401eb9d9060d61fab5fa294d7d6734f785e7dc556')

prepare() {
  cd "${srcdir}"/"${pkgname}"
  
  # Initialize ONLY the mcl submodule
  git submodule init mcl
  # Point mcl submodule to the local source
  git config submodule.mcl.url "$srcdir/mcl"
  # Update mcl
  git -c protocol.file.allow=always submodule update mcl

  # --- MCL Patches ---
  cd mcl
  # Fix conflicting 'usage' prototype
  sed -i 's/void usage();/void usage(const char **);/' src/mcl/procinit.h
  # Fix missing include
  sed -i '/#include "impala\/stream.h"/a #include "impala/app.h"' src/shmx/mcxclcf.c
  cd ..
  
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
