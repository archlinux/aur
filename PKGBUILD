# Maintainer: develOseven <devel.oseven@gmail.com>
pkgname=avoc
pkgver=0.0.5
pkgrel=1
epoch=
_python_version=3.12.3
_pkghashes="
	--hash=sha256:ef9be64e5f4d3894856c2602680521a191ac5b2c43834c18a14cccc9eeb1dbe3
	--hash=sha256:309e5388d459c143f594265def7383c96214d1d6460cf4f9340316a555e54282
"
pkgdesc="Local Realtime Voice Changer for Desktop"
arch=('x86_64')
url="https://github.com/develOseven/avoc"
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'ISC'
	'LGPL-2.0-or-later'
	'LGPL-2.1'
	'LGPL-3.0-only'
	'LicenseRef-NVIDIA-Proprietary'
	'MIT'
	'MPL-2.0'
	'PSF-2.0'
	'Unlicense'
)
groups=()
depends=(
	pyenv
	python
)
makedepends=(
	base-devel
	cmake
	jq
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"git+https://github.com/develOseven/$pkgname.git#tag=$pkgver"
)
noextract=()
validpgpkeys=()

_pyenv_shell() {
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init - bash)"
}

prepare() {
	_pyenv_shell
	rm -rf "$pkgname-$pkgver"
	mkdir -p "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	pyenv install --skip-existing $_python_version
	pyenv local $_python_version
	python -m venv .venv
}

build() {
	_pyenv_shell
	cd "$pkgname-$pkgver"
	source .venv/bin/activate
	# Workaround for onnxsim that uses onnx/optimizer pre 31194ccb971bbbcc8218e103c7b0a8049ddddc3e.
	CMAKE_ARGS="-DCMAKE_POLICY_VERSION_MINIMUM=3.5" \
		pip install --require-virtualenv --require-hashes \
		--requirement ../$pkgname/requirements-$_python_version.hashes.txt \
		--requirement <(echo $pkgname==$pkgver $_pkghashes)
}

check() {
	_pyenv_shell
	cd "$pkgname-$pkgver"
	source .venv/bin/activate
	pip show --require-virtualenv $pkgname
}

package() {
	_pyenv_shell
	cd "$pkgname-$pkgver"
	source .venv/bin/activate

	# Find the *.desktop and the icon.
	_pkg_files=$(pip show --require-virtualenv --files avoc)
	_site_packages=$(echo "$_pkg_files" | sed -nre 's/^Location:\s*(.*$)/\1/p')
	_desktop_file="$_site_packages/$(echo "$_pkg_files" | sed -nre 's/^\s*(.*AVoc.desktop$)/\1/p')"
	_icon_file="$_site_packages/$(echo "$_pkg_files" | sed -nre 's/^\s*(.*AVoc.svg$)/\1/p')"

	# Copy the venv.
	mkdir -p "$pkgdir/opt"
	cp -rT . "$pkgdir/opt/$pkgname"

	# Fix the venv.
	_o_venv="$PWD"
	_d_venv="/opt/$pkgname"
	_sub='{while(i=index($0,t)){$0 = substr($0,1,i-1) r substr($0,i+length(t))} print}'
	find "$pkgdir/opt/$pkgname" \
		\( -name "pyvenv.cfg" -o -path "$pkgdir/opt/$pkgname/.venv/bin/*" \) -a \
		-type f \
		-exec awk -i inplace -v t="$_o_venv" -v r="$_d_venv" "$_sub" {} \;

	# Generate the license file.
	_package_python_deps="$(echo $pkgname; pip list --format=json 2>/dev/null | jq -r '.[].name')"
	pip install --require-virtualenv --require-hashes \
		--requirement ../$pkgname/requirements-licenses-$_python_version.hashes.txt
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	pip-licenses --with-license-file --format=json --packages $_package_python_deps | \
		awk -v t="$_o_venv" -v r="$_d_venv" "$_sub" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$pkgdir/opt/$pkgname"

	# Install the *.desktop and the icon.
	mkdir -p "$pkgdir/usr/share/applications/"
	cp -t "$pkgdir/usr/share/applications/" "$_desktop_file"
	sed -i -re '/^\s*Icon\s*=/d' "$pkgdir/usr/share/applications/AVoc.desktop"
	echo "Icon=$(echo $_icon_file | awk -v t="$_o_venv" -v r="$_d_venv" "$_sub")" >> \
		"$pkgdir/usr/share/applications/AVoc.desktop"
	echo "Path=/opt/$pkgname" >> "$pkgdir/usr/share/applications/AVoc.desktop"
}
sha256sums=('3c74c20d06dba02f4d16845b1778127d4854e0c0bba09f0746c47c3c9b122027')
