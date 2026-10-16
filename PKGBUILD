# Maintainer: Matheus Vilano <aur.negotiate177@passinbox.com>
pkgname=riftlift-bin
pkgver=0.11.1.2
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
  'a578fa34e31860427693e480e0964cc42b064962759f8d7fbe3a71d857e3910d'  # wheel
  '9abc7f42a78eb2cf03d122b35871c47cd19132e7b4a20fccb55650abb8c2a9f5'  # compat
  'ef0e17f96be6555fe41c9f574a9bfd6ac5d707437019d6a1aca514c8d4d5d0f1'  # xrizer
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