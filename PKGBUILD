# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.10.3
pkgrel=3
pkgdesc='Cast media from Plex Mobile and Web apps to MPV'
arch=('any')
url=https://github.com/iwalton3/plex-mpv-shim
license=('MIT')
depends=('python-certifi' 'python-mpv' 'python-mpv-jsonipc' 'python-requests')
optdepends=('mpv-shim-default-shaders: for the default shader pack'
            'python-pystray: for system tray support'
            'tk: for GUI support')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'plex-mpv-shim-do_not_use_idle_event.patch::https://github.com/iwalton3/plex-mpv-shim/commit/05e37ca4905f2810f12ebf1d2292b6802a1d8447.patch')
b2sums=('cd1ebe5086d3125efa7215e358bf0c616d125d50beec3d8909a434136f16f38f2942ae876c684b59ce308ce61e5cc24fe3cee980843388887cce6d34bdcd1e2e'
        '22eec021b4be3e0c3e03d07649c31bc6c860a7f58b45d29618666bd5651acbdd75d871a0e391e40b8ecae9b4e193ff28a74f10b2121a505861640fa181792936')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input=../plex-mpv-shim-do_not_use_idle_event.patch
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s /usr/share/mpv-shim-default-shaders \
    "$pkgdir"/"$site_packages"/plex_mpv_shim/default_shader_pack
}
