# Maintainer: Marc Straube <email@marcstraube.de>

# ComfyUI-Manager (>= 4.0) is a regular Python package that ComfyUI loads
# when started with --enable-manager. The AUR "comfyui" package runs ComfyUI
# from a venv at its install prefix (/opt/comfyui by default) that is created
# by its post-install scriptlet, so the manager cannot be installed into it
# at build time. This package therefore ships a reproducibly built wheel and
# installs it into that venv from its own .install scriptlet, mirroring how
# "comfyui" installs PyTorch and its requirements.

pkgname=comfyui-manager
_name=ComfyUI-Manager
pkgver=4.3
pkgrel=1
pkgdesc='Custom node, model and dependency manager for ComfyUI (installed into the comfyui venv)'
arch=('any')
url='https://github.com/Comfy-Org/ComfyUI-Manager'
license=('GPL-3.0-only')
depends=('comfyui' 'git')
makedepends=('python-build' 'python-setuptools' 'python-wheel')
install="$pkgname.install"
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'cm-cli.sh'
        'comfyui-manager.conf')
sha256sums=('299581296f802c22c5ccf2f04a7e86a2d80f3fab82d386c68e6b04d3565500fe'
            '3186ab5255845d850db3f5253bc8c9e71e8ebb04c104efe2a1cc0c03e396396c'
            '44abcd9bf5ab6bcaf50f9b4ee93c245dad4a5b383c52fb9e37aab7dabc37865d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  # Wheel consumed by the .install scriptlet (pip install into the venv).
  install -Dm644 dist/comfyui_manager-*.whl -t "$pkgdir/usr/share/$pkgname/"

  # cm-cli launcher running the venv's entry point with COMFYUI_PATH set.
  install -Dm755 "$srcdir/cm-cli.sh" "$pkgdir/usr/bin/cm-cli"

  # systemd drop-in that starts comfyui.service with --enable-manager.
  install -Dm644 "$srcdir/comfyui-manager.conf" \
    "$pkgdir/usr/lib/systemd/system/comfyui.service.d/$pkgname.conf"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CHANGELOG.md docs/en/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
