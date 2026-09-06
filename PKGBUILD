# Maintainer: restitux <restitux@ohea.xyz>
pkgname=decky-loader
pkgver=3.2.8
pkgrel=1
pkgdesc="Unofficial Arch build of Decky Loader, a homebrew plugin launcher for the Steam Deck."
arch=('x86_64')
url="https://github.com/SteamDeckHomebrew/decky-loader"
license=('GPL-2.0-only')
provides=('decky-loader')
conflicts=('decky-loader')
depends=('python' 'python-aiohttp' 'python-aiohttp-jinja2' 'python-aiohttp-cors'
  'python-watchdog' 'python-certifi' 'python-packaging' 'python-multidict'
  'python-setproctitle')
makedepends=('pnpm' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "decky-loader@.service"
  "decky-loader-helper")
sha256sums=('821d97b0ab89bec5717a0162aa97f1f84cc57271c38d7d6cbd3179d9f7c704db'
            '068f91eba3ead7fce3384d208d743acdf8ed22c0daea6d13645ff3edf7a754eb'
            '57ad5807a25f39777569982a632a87bce41c5b25d25f3a82168a14cced359f48')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Build JS frontend
  cd frontend
  pnpm i --frozen-lockfile --ignore-scripts
  pnpm run build
  cd ..

  # Build Python backend wheel
  cd backend
  # Permit running with python 3.14
  sed -i 's/python = ".*"/python = ">=3.11"/' pyproject.toml
  # Remove poetry dynamic-versioning logic as it was breaking the build and is unused here
  sed -i '/\[tool\.poetry-dynamic-versioning\]/,/^[[:space:]]*enable/ s/enable = true/enable = false/' pyproject.toml
  # poetry-core 2.x drops gitignored files even when listed in `include` if the
  # build dir doesn't have a parent directory with a .gitignore, as the decky-loader
  # repo's gitignore is used instead (I think?). Edit pyproject.toml to explicitly
  # include the static assets.
  sed -i 's|"decky_loader/static/\*"|{ path = "decky_loader/static/**/*", format = ["wheel"] }|' pyproject.toml
  poetry version $pkgver
  poetry build --format wheel
  cd ..

  # Patch service file with per-user paths
  sed -i "s|\${HOMEBREW_FOLDER}|/home/%i/.local/var/opt/decky-loader|" "${srcdir}/decky-loader@.service"
  sed -i "/^ExecStart=/i ExecStartPre=/usr/bin/decky-loader-helper v${pkgver} %i" "${srcdir}/decky-loader@.service"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" backend/dist/*.whl
  install -Dm 644 "${srcdir}/decky-loader@.service" "${pkgdir}/usr/lib/systemd/system/decky-loader@.service"
  install -Dm 755 "${srcdir}/decky-loader-helper" "${pkgdir}/usr/bin/decky-loader-helper"
}
