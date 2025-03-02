# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=superset-venv

pkgname="aider-chat-venv"
pkgver=0.74.0
pkgrel=2
pkgdesc="AI pair programming in your terminal"
url="https://github.com/Aider-AI/aider"
license=("Apache-2.0")
arch=("any")
provides=("aider-chat" "aider-chat")
conflicts=("aider-chat" "aider-chat")
depends=("python")
makedepends=("jq")
source=("aider.bin")
b2sums=('d09f4ea9909488f5538bcd7c85c286d3a7c7386ed65b01d063c883e4a8cf96edd7525d2ec66045d63a0505c1929b9c699a2e514c19cd48ad086657abf6512aa9')
options=("!strip")

pkgver(){
 curl -s "https://api.github.com/repositories/638629097/releases/latest" | jq -r '.tag_name | sub("^v"; "")'
}

package() {
 # binary
 install -D -m 755 "$srcdir/aider.bin" "$pkgdir/usr/bin/aider"
 # create virtual environment
 export PIP_DISABLE_PIP_VERSION_CHECK=1
 export PYTHONDONTWRITEBYTECODE=1
 python -m venv "$pkgdir/usr/share/aider-chat/venv"
 source "$pkgdir/usr/share/aider-chat/venv/bin/activate"
 # install aider-chat and dependencies using pip
 "$pkgdir/usr/share/aider-chat/venv/bin/"pip install -I aider-chat sounddevice soundfile
 # remove references to pkgdir
 find "$pkgdir/usr/share/aider-chat/venv/bin" -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
 find "$pkgdir/usr/share/aider-chat/venv/pyvenv.cfg" -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
 find "$pkgdir/usr/share/aider-chat/venv" -type f -name "*.py[co]" -delete
 find "$pkgdir/usr/share/aider-chat/venv" -type d -name "__pycache__" -delete
 # exit virtual environment
 deactivate
}
