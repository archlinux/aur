# Maintainer: robserob <robin at robserob.dk>
pkgname=vpinfe-git
_pkgname=${pkgname%-git}
_reponame=vpinfe
pkgver=r538.6d5f172
pkgrel=1
pkgdesc="A vpinball frontend for Linux, Mac, and Windows"
arch=('any')
url="https://github.com/superhac/vpinfe"
depends=('git' 'python-pip' 'chromium')
provides=('vpinfe')
conflicts=('vpinfe')
source=('git+https://github.com/superhac/vpinfe.git' 'vpinfe.desktop' 'vpinfe.png')
sha256sums=('SKIP' 'd0c22bc258c3fbee04a31378454246f25a3360cf48e870fcb374559de6b4a072' '7e7e1b0854ffcf745d9cf5a643cb005bb3c1c21f58ef50dc9c889eef5e9b92bd')

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
  install -Dm 644 "${srcdir}/vpinfe.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vpinfe.png"
  install -Dm644 "$srcdir/vpinfe.desktop" "$pkgdir/usr/share/applications/vpinfe.desktop"
}

clean() {
  cd "$srcdir"
  rm -rf "$_reponame"
}
