# Maintainer: Eimantas Bunevičius <eimantas@remote.solutions>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant-esphome-venv
pkgdesc="Standalone build, with esphome plugin, works offline, doesn't check for updates"
pkgver=2020.12.1
pkgrel=1
arch=(any)
license=(APACHE)
depends=(
  gcc
  python-pip
)
makedepends=(
  make
  git
  quilt
  python-setuptools
)
provides=('home-assistant')
conflicts=('home-assistant')

source=(
  https://github.com/home-assistant/core/archive/$pkgver.tar.gz
  home-assistant.service
  series
  home-assistant-astral2.2.patch
  home-assistant-offline.patch
)
b2sums=('53ddc907599a1e375be5289d0abe16976fc15f48110885c73540cac08c0e046b13bfb1cb7ffb4515e7d07f66c2a140654ddc65e4abd6cca0a4b38d49465038a4'
        '77272289e0ba40d91eb501d001a259445d21eb464833ace779d9c8869cebf501c58652390e59fc9994f47320191ceba9d41ece7c388e04662ff27fd693fb2700'
        'a0a52f6a46694e6bcccca046240e127bc00e908d8dce4da2d70d3ed549119e62f802c0f57376d3372c3541a3d24fa0b038d51b4a04c14f5aeac0a54fe34377f3'
        'e2e4c8f4c20932d6f10812ed06a30234de8c6c9b364c8ea98976d1b7546256d7917a2d4649da3c9880f7e542ec161f91295f11cd15f77f21100822aacb9b0753'
        'a296e542dec01e26beb8463364820597ab20e964431769fe278ba06e0569a9ae8e63ae223f16c662c6ecd49ccf72706ff5830a42c4df15c86a0a1e9bec529c84')

prepare() {
  cd core-$pkgver

  rm -rf homeassistant/components/{updater,met} tests/components/{updater,met}
  QUILT_PATCHES="$srcdir" quilt push -a
}

package() {
  cd core-$pkgver

  local opt_dir="$pkgdir/opt/$pkgname"
  python3 -m venv "$opt_dir"

  "$opt_dir/bin/pip3" install --cache-dir "$srcdir/pip_cache" wheel pyotp==2.3.0 PyQRCode==1.2.1 aioesphomeapi==2.6.3 mutagen==1.45.1 gTTS==2.2.1 chardet==3.0.4
  "$opt_dir/bin/python3" setup.py install --optimize=1
  "$opt_dir/bin/pip3" install --cache-dir "$srcdir/pip_cache" -r homeassistant/package_constraints.txt

  find "$opt_dir/bin/" -type f -exec sed -i "s|$opt_dir|/opt/$pkgname|g" {} \;

  install -Dm 644 "$srcdir/home-assistant.service" -t "$pkgdir/usr/lib/systemd/system/"
}
