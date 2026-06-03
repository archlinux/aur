# Maintainer: Ryan Bas <ryanbas21@github>
pkgname=camlwm-git
pkgver=0.2.0
pkgrel=1
pkgdesc="xmonad-style tiling window manager for X11, written in OCaml"
arch=('x86_64')
url="https://github.com/ryanbas21/CamlWM"
license=('MIT')
depends=('libx11' 'ocaml' 'ocaml-ctypes' 'ocaml-findlib' 'libffi')
makedepends=('git' 'dune')
provides=('camlwm')
conflicts=('camlwm')
source=("git+https://github.com/ryanbas21/CamlWM.git")
sha256sums=('SKIP')

pkgver() {
  cd CamlWM
  printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd CamlWM
  dune build @install
}

package() {
  cd CamlWM
  install -Dm755 _build/default/bin/main.exe "$pkgdir/usr/bin/camlwm"
  install -Dm644 camlwm.desktop "$pkgdir/usr/share/xsessions/camlwm.desktop"

  # Install libraries to the system findlib path so ocamlfind can resolve
  # camlwm.core/camlwm.wm when recompiling user configs at runtime.
  local _libdir="$pkgdir/usr/lib/ocaml/camlwm"
  install -d "$_libdir"
  install -m644 _build/install/default/lib/camlwm/META "$_libdir/"
  for sub in core wm xlib; do
    install -d "$_libdir/$sub"
    install -m644 _build/install/default/lib/camlwm/$sub/*.{cmxa,cmi,cmx,a} \
      "$_libdir/$sub/" 2>/dev/null || true
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
