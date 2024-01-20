# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Yuanji <self@gimo.me>
# Contributor: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
pkgname=hardcode-tray-git
pkgver=4.3.r246.g1d52b2c
pkgrel=2
pkgdesc="Fixes hardcoded tray icons"
arch=('x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL-3.0-or-later')
depends=('gtk3' 'librsvg' 'python-cairosvg' 'python-gobject')
makedepends=('git' 'gobject-introspection' 'meson')
optdepends=('nodejs-svgexport: option to convert svg to png'
            'imagemagick: option to convert svg to png'
            'inkscape: option to convert svg to png')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bil-elmoussaoui/Hardcode-Tray.git'
        "90-${pkgname%-git}.hook"
        "hook.py")
sha256sums=('SKIP'
            'c16ba6a82d4fe523cb91bf472b44296db82ff301866e3bce18bb4149d0aae5ea'
            '64a9907f74c5c04fb9f32b2b0684a3ce040d3bc2baacabb3ca1e914d70f24c81')

pkgver() {
  cd Hardcode-Tray
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Hardcode-Tray

  # Correct app.asar path for bitwarden
  sed -i 's|/usr/lib/bitwarden/resources/|/usr/lib/bitwarden/|g' \
    data/database/bitwarden.electron.json

  # Rename and correct path for motrix
  mv data/database/motrix-git.json data/database/motrix.json
  sed -i 's|/usr/lib/motrix/app/electron/static/|/usr/lib/motrix/|g' data/database/motrix.json
}

build() {
  arch-meson Hardcode-Tray build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Compile Python bytecode:
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m compileall -d "${site_packages}" "${pkgdir}${site_packages}"
  python -O -m compileall -d "${site_packages}" "${pkgdir}${site_packages}"

  # Add pacman hook
  # https://github.com/bilelmoussaoui/Hardcode-Tray/issues/454
  install -Dm644 "90-${pkgname%-git}.hook" -t "$pkgdir/etc/pacman.d/hooks/"
  install -Dm644 hook.py -t "$pkgdir/usr/share/${pkgname%-git}/"
}
