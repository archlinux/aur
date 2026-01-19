# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Alexander Adler <alexadler1@protonmail.com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>

# Copy your OGG|MP3|WAV noises into ~/ANoise or ~/.ANoise

pkgname=anoise
pkgver=0.0.36
pkgrel=7
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
url="https://costales.github.io/projects/anoise"
license=('GPL-3.0-or-later')
depends=(
  'anoise-media'
  'gst-python'
  'gtk3'
  'python-dbus'
  'python-gobject'
  'webkit2gtk-4.1'
)
makedepends=(
  'python-build'
  'python-distutils-extra'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'anoise-community-extension1: Sounds and icons from the users'
  'anoise-community-extension2: Sounds and icons from the users'
  'anoise-community-extension3: Sounds and icons from the users'
  'anoise-community-extension4: Sounds and icons from the users'
  'anoise-community-extension5: Sounds and icons from the users'
  'anoise-gui: GUI for anoise'
  'libappindicator-gtk3: tray icon'
)
source=("https://launchpad.net/~costales/+archive/ubuntu/$pkgname/+sourcefiles/$pkgname/$pkgver/${pkgname}_${pkgver}.tar.gz"
        'setup.patch')
noextract=("${pkgname}_${pkgver}.tar.gz")
sha256sums=('cd6e2e1e8691b950c503b4319f7f9ecf6e66c745e5194724be0c3e026e9dd3ac'
            'e561b2513e791c29d097e7eea7c83f9bbe3d993ead398e7dd0352bbb55ce451a')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "${pkgname}_${pkgver}.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/setup.patch"

  # correct desktop file
  sed -i "s/$pkgname.desktop.in/Ambient Noise/g" "$pkgname.desktop.in"

  # WebKit2 using 4.1
  # https://github.com/costales/anoise/commit/0910bb920c518e904e4560f5f5eb260170e3efbd
  sed -i 's/4.0/4.1/g' "$pkgname/preferences.py"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # This file is included in anoise-gui
  rm "$pkgdir/usr/share/$pkgname/$pkgname.ui"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -a "${pkgdir}${site_packages}/usr/share" "$pkgdir/usr/"
  rm -r "${pkgdir}${site_packages}/usr"
}
