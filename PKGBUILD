pkgname=salopbar
pkgver=r14.fbe06c8
pkgrel=1
pkgdesc="Uma barra de navegação simples para usar com Hyprland"
url="https://github.com/HelenoSalgado/salopbar"
arch=('x86_64')
url="https://github.com/HelenoSalgado/salopbar"
license=('GPL-3.0-or-later')
depends=(
  'gjs' 
  'gtk4' 
  'gtk4-layer-shell' 
  'libadwaita'
  'libastal-4-git'
  'astal-hyprland-git'
  'astal-mpris-git'
  'astal-network-git'
  'astal-notifd-git'
  'astal-wireplumber-git'
  'astal-apps-git'
)
makedepends=('git' 'meson' 'esbuild' 'npm' 'typescript')
source=("git+$url.git")
provides=("$pkgname")
options=('!debug')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# O ambiente makepkg parece não conseguir enxergar o link simbólico ags em node_modules
# Então o link simbólico deve ser criado adequadamente, apontando para o pacote do sistema.

prepare() {
  npm --prefix ${srcdir}/${pkgname} install --omit=dev
  rm "${srcdir}/${pkgname}/node_modules/ags"
  echo "Criando link simbólico:"
  echo "/usr/share/ags/js -> ${srcdir}/${pkgname}/node_modules/ags"
  ln -s "/usr/share/ags/js" "${srcdir}/${pkgname}/node_modules/ags"
}

build() {
  arch-meson "${srcdir}/${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -D -m644 "${srcdir}/${pkgname}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
