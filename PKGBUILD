# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=rdc-cli
pkgver=0.6.1
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
conflicts=('rdc-cli-git')
source=(
  "rdc-cli-${pkgver}.tar.gz::https://github.com/BANANASJIM/rdc-cli/archive/refs/tags/v${pkgver}.tar.gz"
  "git+https://github.com/baldurk/renderdoc.git#tag=v1.41"
  "renderdoc-swig::https://github.com/baldurk/swig/archive/renderdoc-modified-7.zip"
)
sha256sums=('1d547e6a57e409df4c1499ade6ec42a9148b0aade8bc566f84642a8805aa7517'
            'SKIP'
            '9d7e5013ada6c42ec95ab167a34db52c1cc8c09b89c8e9373631b1f10596c648')

build() {
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

  cd "$srcdir/rdc-cli-${pkgver}"
  python -m build --wheel --no-isolation

  PYTHONPATH="$srcdir/rdc-cli-${pkgver}/src" python -c "
from rdc.commands.completion import _generate
for shell, path in [('bash','$srcdir/rdc.bash'),('zsh','$srcdir/_rdc'),('fish','$srcdir/rdc.fish')]:
    with open(path, 'w') as f:
        f.write(_generate(shell))
"
}

package() {
  cd "rdc-cli-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  install -Dm755 "$srcdir/renderdoc/build/lib/renderdoc.so" "$pkgdir/$_site/renderdoc.so"
  install -Dm755 "$srcdir/renderdoc/build/lib/librenderdoc.so" "$pkgdir/$_site/librenderdoc.so"

  install -Dm644 "$srcdir/rdc.bash" "$pkgdir/usr/share/bash-completion/completions/rdc"
  install -Dm644 "$srcdir/_rdc" "$pkgdir/usr/share/zsh/site-functions/_rdc"
  install -Dm644 "$srcdir/rdc.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rdc.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
