# Maintainer: Matthew Bielik (matej.bielik@proton.me)
pkgname=illogical-updots
pkgver=1.1.0
pkgrel=1
pkgdesc="GTK based updater for end4 dotfiles"
arch=('any')
url="https://github.com/FoxyIsCoding/illogical-updots"
license=('custom')
depends=(
  'python'
  'git'
  'adwaita-icon-theme'
  'gdk-pixbuf2'
  'librsvg'
)
optdepends=(
  'fish: required to run installer scripts (uses fish shell)'
)
# If you have a tag v1.0.6 use #tag=, otherwise pin a commit with #commit=
source=(
  "git+https://github.com/FoxyIsCoding/illogical-updots.git"
  "illogical-updots.png::https://github.com/FoxyIsCoding/illogical-updots/blob/main/.github/assets/logo.png?raw=true"
)
# Git sources and remote icon use SKIP
sha256sums=('SKIP'
            'f7b466432d66170f48c4c1715741b3abd424888ccd72e0ce2c9fb20c75c47854')

# If you later add extra source files (like a desktop template kept outside repo),
# append them to source=() and add corresponding checksums.

# Optional: set PYTHON - if you need pythonX.Y specifically, detect it here.
_py=python

prepare() {
  cd "${srcdir}/${pkgname}"

  # If there is any generation step (e.g. compiling resources, building UI), do it here.
  # Example (uncomment if needed):
  # ${_py} scripts/generate_assets.py
}

build() {
  cd "${srcdir}/${pkgname}"
  # If it's a standard Python project with pyproject.toml:
  # ${_py} -m build --wheel --no-isolation
  #
  # If not, and it's just scripts, nothing is required here.
  :
}

package() {
  cd "${srcdir}/${pkgname}"

  # 1. Install code
  # Decide whether to install as a Python module (site-packages) or as an app bundle.
  # If the repo is just loose scripts, this pattern is fine:
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r ./* "${pkgdir}/usr/lib/${pkgname}"

  # (Optional) If you built a wheel above, install it instead:
  # ${_py} -m installer --destdir="${pkgdir}" dist/*.whl

  # 2. Provide an executable launcher in /usr/bin
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/usr/bin/env python
# Wrapper script to launch Illogical Updots
import os, sys, runpy

# Adjust if the real entry file/module differs.
BASE = "/usr/lib/illogical-updots"
ENTRY = "app.py"  # TODO: change to the actual main script if different.

sys.path.insert(0, BASE)
target = os.path.join(BASE, ENTRY)
if not os.path.exists(target):
    sys.stderr.write(f"Error: expected entrypoint {target} not found.\n")
    sys.exit(1)
runpy.run_path(target, run_name="__main__")
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  # 3. Install desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Illogical Updots
Exec=illogical-updots
Icon=illogical-updots
Terminal=false
Categories=Utility;
StartupNotify=false
EOF


  # Icon downloaded as illogical-updots.png from source array
  ICON_SOURCE="${srcdir}/illogical-updots.png"
  if [[ -f "${ICON_SOURCE}" ]]; then
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "${ICON_SOURCE}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  else
    printf 'WARNING: Icon file %s not found; adjust ICON_SOURCE in PKGBUILD.\n' "${ICON_SOURCE}"
  fi

  # 5. License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  if [[ -f LICENSE ]]; then
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    # If no LICENSE file, provide a stub or remove this block.
    echo "License file missing; please add one." > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # 6. (Optional) Cleanup unwanted files (tests, .git, etc.)
  find "${pkgdir}/usr/lib/${pkgname}" -name '.git*' -prune -exec rm -rf {} +
  # Remove packaging / build artifacts if any
  rm -rf "${pkgdir}/usr/lib/${pkgname}/dist" 2>/dev/null || true
  rm -rf "${pkgdir}/usr/lib/${pkgname}/build" 2>/dev/null || true
}

# vim: set ts=2 sw=2 et:
