# Maintainer: Soumadip Das <soumadip+github@zohomail.in>
pkgname=quikrun
pkgver=3.1.1
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL-3.0-only")
depends=("python")
makedepends=("python-installer" "python-tomli-w")

# Protect the config file from being overwritten during updates
backup=('etc/quikrun/config.toml')

source=(
    "https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl"
    "https://raw.githubusercontent.com/soymadip/quikrun/refs/heads/main/src/scripts/gen_default_config.py"
)
sha256sums=('SKIP' 'SKIP')

package() {
    # Install the wheel package into the package directory
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"

    # Locate the site-packages dir to import the newly installed quikrun package
    local py_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    local site_packages="$pkgdir/usr/lib/python$py_version/site-packages"

    # Generate the Default Config
    PYTHONPATH="$site_packages" python "$srcdir/gen_default_config.py" "$srcdir/config.toml"

    # Install the config to /etc
    install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/quikrun/config.toml"
}