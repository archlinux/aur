# Maintainer: goodroot <hyprwhspr@goodroot.ca>

_pkgname=hyprwhspr
pkgname=hyprwhspr-git
pkgver=0
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration (git)"
arch=('x86_64')
url="https://github.com/goodroot/${_pkgname}"
license=('MIT')

makedepends=(
  'git'
  'python-setuptools'
)
depends=(
  'python'
  'python-pip'
  'python-sounddevice'
  'python-numpy'
  'python-scipy'
  'python-evdev'
  'python-pyperclip'
  'python-requests'
  'python-psutil'
  'python-rich'
  'ydotool'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse'
)

install="${_pkgname}.install"

source=("git+https://github.com/goodroot/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
  # e.g. v1.9.16-23-gabc1234 -> 1.9.16.r23.gabc1234
}

build() {
  cd "${srcdir}/${_pkgname}"
  # nothing to build; user runs 'hyprwhspr setup' post-install
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "$pkgdir/usr/lib/${_pkgname}"
  cp -r lib bin config share README.md LICENSE requirements.txt \
    "$pkgdir/usr/lib/${_pkgname}"

  if [ -f "$pkgdir/usr/lib/${_pkgname}/bin/${_pkgname}" ]; then
    chmod 755 "$pkgdir/usr/lib/${_pkgname}/bin/${_pkgname}"
  fi

  install -Dm644 "config/systemd/${_pkgname}.service" \
    "$pkgdir/usr/lib/systemd/user/${_pkgname}.service"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/${_pkgname}" << 'EOF'
#!/usr/bin/env bash
# hyprwhspr launcher - routes CLI commands or runs application

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" =~ ^(setup|config|waybar|systemd|status|model|validate)$ ]]; then
    export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
    export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"
    exec python /usr/lib/hyprwhspr/lib/cli.py "$@"
else
    export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
    export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"
    exec python /usr/lib/hyprwhspr/lib/main.py "$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/${_pkgname}"

  install -d "$pkgdir/usr/share/doc/${_pkgname}" \
             "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -m644 LICENSE   "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
