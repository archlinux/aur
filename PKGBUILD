# Maintainer: Illium <illia.pukalov@teleinformatika.eu> https://github.com/IlyaP358

# NOTE: For building in clean chroot (extra-x86_64-build), you must enable networking
# or pre-download node modules. This PKGBUILD uses yarn install which requires network.
# usage: extra-x86_64-build -- --bind-ro=/etc/resolv.conf

pkgname=pgadmin4-desktop-native
pkgver=9.12
pkgrel=1
pkgdesc="pgAdmin 4 desktop (System Electron 34 + Venv libs) built from source"
arch=('x86_64')
url="https://www.pgadmin.org/"
license=('PostgreSQL')

depends=(
  'python'
  'postgresql-libs' # For psycopg (pg_config)
  'electron34'      # System Electron 34 
  'libsecret'       # For python keyring
)
makedepends=(
  'python'
  'python-setuptools'
  'nodejs'
  'npm'
  'yarn'
  'git'
)

source=(
  "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${pkgver}/source/pgadmin4-${pkgver}.tar.gz"
  "pgadmin4.desktop"
  "pgadmin4-128x128.png"
)
sha256sums=('f72f5d688eed9f65d523046492ce868bcb4251c04f763cb6b834b13be0ad6744'
            '676447c4c91cb291f50a6ec219e2fd024a0eabdedeac2be5cebaa594bfc00595'
            '65414f475058a5cf6f784ccfdbedb812083d72f1fd98889525f68f08a148820f')

build() {
  cd "${srcdir}/pgadmin4-${pkgver}"

  # 1. Web Frontend Bundle
  sed -i '/"packageManager":/d' web/package.json
  cd web
  yarn install
  yarn run bundle
  cd ..

  # 2. Python Environment
  _venvdir="${srcdir}/venv-build"
  python -m venv "${_venvdir}"
  "${_venvdir}/bin/pip" install --upgrade pip setuptools wheel
  "${_venvdir}/bin/pip" install -r requirements.txt

  # 3. Electron Runtime Scripts
  cd runtime
  sed -i '/"packageManager":/d' package.json
  
  # Patch source code to use system python instead of venv
  grep -rl "/venv/bin/python3" . | xargs sed -i 's|/venv/bin/python3|/usr/bin/python3|g' || true
  # Patch source code to use absolute path for pgAdmin4.py
  grep -rl "/web/pgAdmin4.py" . | xargs sed -i 's|/web/pgAdmin4.py|/opt/pgadmin4-native/web/pgAdmin4.py|g' || true
  
  yarn install --ignore-engines
}

package() {
  cd "${srcdir}/pgadmin4-${pkgver}"
  local _optdir="${pkgdir}/opt/pgadmin4-native"
  local _py_ver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

  mkdir -p "${_optdir}"

  # --- Python ---
  mkdir -p "${_optdir}/python-packages"
  cp -a "${srcdir}/venv-build/lib/python${_py_ver}/site-packages/"* "${_optdir}/python-packages/"
  
  # Clean up garbage
  find "${_optdir}/python-packages" -name '__pycache__' -type d -exec rm -rf '{}' + 2>/dev/null || true
  find "${_optdir}/python-packages" -name '*.py[co]' -delete 2>/dev/null || true
  rm -rf "${_optdir}/python-packages/pip"
  rm -rf "${_optdir}/python-packages/setuptools"
  rm -rf "${_optdir}/python-packages/pkg_resources"
  rm -rf "${_optdir}/python-packages/_distutils_hack"
  rm -rf "${_optdir}/python-packages/distutils-precedence.pth"

  # --- Web ---
  cp -a web "${_optdir}/web"
  rm -rf "${_optdir}/web/node_modules"
  rm -rf "${_optdir}/web/.yarn"
  rm -rf "${_optdir}/web/.cache"

  # --- Runtime ---
  cp -a runtime "${_optdir}/runtime"
  rm -rf "${_optdir}/runtime/node_modules/electron"
  rm -rf "${_optdir}/runtime/node_modules/.cache"
  rm -rf "${_optdir}/runtime/node_modules/.bin" 

  # --- Configs ---
  cat > "${_optdir}/runtime/config.json" << EOF
{
  "pythonPath": "/usr/bin/python3",
  "pgadminFile": "/opt/pgadmin4-native/web/pgAdmin4.py"
}
EOF
  cp "${_optdir}/runtime/config.json" "${_optdir}/web/config.json"

  cat > "${_optdir}/web/config_distro.py" << EOF
import os
import sys

APP_PATH = "/opt/pgadmin4-native"
PYTHON_EXECUTABLE = "/usr/bin/python3"
WEBDIR = os.path.join(APP_PATH, "web")
FILE_PATH = os.path.join(WEBDIR, "pgAdmin4.py")

_PKG_PATH = os.path.join(APP_PATH, "python-packages")
if _PKG_PATH not in sys.path:
    sys.path.insert(0, _PKG_PATH)
EOF

  # --- Symlinks ---

  mkdir -p "${_optdir}/venv/bin"
  ln -s /usr/bin/python3 "${_optdir}/venv/bin/python3"

  mkdir -p "${pkgdir}/web"
  ln -s /opt/pgadmin4-native/web/pgAdmin4.py "${pkgdir}/web/pgAdmin4.py"

  # --- Launcher ---
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/pgadmin4" << 'LAUNCHER'
#!/bin/bash
set -e
export PYTHONPATH="/opt/pgadmin4-native/python-packages"
export PYTHONHOME="/usr"
export PGADMIN_PYTHON_DIR="/usr/bin/python3"

# Clean up old user config
if [ -f ~/.config/pgadmin4/config.json ]; then
    rm -f ~/.config/pgadmin4/config.json
fi

# Check for Electron
if command -v electron34 &> /dev/null; then
    _ELECTRON=electron34
elif command -v electron &> /dev/null; then
    _ELECTRON=electron
else
    echo "Error: electron34 not found."
    exit 1
fi

cd /opt/pgadmin4-native/web
exec "$_ELECTRON" /opt/pgadmin4-native/runtime
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/pgadmin4"

  # --- Desktop Integration ---
  install -Dm644 "${srcdir}/pgadmin4.desktop" \
    "${pkgdir}/usr/share/applications/pgadmin4.desktop"
  sed -i 's|^Exec=.*|Exec=/usr/bin/pgadmin4|' \
    "${pkgdir}/usr/share/applications/pgadmin4.desktop"
  install -Dm644 "${srcdir}/pgadmin4-128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pgadmin4.png"

  # Permissions
  chmod -R u=rwX,go=rX "${_optdir}"
}
