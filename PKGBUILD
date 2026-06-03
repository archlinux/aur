# Maintainer: Ryan Bas <ryanbas21@github>
pkgname=camlwm-git
pkgver=0.2.0.r69.3b86a25
pkgrel=1
pkgdesc="xmonad-style tiling window manager for X11, written in OCaml"
arch=('x86_64')
url="https://github.com/ryanbas21/CamlWM"
license=('MIT')
depends=('libx11' 'ocaml' 'ocaml-ctypes' 'ocaml-findlib' 'libffi')
makedepends=('git' 'dune' 'ocaml')
provides=('camlwm')
conflicts=('camlwm')
source=("git+https://github.com/ryanbas21/CamlWM.git")
sha256sums=('SKIP')

pkgver() {
  cd CamlWM
  printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_camlwm_system_toolchain() {
  # makepkg inherits the caller's environment. When run from `nix develop`,
  # Nix's OCaml/dune/findlib can otherwise produce binaries linked against
  # /nix/store libraries, which then crash from a display-manager session.
  unset CAML_LD_LIBRARY_PATH OCAMLPATH OCAML_TOPLEVEL_PATH OPAM_SWITCH_PREFIX
  unset NIX_CC NIX_CFLAGS_COMPILE NIX_LDFLAGS NIX_PROFILES NIX_SSL_CERT_FILE
  export PATH="/usr/bin:/bin"
}

build() {
  cd CamlWM
  _camlwm_system_toolchain
  /usr/bin/dune build @install
}

package() {
  cd CamlWM
  _camlwm_system_toolchain
  install -Dm755 _build/default/bin/main.exe "$pkgdir/usr/bin/camlwm"

  # Do not install an X session desktop file here. Users may already own
  # /usr/share/xsessions/camlwm.desktop from local display-manager setup, and
  # packaging it would create an unnecessary pacman file conflict.

  # Install libraries so ocamlfind can resolve camlwm.core/camlwm.wm when
  # recompiling user configs at runtime. Path is $(dirname binary)/../lib/camlwm
  # which recompile.ml auto-discovers via OCAMLPATH.
  local _libdir="$pkgdir/usr/lib/camlwm"
  install -d "$_libdir"
  install -m644 _build/install/default/lib/camlwm/META "$_libdir/"
  for sub in core wm xlib; do
    install -d "$_libdir/$sub"
    find _build/install/default/lib/camlwm/$sub/ \
      \( -name "*.cmxa" -o -name "*.cmi" -o -name "*.cmx" -o -name "*.a" \) \
      -exec install -m644 {} "$_libdir/$sub/" \;
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
