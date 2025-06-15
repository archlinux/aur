# Maintainer: Igor Ochocki <unigniu14@gmail.com>
# Contributor: Igor Ochocki <unigniu14@gmail.com>

pkgname=pxe-boot-admin
_gitname=PXEBootAdmin
pkgver=0.1.1
pkgrel=1
pkgdesc="NextJS application for WUT SK, with Nginx reverse proxy and self-signed HTTPS."
arch=('x86_64')
url="https://github.com/Igor-Ochocki/PXEBootAdmin"
license=('MIT')

# Runtime dependencies
depends=(
  'nodejs>=18'
  'npm'
  'nginx'
  'openssl'
  'at'
)

# Build-time dependencies
makedepends=(
  'git'
)

# Optional dependencies
optdepends=(
  "certbot: for obtaining publicly trusted SSL certificates from the Let's Encrypt CA" # Corrected for better syntax highlighting
  'python-certbot-nginx: Nginx plugin for Certbot'
)

# Source files:
source=(
  "${_gitname}::git+${url}.git#branch=main" # Or use: "${_gitname}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.nginx"
  "${pkgname}.service"
  "${pkgname}.install"
  "${pkgname}.env.example"
)

sha256sums=('SKIP'
            '746b2ed93da806516ebb4bf82dbceb94a9f19cf2cba41de4d76f16d64de6f336'
            'ae4dd3fb82df432ffa561f8f696732780cd4c41f1edf69739d1dd4ec4b13684d'
            'f4774a281d2e41d327839a5eaa0a454db252aa52bddde954d32eb0d192cf709d'
            '9992887ad11bd513e6e4046498a76aea82e8bbed914ac1cac740209a0e580d4e')

install="${pkgname}.install"

backup=(
  "etc/nginx/conf.d/${pkgname}.conf"
  "etc/${pkgname}/environment.example"
)

prepare() {
  cd "${srcdir}/${_gitname}"
  # Any patching or source preparation can go here if needed
}

build() {
  cd "${srcdir}/${_gitname}"

  export NODE_ENV=production

  # Using npm ci for reproducible builds (requires package-lock.json or npm-shrinkwrap.json)
  # Install all dependencies, including devDependencies needed for the build
  npm ci --verbose --production=false

  # Run the NextJS build command
  # This will also compile instrumentation.ts (if configured and present) into .next/server/instrumentation.js
  npm run build --verbose

  # Remove devDependencies after build to reduce size of node_modules for packaging
  npm prune --production
}

package() {
  cd "${srcdir}/${_gitname}" # Change to the root of your cloned source code

  local app_install_dir="${pkgdir}/opt/${pkgname}"

  # Safety check for the installation directory path
  if [ -z "${app_install_dir}" ] || [ "${app_install_dir}" = "/" ]; then
    echo "CRITICAL ERROR: app_install_dir is invalid or resolved to root: '${app_install_dir}'" >&2
    return 1
  fi

  # Create the application installation directory
  install -d -m755 "${app_install_dir}"
  if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create application directory ${app_install_dir}" >&2
    return 1
  fi

  # Copy essential Next.js files
  # 1. package.json (needed by `next start`)
  if [ -f package.json ]; then
    install -Dm644 package.json "${app_install_dir}/package.json"
  else
    echo "ERROR: package.json not found in source directory $(pwd)" >&2
    return 1
  fi

  # 2. next.config.ts (or .js, .mjs) (needed by `next start` for runtime config)
  # Ensure this file is in the root of your project source, not in src/
  if [ -f next.config.ts ]; then
    install -Dm644 next.config.ts "${app_install_dir}/next.config.ts"
  elif [ -f next.config.js ]; then
    install -Dm644 next.config.js "${app_install_dir}/next.config.js"
  elif [ -f next.config.mjs ]; then
    install -Dm644 next.config.mjs "${app_install_dir}/next.config.mjs"
  else
    echo "Warning: next.config.[ts/js/mjs] not found in source directory $(pwd). Custom Next.js configurations might not apply." >&2
  fi

  # Install custom executable files
  install -Dm755 create-station-symlink "${app_install_dir}/create-station-symlink"
  install -Dm755 schedule-task "${app_install_dir}/schedule-task"

  # 3. public directory (if it exists)
  if [ -d public ]; then
    cp -a --no-preserve=ownership public "${app_install_dir}/"
  fi

  # 4. .next directory (build output, includes compiled instrumentation.js if used)
  if [ -d .next ]; then
    cp -a --no-preserve=ownership .next "${app_install_dir}/"
  else
    echo "ERROR: .next directory not found in $(pwd) after build. Build may have failed." >&2
    return 1
  fi

  # 5. node_modules (with production dependencies only, after 'npm prune --production' in build())
  if [ -d node_modules ]; then
    cp -a --no-preserve=ownership node_modules "${app_install_dir}/"
  else
    echo "ERROR: node_modules directory not found in $(pwd) after build/prune. Dependencies may be missing." >&2
    return 1
  fi

  # Set execute permissions for binaries in node_modules/.bin
  if [ -d "${app_install_dir}/node_modules/.bin" ]; then
    find "${app_install_dir}/node_modules/.bin" -type f -exec chmod 755 {} \;
  fi

  # Install Nginx configuration file
  install -d "${pkgdir}/etc/nginx/conf.d"
  install -Dm644 "${srcdir}/${pkgname}.nginx" "${pkgdir}/etc/nginx/conf.d/${pkgname}.conf"

  # Install systemd service file
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # Install environment example file
  install -d "${pkgdir}/etc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.env.example" "${pkgdir}/etc/${pkgname}/environment.example"
}
