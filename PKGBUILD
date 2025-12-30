# Maintainer: Leonardo Berbert <leo4berbert@gmail.com>

pkgname=zashterminal
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern GTK4/Adwaita terminal emulator with advanced session management, SSH integration, and security features."
arch=('any')
url="https://github.com/leoberbert/zashterminal"
license=('GPL3')
depends=(
    'gtk4' 'libadwaita' 'libsecret' 'python' 'python-cairo' 'python-py7zr'
    'python-gobject' 'python-setproctitle' 'python-requests' 'python-psutil'
    'sshpass' 'rsync' 'vte4' 'gobject-introspection' 'python-regex' 'python-pygments'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'uv' 'gettext')
conflicts=('zash')
provides=('zash' 'zashterminal')
replaces=('zash')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

#build() {
#    cd "${srcdir}/${pkgname}"
#    uv build --wheel
#}
build() {
  cd "${srcdir}/${pkgname}"
  find locale -name '*.po' -print0 | while IFS= read -r -d '' po; do
    lang=$(basename "${po%.po}")
    out="usr/share/locale/${lang}/LC_MESSAGES/zashterminal.mo"
    mkdir -p "$(dirname "$out")"
    msgfmt -o "$out" "$po"
  done
  uv build --wheel
}
package() {
    cd "${srcdir}/${pkgname}"
    
    python -m installer --destdir="$pkgdir" dist/*.whl

    if [ -d "usr/share" ]; then
        mkdir -p "$pkgdir/usr"
        cp -ra usr/share "$pkgdir/usr/"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
