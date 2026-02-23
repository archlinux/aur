# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=rdc-cli-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Unix-friendly CLI for RenderDoc .rdc captures"
arch=('x86_64')
url="https://github.com/BANANASJIM/rdc-cli"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-pillow'
  'python-numpy'
  'libx11'
  'libxcb'
  'xcb-util-keysyms'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'cmake'
  'ninja'
  'pcre'
)
optdepends=(
  'python-rich: colored output support'
)
provides=('rdc-cli')
conflicts=('rdc-cli')
source=(
  "git+https://github.com/BANANASJIM/rdc-cli.git"
  "git+https://github.com/baldurk/renderdoc.git#tag=v1.41"
  "renderdoc-swig::https://github.com/baldurk/swig/archive/renderdoc-modified-7.zip"
)
sha256sums=('SKIP'
            'SKIP'
            '9d7e5013ada6c42ec95ab167a34db52c1cc8c09b89c8e9373631b1f10596c648')

pkgver() {
  cd rdc-cli
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Build renderdoc Python module (pyrenderdoc only, no Qt UI)
  # Disable LTO — breaks SWIG-generated Python bindings
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  export LDFLAGS="${LDFLAGS//-flto=auto/}"

  cd renderdoc
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_PYRENDERDOC=ON \
    -DENABLE_QRENDERDOC=OFF \
    -DENABLE_RENDERDOCCMD=OFF \
    -DENABLE_GL=OFF \
    -DENABLE_GLES=OFF \
    -DENABLE_VULKAN=ON \
    -DRENDERDOC_SWIG_PACKAGE="$srcdir/renderdoc-swig"
  cmake --build build

  # Build rdc-cli wheel
  cd "$srcdir/rdc-cli"
  python -m build --wheel --no-isolation

  # Generate shell completion scripts
  PYTHONPATH="$srcdir/rdc-cli/src" python -c "
from rdc.commands.completion import _generate
for shell, path in [('bash','$srcdir/rdc.bash'),('zsh','$srcdir/_rdc'),('fish','$srcdir/rdc.fish')]:
    with open(path, 'w') as f:
        f.write(_generate(shell))
"
}

package() {
  # Install rdc-cli
  cd rdc-cli
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install renderdoc Python module
  local _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  install -Dm755 "$srcdir/renderdoc/build/lib/renderdoc.so" "$pkgdir/$_site/renderdoc.so"
  install -Dm755 "$srcdir/renderdoc/build/lib/librenderdoc.so" "$pkgdir/$_site/librenderdoc.so"

  # Install shell completions
  install -Dm644 "$srcdir/rdc.bash" "$pkgdir/usr/share/bash-completion/completions/rdc"
  install -Dm644 "$srcdir/_rdc" "$pkgdir/usr/share/zsh/site-functions/_rdc"
  install -Dm644 "$srcdir/rdc.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rdc.fish"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
