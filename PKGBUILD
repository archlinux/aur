# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat-venv"
pkgver=0.83.0
pkgrel=1
pkgdesc="AI pair programming in your terminal (installed with uv)"
url="https://github.com/Aider-AI/aider"
license=("Apache-2.0")
arch=("any")
provides=("aider-chat")
conflicts=("aider-chat")
makedepends=("jq" "uv")
options=("!strip")

pkgver(){
 curl -s "https://api.github.com/repositories/638629097/releases/latest" | jq -r '.tag_name | sub("^v"; "")'
}

_strip_pkgdir_from_links() {
 find "$pkgdir" -type l -print0 |
  while IFS= read -r -d '' _link; do
   # current target
   _target=$(readlink -- "$_link")
   case "$_target" in
    # contains $pkgdir
    "$pkgdir"/*)
     # new target
     _stripped=${_target#"$pkgdir"}
     # replace the link
     ln -sf "$_stripped" "$_link"
    ;;
   esac
  done
}

package() {
 # install in $pkgdir using uv
 UV_LINK_MODE=copy \
 UV_NO_COMPILE_BYTECODE=TRUE \
 UV_NO_CACHE=TRUE \
 UV_NO_INSTALLER_METADATA=TRUE \
 UV_PYTHON=3.12 \
 UV_PYTHON_PREFERENCE=only-managed \
 UV_PYTHON_DOWNLOADS=automatic \
 UV_PYTHON_BIN_DIR="$pkgdir/usr/share/aider-chat/bin" \
 UV_PYTHON_INSTALL_DIR="$pkgdir/usr/share/aider-chat/python" \
 UV_TOOL_DIR="$pkgdir/usr/share/aider-chat/tool" \
 UV_TOOL_BIN_DIR="$pkgdir/usr/bin" \
 uv tool install --force --with pip aider-chat@latest

 # remove cache
 find "$pkgdir" -type d -name "__pycache__" -exec rm -r {} +
 rm -rf "$pkgdir/usr/share/aider-chat/cache"

 # remove mentions of $pkgdir in files
 grep -RIlZ "$pkgdir" "$pkgdir" | xargs -0 sed -i "s|$pkgdir||g"

 # remove mentions of $pkgdir in symlinks
 _strip_pkgdir_from_links
}
