# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=searxng-rama
_pkgname=searxng
pkgver=r9625.ef8f647
pkgrel=1
pkgdesc="SearXNG with a modern theme, secure defaults and systemd service"
arch=('any')
url="https://github.com/Nomadcxx/searxng-RAMA"
license=('AGPL3')
depends=('python' 'systemd')
makedepends=('openssl' 'git' 'python-virtualenv' 'npm' 'gcc' 'make' 'libvips' 'python' 'pkgconf')
optdepends=(
    'redis: Caching support for improved performance'
    'valkey: Alternative caching support'
    'libmagic: File type detection for uploads'
    'p7zip: Archive support for file upload'
)
provides=('searxng')
conflicts=('searx' 'searx-git' 'searxng')
backup=('opt/searxng-rama/searx/settings.yml')
install=${pkgname}.install

_giturl="https://github.com/searxng/searxng"
_gitbranch="master"
source=(git+$_giturl#branch=$_gitbranch
        git+https://github.com/Nomadcxx/searxng-RAMA.git)
b2sums=('SKIP' 'SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  # Copy all available themes to source (installer will select which to apply)
  msg2 "Copying theme files to source..."
  mkdir -p "${srcdir}/theme"

  for theme_dir in "${srcdir}/searxng-RAMA/theme"/*; do
    if [ -d "$theme_dir" ]; then
      theme_name=$(basename "$theme_dir")
      cp -r "$theme_dir" "${srcdir}/theme/$theme_name"
    fi
  done
  # gen-variant.py is a top-level file (the loop above copies only theme dirs) —
  # copy it explicitly; the variant pre-build below invokes it.
  cp "${srcdir}/searxng-RAMA/theme/gen-variant.py" "${srcdir}/theme/gen-variant.py"

  # Apply RAMA theme customizations to source (default for backward compatibility)
  msg2 "Applying RAMA theme customizations..."

  # Copy RAMA definitions.less to client source (this is where theme is built from)
  cp "${srcdir}/theme/rama/definitions.less" "client/simple/src/less/definitions.less"

  # Copy RAMA LESS override layer (rama.less + fonts.less) into the theme directory
  mkdir -p "client/simple/src/less/themes/rama"
  cp "${srcdir}/theme/rama/rama.less" "client/simple/src/less/themes/rama/rama.less"
  cp "${srcdir}/theme/rama/fonts.less" "client/simple/src/less/themes/rama/fonts.less"

  # Append the rama.less import as the LAST entry in style.less so it wins the cascade
  grep -q 'themes/rama/rama.less' "client/simple/src/less/style.less" || \
    echo '@import "themes/rama/rama.less";' >> "client/simple/src/less/style.less"

  # Copy RAMA branding assets to client source BEFORE building (vite generates assets from these)
  msg2 "Installing RAMA branding assets to client source..."

  # Ensure brand directory exists
  mkdir -p "client/simple/src/brand"

  # Create a minimal placeholder searxng.svg (vite plugin needs this, but we'll overwrite PNG after build)
  # This prevents vite build from failing if searxng.svg is missing
  cat > "client/simple/src/brand/searxng.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 20">
  <text x="5" y="15" font-family="monospace" font-size="12" fill="#ef233c">SEARXNG</text>
</svg>
EOF

  # Copy RAMA red favicon SVG - vite will generate favicon.png and favicon.svg from this
  if [ -f "${srcdir}/searxng-RAMA/assets/favicon.svg" ]; then
    cp "${srcdir}/searxng-RAMA/assets/favicon.svg" "client/simple/src/brand/searxng-wordmark.svg"
  fi

  # Copy empty favicon SVG to source (vite plugin processes this)
  if [ -f "${srcdir}/searxng-RAMA/assets/empty_favicon.svg" ]; then
    mkdir -p "client/simple/src/svg"
    cp "${srcdir}/searxng-RAMA/assets/empty_favicon.svg" "client/simple/src/svg/empty_favicon.svg"
  fi

  # Build the theme with RAMA styling
  msg2 "Building RAMA theme..."
  cd client/simple

  # Install npm dependencies - skip postinstall scripts to avoid sharp native build issues
  npm install --no-audit --no-fund --ignore-scripts

  # Build only the vite part (CSS compilation) - skip icons which needs sharp
  # This first build is the RAMA (default) variant.
  npx vite build

  # --- Pre-build theme variants for runtime theme-switching ---
  # Each switchable variant is a self-contained CSS bundle; the theme switcher
  # swaps which bundle is served (see cmd/rama-installer applyTheme). vite's
  # emptyOutDir wipes the output dir on every build, so stash each variant's CSS
  # OUTSIDE that dir and copy them all back after the final build.
  msg2 "Pre-building theme variants (rama, google-light, google-dark)..."
  _cssdir="$srcdir/$_pkgname/searx/static/themes/simple"
  _variantcss="$srcdir/variant-css"
  mkdir -p "$_variantcss"
  cp "$_cssdir/sxng-ltr.min.css" "$_variantcss/sxng-ltr.rama.min.css"
  cp "$_cssdir/sxng-rtl.min.css" "$_variantcss/sxng-rtl.rama.min.css"

  for _variant in google-light google-dark; do
    _which="${_variant#google-}"
    python "${srcdir}/theme/gen-variant.py" "${srcdir}/theme/google/definitions.less" "$_which" > "src/less/definitions.less"
    npx vite build
    cp "$_cssdir/sxng-ltr.min.css" "$_variantcss/sxng-ltr.${_variant}.min.css"
    cp "$_cssdir/sxng-rtl.min.css" "$_variantcss/sxng-rtl.${_variant}.min.css"
  done

  # Publish every variant bundle, then restore RAMA as the default served files.
  cp "$_variantcss/"*.min.css "$_cssdir/"
  cp "$_variantcss/sxng-ltr.rama.min.css" "$_cssdir/sxng-ltr.min.css"
  cp "$_variantcss/sxng-rtl.rama.min.css" "$_cssdir/sxng-rtl.min.css"

  cd "$srcdir/$_pkgname"

  # Copy self-hosted woff2 fonts into the static tree AFTER vite build (vite's emptyOutDir wipes it if done before)
  mkdir -p "searx/static/themes/simple/fonts"
  cp "${srcdir}/theme/rama/fonts/"*.woff2 "searx/static/themes/simple/fonts/"

  # Copy RAMA template forks (index.html hero + results.html sticky header) over the simple theme
  cp "${srcdir}/theme/rama/templates/"*.html "searx/templates/simple/"

  # Copy custom RAMA assets AFTER vite build (overwrite generated files)
  msg2 "Installing custom RAMA logo and favicon..."

  # Copy custom ASCII-style "SEARXNG" logo PNG (overwrites vite-generated searxng.png)
  if [ -f "${srcdir}/searxng-RAMA/brand/searxng.png" ]; then
    cp "${srcdir}/searxng-RAMA/brand/searxng.png" "searx/static/themes/simple/img/searxng.png"
  fi

  # Copy red favicon files directly (ensure they're present)
  if [ -f "${srcdir}/searxng-RAMA/assets/favicon.svg" ]; then
    cp "${srcdir}/searxng-RAMA/assets/favicon.svg" "searx/static/themes/simple/img/favicon.svg"
  fi

  if [ -f "${srcdir}/searxng-RAMA/assets/favicon.png" ]; then
    cp "${srcdir}/searxng-RAMA/assets/favicon.png" "searx/static/themes/simple/img/favicon.png"
  fi

  if [ -f "${srcdir}/searxng-RAMA/assets/empty_favicon.svg" ]; then
    cp "${srcdir}/searxng-RAMA/assets/empty_favicon.svg" "searx/static/themes/simple/img/empty_favicon.svg"
  fi

  # NOTE: the theme-build steps above mirror scripts/build-themes.sh (used by the
  # cross-distro install.sh). Keep the two in sync. Theme switching now swaps the
  # pre-built sxng-<side>.<variant>.min.css bundles produced above — the old
  # themes/<name>/definitions.less copy is obsolete and intentionally removed.

  # Create version file
  cat > searx/version_frozen.py << EOF
# THIS FILE IS GENERATED BY THE BUILD PROCESS
# DO NOT EDIT IT MANUALLY

VERSION_STRING = "1.1.0-RAMA"
VERSION_TAG = "1.1.0-RAMA"
DOCKER_TAG = "1.1.0-RAMA"
GIT_URL = "${_giturl}"
GIT_BRANCH = "${_gitbranch}"
EOF
}

package() {
  cd "$srcdir/$_pkgname"

  # Create installation directory
  install -dm755 "$pkgdir/opt/searxng-rama"

  # Copy SearXNG source files (includes built theme in searx/static/themes/simple/)
  msg2 "Copying SearXNG files..."
  cp -r searx "$pkgdir/opt/searxng-rama/"

  # Copy additional directories if they exist
  for dir in dockerfiles docs utils; do
    if [ -d "$dir" ]; then
      cp -r "$dir" "$pkgdir/opt/searxng-rama/"
    fi
  done

  # Copy essential files
  for file in Makefile manage requirements.txt requirements-dev.txt setup.py babel.cfg; do
    if [ -f "$file" ]; then
      install -Dm644 "$file" "$pkgdir/opt/searxng-rama/$file"
    fi
  done

  # Copy .git directory for version info
  if [ -d ".git" ]; then
    cp -r .git "$pkgdir/opt/searxng-rama/"
  fi

  # RAMA assets already copied to source in build() and compiled by vite

  # Modify STATIC settings only (verify each placeholder exists before replacing).
  # The secret_key is intentionally NOT set here — generating it at package time
  # would bake one shared key into the package (in a backup= file). It is generated
  # per-machine in post_install() (see searxng-rama.install); the "ultrasecretkey"
  # placeholder is shipped as-is and replaced on the user's system.
  msg2 "Configuring settings..."
  local settings_file="${pkgdir}/opt/searxng-rama/searx/settings.yml"

  grep -q 'secret_key: "ultrasecretkey"' "$settings_file" || { echo "ERROR: secret_key placeholder not found"; exit 1; }
  grep -q 'port: 8888' "$settings_file" || { echo "ERROR: port placeholder not found"; exit 1; }
  sed -i "s/port: 8888/port: 8855/" "$settings_file"
  grep -q 'bind_address: "127.0.0.1"' "$settings_file" || { echo "ERROR: bind_address placeholder not found"; exit 1; }
  sed -i 's/bind_address: "127.0.0.1"/bind_address: "0.0.0.0"/' "$settings_file"
  grep -q 'instance_name: "SearXNG"' "$settings_file" || { echo "ERROR: instance_name placeholder not found"; exit 1; }
  sed -i 's/instance_name: "SearXNG"/instance_name: "SearXNG RAMA Edition"/' "$settings_file"

  # Create Python virtual environment
  msg2 "Creating Python virtual environment..."
  export PIP_DISABLE_PIP_VERSION_CHECK=1
  export PYTHONDONTWRITEBYTECODE=1
  python -m venv "$pkgdir/opt/searxng-rama/venv"

  # Install dependencies in venv
  msg2 "Installing Python dependencies..."
  "$pkgdir/opt/searxng-rama/venv/bin/pip" install --upgrade pip wheel
  "$pkgdir/opt/searxng-rama/venv/bin/pip" install -r "${srcdir}/${_pkgname}/requirements.txt"

  # Fix venv shebangs to use final install path (remove pkgdir prefix)
  msg2 "Fixing virtual environment paths..."
  find "$pkgdir/opt/searxng-rama/venv/bin" -type f -exec sed -i "s|${pkgdir}||g" {} +
  if [ -f "$pkgdir/opt/searxng-rama/venv/pyvenv.cfg" ]; then
    sed -i "s|${pkgdir}||g" "$pkgdir/opt/searxng-rama/venv/pyvenv.cfg"
  fi

  # Clean up bytecode
  find "$pkgdir/opt/searxng-rama/venv" -type f -name "*.py[co]" -delete
  find "$pkgdir/opt/searxng-rama/venv" -type d -name "__pycache__" -delete

  # Create executable wrapper
  msg2 "Creating wrapper script..."
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/searxng-rama-run" << 'EOF'
#!/bin/bash
export SEARXNG_SETTINGS_PATH=/opt/searxng-rama/searx/settings.yml
cd /opt/searxng-rama
exec /opt/searxng-rama/venv/bin/python -m searx.webapp "$@"
EOF
  chmod +x "$pkgdir/usr/bin/searxng-rama-run"

  # Theme switcher: swaps the pre-built variant bundles built above. This is the
  # supported way to change themes on the AUR install (no TUI is shipped).
  install -Dm755 "${srcdir}/searxng-RAMA/scripts/searxng-rama-theme" \
    "$pkgdir/usr/bin/searxng-rama-theme"

  # Install systemd service
  msg2 "Installing systemd service..."
  install -dm755 "${pkgdir}/etc/systemd/system"
  cat > "${pkgdir}/etc/systemd/system/searxng-rama.service" << 'EOF'
[Unit]
Description=RAMA SearXNG
After=network.target

[Service]
Type=simple
User=searxng
WorkingDirectory=/opt/searxng-rama
Environment="SEARXNG_SETTINGS_PATH=/opt/searxng-rama/searx/settings.yml"
ExecStart=/usr/bin/searxng-rama-run
Restart=on-failure
RestartSec=5

# SearXNG caches its engine/data SQLite DBs in the system temp dir
# (/tmp/sxng_cache_*.db). PrivateTmp gives the service its own isolated /tmp so
# those DBs can't collide with (or be owned by) another user — without it the
# service crash-loops on "attempt to write a readonly database".
PrivateTmp=true
NoNewPrivileges=true

# Permissions for database writes
ReadWritePaths=/opt/searxng-rama

[Install]
WantedBy=multi-user.target
EOF

  # Install licenses
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f "${srcdir}/searxng-RAMA/LICENSE" ]; then
    install -Dm644 "${srcdir}/searxng-RAMA/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/RAMA_LICENSE"
  fi

  # Install documentation
  if [ -f "${srcdir}/searxng-RAMA/README.md" ]; then
    install -Dm644 "${srcdir}/searxng-RAMA/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
}
