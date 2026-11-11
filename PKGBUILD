# Maintainer: Vibex <maintainers@vibex.dev>
#
# Prebuilt package: this PKGBUILD installs the reviewed Linux .deb that the
# tagged GitHub Release publishes. It never builds Vibex from source, so the
# AUR package name carries the mandatory -bin suffix.
#
# The release workflow (.github/workflows/publish-aur.yml) rewrites pkgver and
# the checksums with `updpkgsums` and pushes the result, so the checked-in
# values below are the last stable release a maintainer published by hand.
#
# Only stable tags are published here. AUR carries exactly one version per
# package, so an RC or preview build would downgrade every Arch user.

pkgname=vibex-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Local-first AI coding workbench: Agent sessions, Git, terminals, and previews'
arch=('x86_64' 'aarch64')
url='https://github.com/vibex-ai/vibex'
license=('AGPL-3.0-or-later')
depends=(
  'dbus'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
)
# Vibex runs Agents as child processes under the user's own account, so the
# toolchain those Agents need stays a host responsibility instead of being
# bundled into the package.
optdepends=(
  'git: version control, worktrees, and diff review'
  'nodejs: managed ACP Agent installs'
  'npm: managed ACP Agent installs'
  'chromium: embedded browser surface'
)
provides=("vibex=$pkgver")
conflicts=('vibex')
options=('!strip' '!debug')

_gh="https://github.com/vibex-ai/vibex/releases/download/v${pkgver}"
_pkg="vibex-${pkgver}-linux"

source_x86_64=(
  "${_pkg}-x86_64-deb.deb::${_gh}/${_pkg}-x86_64-deb.deb"
  "vibex-${pkgver}-LICENSE::https://raw.githubusercontent.com/vibex-ai/vibex/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkg}-aarch64-deb.deb::${_gh}/${_pkg}-aarch64-deb.deb"
  "vibex-${pkgver}-LICENSE::https://raw.githubusercontent.com/vibex-ai/vibex/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '749e30dcd2756261549ec3bcce4f3a43f33ae969db106b40743d9f1da4469c59'
  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
)
sha256sums_aarch64=(
  '92941a803dc55b09a83f970a1d36d5d93f155dc3a2c21499ea1f9b5d347471b0'
  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
)

# The packaged .deb wraps its payload in a second archive. Extract both layers
# once here so package() only copies a ready tree.
prepare() {
  local src
  src="$(find "${srcdir}" -maxdepth 1 -name '*.deb' -print -quit)"
  if [[ -z "${src}" ]]; then
    echo 'the release .deb is missing from the source array' >&2
    return 1
  fi

  install -d "${srcdir}/deb" "${srcdir}/pkg"
  bsdtar -xf "${src}" -C "${srcdir}/deb"

  local payload
  payload="$(find "${srcdir}/deb" -maxdepth 1 -name 'data.tar.*' -print -quit)"
  if [[ -z "${payload}" ]]; then
    echo 'the .deb carries no data archive' >&2
    return 1
  fi
  bsdtar -xf "${payload}" -C "${srcdir}/pkg"

  # `vibex` is the character-grid client; `vibex-tui` is its explicit name.
  for binary in vibex-desktop vibex vibex-tui; do
    if [[ ! -x "${srcdir}/pkg/usr/bin/${binary}" ]]; then
      echo "the .deb payload is missing usr/bin/${binary}" >&2
      return 1
    fi
  done
}

package() {
  install -Dm755 "${srcdir}/pkg/usr/bin/vibex-desktop" "${pkgdir}/usr/bin/vibex-desktop"
  # The character-grid client ships alongside the GUI so a shell user never has
  # to install anything extra.
  install -Dm755 "${srcdir}/pkg/usr/bin/vibex" "${pkgdir}/usr/bin/vibex"
  # The explicit name is a launcher next to the client, not a second copy.
  install -Dm755 "${srcdir}/pkg/usr/bin/vibex-tui" "${pkgdir}/usr/bin/vibex-tui"

  # The GUI resolves PDFium at ../lib/vibex-desktop/pdfium relative to its own
  # path, so this payload must keep the layout the .deb shipped.
  if [[ -d "${srcdir}/pkg/usr/lib/vibex-desktop" ]]; then
    install -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/pkg/usr/lib/vibex-desktop" "${pkgdir}/usr/lib/"
  fi

  if [[ -d "${srcdir}/pkg/usr/share/icons/hicolor" ]]; then
    install -d "${pkgdir}/usr/share/icons"
    cp -a "${srcdir}/pkg/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
  fi

  # AUR renders its own desktop entry: the packaged one keeps NoDisplay=true
  # and an empty Categories list, which hides the application from menus.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/dev.vibex.desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Vibex
GenericName=AI Coding Workbench
Comment=Local-first AI coding workbench: Agent sessions, Git, terminals, and previews
Exec=vibex-desktop %U
TryExec=vibex-desktop
Icon=vibex-desktop
Terminal=false
StartupWMClass=dev.vibex.desktop
Categories=Development;Utility;
Keywords=ai;agent;coding;git;editor;terminal;
EOF

  install -Dm644 "${srcdir}/vibex-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
