# Maintainer: Swyam Sharma <swyamsharma13102003@gmail.com>

# Package metadata
pkgname=env-tui
_pkgname=env-tui # Internal variable, often same as pkgname
pkgver=0.1.0     # <-- IMPORTANT: This MUST match the tag on your GitHub release (e.g., tag v0.1.0)
pkgrel=1         # Start at 1. Increment only if PKGBUILD changes but pkgver doesn't.
pkgdesc="A Textual TUI for managing environment variables"
arch=('any')     # Pure Python packages are architecture-independent
url="https://github.com/Swyamsharma/env-tui"
license=('MIT')  # Ensure this matches the LICENSE file in your repo

# Dependencies needed to RUN the package
# Core Python is required. Other Python dependencies are now managed by pyproject.toml
depends=(
    'python'
)

# Dependencies needed only to BUILD the package
# python-build uses pyproject.toml to determine and fetch build dependencies like hatchling.
makedepends=(
    'python-build'     # Standard PEP 517 build frontend
    'python-installer' # Standard tool to install wheels
    'python-wheel'     # Needed by python-build
)

# Optional dependencies for extra features
optdepends=(
    'xclip: for clipboard support (X11)'
    'wl-clipboard: for clipboard support (Wayland)'
    'xsel: for clipboard support (X11 alternate)'
)

# Source URL pointing to the release tarball on GitHub
# Assumes your tag is named 'vX.Y.Z' (like v0.1.0)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# --- OR --- If your tag is just 'X.Y.Z' (like 0.1.0), use this line instead:
# source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

# SHA256 checksum for the source tarball.
# Fill this automatically using 'updpkgsums' command after saving the PKGBUILD.
sha256sums=('c9826c51110fc05da530d4db7816566cfe2139bea200b7f792ce85622b62bf54')

# Build function: Compile/prepare the package (builds the Python wheel)
build() {
  # cd into the source directory extracted from the tarball
  # The directory name is usually PROJECTNAME-VERSION (e.g., env-tui-0.1.0)
  cd "$srcdir/${_pkgname}-${pkgver}"

  # Use the standard PEP 517 builder.
  # --no-isolation: Use dependencies defined in makedepends, faster and standard for Arch.
  python -m build --wheel --no-isolation
}

# Package function: Install the built files into the package staging directory ($pkgdir)
package() {
  # cd into the source directory again
  cd "$srcdir/${_pkgname}-${pkgver}"

  # Use the standard PEP 517 installer to install the wheel built in build()
  # Installs into $pkgdir, respecting standard Python directory layout (/usr/lib/pythonX.Y/site-packages)
  # The 'dist/*.whl' wildcard finds the generated wheel file.
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license file to the standard location
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install README documentation (optional, but good practice)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Optional: Vim modeline for consistent editing settings
# vim:set ts=2 sw=2 et:
