# Maintainer: rpupo63 <rpupo63@users.noreply.github.com>
pkgname=ai-rules-generator
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool that generates comprehensive AI coding agent rules for Cursor and Claude Code"
arch=('any')
url="https://github.com/rpupo63/ai-rules-generator"
license=('MIT')
depends=('python' 'python-setuptools')
optdepends=(
    'python-openai: For OpenAI provider support'
    'python-anthropic: For Anthropic Claude provider support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')

# ============================================================================
# LOCAL TESTING CONFIGURATION (current)
# ============================================================================
# For local testing: empty source array, prepare() will handle it
source=()

# ============================================================================
# AUR PUBLISHING CONFIGURATION
# ============================================================================
# When ready to publish to AUR, replace the source=() line above with:
# source=("$pkgname-$pkgver.tar.gz::https://github.com/rpupo63/$pkgname/archive/v$pkgver.tar.gz")
# sha256sums=('REPLACE_WITH_ACTUAL_CHECKSUM')
# And comment out or remove the prepare() function below

prepare() {
    # Find the source directory by looking for pyproject.toml
    local source_dir=""
    local check_dir="${startdir}"
    
    # Walk up the directory tree to find pyproject.toml
    while [ -n "${check_dir}" ] && [ "${check_dir}" != "/" ]; do
        if [ -f "${check_dir}/pyproject.toml" ]; then
            source_dir="$(realpath "${check_dir}")"
            break
        fi
        check_dir="$(dirname "${check_dir}")"
    done
    
    if [ -z "${source_dir}" ]; then
        error "Could not find source directory. Please run makepkg from the project root or a subdirectory containing PKGBUILD."
        return 1
    fi
    
    # Clean up any existing broken directory first
    if [ -d "${srcdir}/${pkgname}-${pkgver}" ]; then
        rm -rf "${srcdir}/${pkgname}-${pkgver}"
    fi
    
    # Copy source to expected location
    if [ -n "${source_dir}" ]; then
        msg2 "Copying source from ${source_dir}..."
        mkdir -p "${srcdir}/${pkgname}-${pkgver}"
        
        # Use rsync if available (most reliable), otherwise use tar
        if command -v rsync >/dev/null 2>&1; then
            cd "${source_dir}" || return 1
            if ! rsync -a --exclude='.package-manager-repos' \
                  --exclude='.git' \
                  --exclude='venv' \
                  --exclude='dist' \
                  --exclude='build' \
                  --exclude='.pytest_cache' \
                  --exclude='__pycache__' \
                  --exclude='*.egg-info' \
                  --exclude='*.pyc' \
                  --exclude='.env' \
                  ./ "${srcdir}/${pkgname}-${pkgver}/"; then
                error "rsync failed to copy source files"
                return 1
            fi
        else
            # Fallback to tar
            cd "${source_dir}" || return 1
            if ! tar --exclude='.package-manager-repos' \
                --exclude='.git' \
                --exclude='venv' \
                --exclude='dist' \
                --exclude='build' \
                --exclude='.pytest_cache' \
                --exclude='__pycache__' \
                --exclude='*.egg-info' \
                --exclude='*.pyc' \
                --exclude='.env' \
                -cf - . | tar -C "${srcdir}/${pkgname}-${pkgver}" -xf -; then
                error "tar failed to copy source files"
                return 1
            fi
        fi
        
        # Verify critical files were copied
        if [ ! -d "${srcdir}/${pkgname}-${pkgver}/ai_rules_generator" ] || [ ! -f "${srcdir}/${pkgname}-${pkgver}/pyproject.toml" ]; then
            error "Failed to copy source files correctly. Missing ai_rules_generator directory or pyproject.toml"
            error "Contents of ${srcdir}/${pkgname}-${pkgver}:"
            ls -la "${srcdir}/${pkgname}-${pkgver}/" | head -20
            return 1
        fi
        
        # Additional cleanup for any files that might have slipped through
        msg2 "Cleaning up unnecessary files..."
        rm -rf "${srcdir}/${pkgname}-${pkgver}/.git" 2>/dev/null || true
        rm -rf "${srcdir}/${pkgname}-${pkgver}/venv" 2>/dev/null || true
        rm -rf "${srcdir}/${pkgname}-${pkgver}/dist" 2>/dev/null || true
        rm -rf "${srcdir}/${pkgname}-${pkgver}/build" 2>/dev/null || true
        rm -rf "${srcdir}/${pkgname}-${pkgver}/.pytest_cache" 2>/dev/null || true
        rm -rf "${srcdir}/${pkgname}-${pkgver}/.package-manager-repos" 2>/dev/null || true
        find "${srcdir}/${pkgname}-${pkgver}" -name "*.pyc" -delete 2>/dev/null || true
        find "${srcdir}/${pkgname}-${pkgver}" -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
        find "${srcdir}/${pkgname}-${pkgver}" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
    fi
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
