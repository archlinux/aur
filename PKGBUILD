# Maintainer: robserob <robin at robserob.dk>
pkgname=vpinfe-git
_pkgname=${pkgname%-git}
_reponame=vpinfe
pkgver=r537.947932b
pkgrel=1
pkgdesc="A vpinball frontend for Linux, Mac, and Windows"
arch=('any')
url="https://github.com/superhac/vpinfe"
depends=('git' 'python-pip' 'chromium')
provides=('vpinfe')
conflicts=('vpinfe')
source=('git+https://github.com/superhac/vpinfe.git' 'vpinfe.desktop')
sha256sums=('SKIP' 'd0c22bc258c3fbee04a31378454246f25a3360cf48e870fcb374559de6b4a072')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Create virtual environment and install dependencies
	mkdir -p "$pkgdir/opt/$_pkgname/venv"
  python -m venv "$pkgdir/opt/$_pkgname/venv"
  source "$pkgdir/opt/$_pkgname/venv/bin/activate"
  cd "$srcdir/$_reponame"
  pip install -r requirements.txt
  deactivate

  # Install source files
  cd "$srcdir"
  install -d "$_reponame" "$pkgdir/opt/$_pkgname"
  cp -r "$_reponame"/* "$pkgdir/opt/$_pkgname/"

  # Install launch script to /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/$_pkgname"
  echo "cd ~" >> "$pkgdir/usr/bin/$_pkgname"
  echo "/opt/$_pkgname/venv/bin/python /opt/$_pkgname/main.py \$@" >> "$pkgdir/usr/bin/$_pkgname"
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  # Install application entry
  install -Dm644 "$srcdir/vpinfe.desktop" "$pkgdir/usr/share/applications/vpinfe.desktop"
}

clean() {
  cd "$srcdir"
  rm -rf "$_reponame"
}
