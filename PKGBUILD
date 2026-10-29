# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat-venv"
pkgver=0.86.2
pkgrel=4
pkgdesc="AI pair programming in your terminal (installed with uv)"
url="https://github.com/Aider-AI/aider"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
provides=("aider-chat")
conflicts=("aider-chat")
makedepends=("uv")
# a venv has no use for a -debug package, and collecting its sources takes minutes
options=("!strip" "!debug")

_strip_pkgdir() {
 # remove mentions of $pkgdir in files and symlinks
 grep -RIlZ "$pkgdir" "$pkgdir" | xargs -0 -r sed -i "s|$pkgdir||g"
 find "$pkgdir" -type l -print0 |
  while IFS= read -r -d '' _link; do
   _target=$(readlink -- "$_link")
   if [[ $_target == "$pkgdir"/* ]]; then
    ln -sfn "${_target#"$pkgdir"}" "$_link"
   fi
  done
}

package() {
 # install in $pkgdir using uv
 UV_LINK_MODE=copy \
 UV_NO_COMPILE_BYTECODE=TRUE \
 UV_NO_CACHE=TRUE \
 UV_NO_INSTALLER_METADATA=TRUE \
 # aider-chat requires Python < 3.13
 UV_PYTHON=3.12 \
 UV_PYTHON_PREFERENCE=only-managed \
 UV_PYTHON_DOWNLOADS=automatic \
 UV_PYTHON_BIN_DIR="$pkgdir/usr/share/aider-chat/bin" \
 UV_PYTHON_INSTALL_DIR="$pkgdir/usr/share/aider-chat/python" \
 UV_TOOL_DIR="$pkgdir/usr/share/aider-chat/tool" \
 UV_TOOL_BIN_DIR="$pkgdir/usr/bin" \
 uv tool install --force --with pip "aider-chat==$pkgver"

 # remove cache
 find "$pkgdir" -type d -name "__pycache__" -exec rm -r {} +
 rm -rf "$pkgdir/usr/share/aider-chat/cache"

 _strip_pkgdir
}
