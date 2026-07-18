# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash

pkgname=bedrock-on-linux-git
pkgver=v2.0.0.r3.g760e474
pkgrel=2
pkgdesc="Run Minecraft Bedrock for Windows seamlessly on Linux."
arch=('x86_64')
url="https://github.com/Wyze3306/BedrockOnLinux"
license=('MIT')
depends=('python' 'tk' 'python-cryptography' 'tar' 'zstd' 'xdg-utils' 'xorg-xrandr' 'ca-certificates' 'curl' 'vulkan-driver')
makedepends=('git' 'python-pip')
optdepends=('xorg-xwayland: launcher and game support in Wayland sessions')
provides=('bedrock-on-linux')
conflicts=('bedrock-on-linux')
source=("$pkgname::git+$url.git"
        "customtkinter-5.2.2-py3-none-any.whl::https://files.pythonhosted.org/packages/3b/b1/b43b33001a77256b335511e75f257d001082350b8506c8807f30c98db052/customtkinter-5.2.2-py3-none-any.whl"
        "darkdetect-0.8.0-py3-none-any.whl::https://files.pythonhosted.org/packages/f2/f2/728f041460f1b9739b85ee23b45fa5a505962ea11fd85bdbe2a02b021373/darkdetect-0.8.0-py3-none-any.whl"
        "packaging-26.2-py3-none-any.whl::https://files.pythonhosted.org/packages/df/b2/87e62e8c3e2f4b32e5fe99e0b86d576da1312593b39f47d8ceef365e95ed/packaging-26.2-py3-none-any.whl"
        "python_xlib-0.33-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/fc/b8/ff33610932e0ee81ae7f1269c890f697d56ff74b9f5b2ee5d9b7fa2c5355/python_xlib-0.33-py2.py3-none-any.whl"
        "six-1.17.0-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/b7/ce/149a00dd41f10bc29e5921b496af8b574d8413afcd5e30dfa0ed46c2cc5e/six-1.17.0-py2.py3-none-any.whl")
sha256sums=('SKIP'
            '14ad3e7cd3cb3b9eb642b9d4e8711ae80d3f79fb82545ad11258eeffb2e6b37c'
            'a7509ccf517eaad92b31c214f593dbcf138ea8a43b2935406bbd565e15527a85'
            '5fc45236b9446107ff2415ce77c807cee2862cb6fac22b8a73826d0693b0980e'
            'c3534038d42e0df2f1392a1b30a15a4ff5fdc2b86cfa94f072bf11b10a164398'
            '4721f391ed90541fddacab5acf947aa0d3dc7d27b2e1e8eda2be8970586c3274')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"

  install -Dm755 bedrock-on-linux "$pkgdir/usr/lib/bedrock-on-linux/bedrock-on-linux"
  cp -r bol "$pkgdir/usr/lib/bedrock-on-linux/bol"
  find "$pkgdir/usr/lib/bedrock-on-linux" -name __pycache__ -type d -exec rm -rf {} +

  # not in official repos nor AUR at the pinned versions in upstream
  pip install --no-deps --no-index --no-build-isolation --no-compile \
    --root-user-action ignore \
    --target "$pkgdir/usr/lib/bedrock-on-linux" \
    "$srcdir"/customtkinter-5.2.2-py3-none-any.whl \
    "$srcdir"/darkdetect-0.8.0-py3-none-any.whl \
    "$srcdir"/packaging-26.2-py3-none-any.whl \
    "$srcdir"/python_xlib-0.33-py2.py3-none-any.whl \
    "$srcdir"/six-1.17.0-py2.py3-none-any.whl
  find "$pkgdir/usr/lib/bedrock-on-linux" -name __pycache__ -type d -exec rm -rf {} +
  rm -f "$pkgdir"/usr/lib/bedrock-on-linux/*.dist-info/direct_url.json

  install -Dm644 data/icon.png "$pkgdir/usr/lib/bedrock-on-linux/data/icon.png"
  install -Dm644 data/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bedrock-on-linux.png"
  install -Dm644 data/bedrock-on-linux.desktop "$pkgdir/usr/share/applications/bedrock-on-linux.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/bedrock-on-linux/README.md"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/bedrock-on-linux/bedrock-on-linux "$pkgdir/usr/bin/bedrock-on-linux"
}
