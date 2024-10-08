# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=superset-venv

pkgname="aider-chat-venv"
pkgver=0.59.0
pkgrel=1
pkgdesc="AI pair programming in your terminal"
url="https://github.com/Aider-AI/aider"
license=("Apache-2.0")
arch=("any")
provides=("aider-chat" "aider-chat")
conflicts=("aider-chat" "aider-chat")
depends=("python")
makepkg=("jq")
source=("aider.bin")
b2sums=('717fa32e049ed4f21794997d74910be6c6c105ac0304aa98cfd0c59ce5e1212ea68a242d18bd698564fa1f5365cfe998d583bf4b95afbf39b2d4aa0b9dbb5bad')
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
