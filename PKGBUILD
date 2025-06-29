# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=voice2json-git
pkgrel=3
pkgver=2.1.r12.g03996c9
pkgdesc="Command-line tools for speech and intent recognition on Linux. Self contained venv"
arch=('x86_64')
url="https://github.com/synesthesiam/voice2json"
license=('MIT')
depends=('python>=3.8')
makedepends=('git' 'uv')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('voice2json::git+https://github.com/synesthesiam/voice2json.git'
         'fix-requirements.patch'
         'add-pyproject-toml.patch')
md5sums=('SKIP'
         '7890a0912c84ccc1959395d87d9cce81'
         '92ef759873ef590a315404877c616850')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	
	# Apply patches
	patch -p1 < "$srcdir/fix-requirements.patch"
	
	# Remove existing pyproject.toml if it exists and apply patch
	rm -f pyproject.toml
	patch -p1 < "$srcdir/add-pyproject-toml.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	
	# Lock dependencies with uv for reproducible builds
	# Use system python
	uv lock --python /usr/bin/python3
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# Tests require specific models and configurations
	# Skip tests for now
	true
}

package() {
	cd "$srcdir/${pkgname%-git}"
	
	# Create venv in package directory using system python
	export UV_PROJECT_ENVIRONMENT="$pkgdir/usr/share/voice2json/venv"
	uv sync --frozen --python /usr/bin/python3
	
	# Fix hardcoded paths in venv scripts and files
	find "$pkgdir/usr/share/voice2json/venv" -name "activate*" -type f -exec sed -i "s|$pkgdir||g" {} \;
	find "$pkgdir/usr/share/voice2json/venv" -name "*.py" -type f -exec sed -i "s|$srcdir/${pkgname%-git}|/usr/share/voice2json|g" {} \;
	find "$pkgdir/usr/share/voice2json/venv" -name "*.json" -type f -exec sed -i "s|$srcdir/${pkgname%-git}|/usr/share/voice2json|g" {} \;
	find "$pkgdir/usr/share/voice2json/venv/bin" -type f -exec sed -i "s|$pkgdir||g" {} \;
	
	# Install voice2json source code
	install -dm755 "$pkgdir/usr/share/voice2json"
	cp -r voice2json "$pkgdir/usr/share/voice2json/"
	cp VERSION "$pkgdir/usr/share/voice2json/"
	
	# Install voice2json data files
	install -dm755 "$pkgdir/usr/share/voice2json/etc"
	cp -r etc/* "$pkgdir/usr/share/voice2json/etc/"
	
	# Create wrapper script to use the venv with correct data path
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/voice2json" << 'EOF'
#!/bin/bash
export VOICE2JSON_PROFILES_DIR="/usr/share/voice2json/etc/profiles"
exec /usr/share/voice2json/venv/bin/python -m voice2json --base-directory /usr/share/voice2json "$@"
EOF
	
	# Install license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
