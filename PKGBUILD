# Maintainer: Matheus Vilano <aur.negotiate177@passinbox.com>
pkgname=riftlift-bin
pkgver=0.10.2.5
pkgrel=1
pkgdesc='Play owned Meta Rift and Oculus PC VR games on Linux'
arch=('x86_64')
url='https://github.com/Villagers654/RiftLift'
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git')
provides=('riftlift')
conflicts=('riftlift')
_tag="v${pkgver}"
_base="https://github.com/Villagers654/RiftLift/releases/download/${_tag}"
source=(
  "${_base}/riftlift-${pkgver}-py3-none-any.whl"
  "${_base}/riftlift-compat.zip"
  "${_base}/riftlift-xrizer.tar.gz"
  "${_base}/riftlift-dxvk.tar.gz"
  "riftlift-setup"
  "io.github.villagers654.RiftLift.desktop"
  "io.github.villagers654.RiftLift.svg"
)
noextract=("riftlift-compat.zip" "riftlift-xrizer.tar.gz" "riftlift-dxvk.tar.gz")
sha256sums=(
  'e0acaecaa27769a84ed28a4f4cc28ed012b1834c7fce8e206fc813ff5f1a4653'  # wheel
  '602a2f95132f9cc0dc2ad1af97011e51591c6bab69f80f7980d9ca2c5efcdd83'  # compat
  '8fcd9dc9d417c37a67d75b06b8050598ee5ffd8a8426cf4b33e612c42135bb0e'  # xrizer
  '15d2625b9a7f0d01f5096c17211ff8e98ba238ddc0d39de03bb58c2277d7eedc'  # dxvk
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  : # nothing to prepare; payloads are consumed unextracted by 'riftlift setup'
}

package() {
  local _venv="$pkgdir/usr/share/riftlift/venv"

  # Mirror upstream install.sh: dedicated venv, pinned deps (incl. git dep),
  # then force-reinstall the exact wheel over whatever a dependency dragged in.
  install -dDm755 "$pkgdir/usr/share/riftlift"
  python -m venv "$_venv"
  "$_venv/bin/python" -m pip install --quiet --upgrade pip
  "$_venv/bin/python" -m pip install --quiet --upgrade \
    "$srcdir/riftlift-${pkgver}-py3-none-any.whl"
  "$_venv/bin/python" -m pip install --quiet --force-reinstall --no-deps \
    "$srcdir/riftlift-${pkgver}-py3-none-any.whl"

  # venv was created under $pkgdir; scrub embedded build paths from shebangs.
  local f
  for f in "$_venv/bin/"*; do
    if [[ -f $f && $(head -c 2 "$f") == '#!' ]]; then
      sed -i "1s|$pkgdir||" "$f"
    fi
  done

  # Launchers
  install -dDm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/riftlift/venv/bin/riftlift"     "$pkgdir/usr/bin/riftlift"
  ln -s "/usr/share/riftlift/venv/bin/riftlift-gui" "$pkgdir/usr/bin/riftlift-gui"

  # Desktop integration
  install -Dm644 "$srcdir/io.github.villagers654.RiftLift.desktop" \
    "$pkgdir/usr/share/applications/io.github.villagers654.RiftLift.desktop"
  install -Dm644 "$srcdir/io.github.villagers654.RiftLift.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.villagers654.RiftLift.svg"

  # Offline compat payload consumption wrapper
  install -Dm755 "$srcdir/riftlift-setup" "$pkgdir/usr/bin/riftlift-setup"
  install -dDm755 "$pkgdir/usr/share/riftlift/payloads"
  install -m644 "$srcdir/riftlift-compat.zip"  "$pkgdir/usr/share/riftlift/payloads/"
  install -m644 "$srcdir/riftlift-xrizer.tar.gz" "$pkgdir/usr/share/riftlift/payloads/"
  install -m644 "$srcdir/riftlift-dxvk.tar.gz"  "$pkgdir/usr/share/riftlift/payloads/"

  install -Dm644 /dev/null "$pkgdir/usr/share/doc/riftlift/README"
  cat >> "$pkgdir/usr/share/doc/riftlift/README" <<'EOF'
First run: riftlift-setup
Installs the pinned Proton/Meta/OpenXR/OpenVR/DXVK components from
/usr/share/riftlift/payloads into your user data directory (~/.local/share/riftlift).
No downloads occur; all payloads ship with the package.
EOF
}