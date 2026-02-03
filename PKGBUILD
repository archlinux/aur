# Maintainer:
# Contributor: memchr

: ${_install_path:=usr/lib}

_pkgname="piper-tts"
pkgname="$_pkgname-git"
pkgver=1.4.0.r0.g490b4df
pkgrel=3
epoch=1
pkgdesc="A fast, local neural text to speech system"
url="https://github.com/OHF-Voice/piper1-gpl"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'python'
  'python-onnxruntime'
  'python-pathvalidate' # AUR
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-scikit-build'
  'python-wheel'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  local _venv_path="$pkgdir/$_install_path/$_pkgname"
  cd "$_pkgsrc"

  python -m venv --system-site-packages "$_venv_path"
  "$_venv_path/bin/pip3" install dist/*.whl

  # compile with path adjustment
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"

  # unwanted files
  rm -f "$_venv_path/.gitignore"

  # relocate venv (remove build paths)
  sed -e "s|$_venv_path|/$_install_path/$_pkgname|g" \
    -i "$_venv_path"/pyvenv.cfg \
    "$_venv_path"/bin/*

  # symlink
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf /usr/lib/piper-tts/bin/piper "$pkgdir/usr/bin/piper-tts"
}
