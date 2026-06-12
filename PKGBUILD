# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mini-eq'
  'gnome-shell-extension-mini-eq'
)
pkgbase=mini-eq
_app_id="io.github.bhack.$pkgbase"
_uuid=mini-eq@bhack.github.io
pkgver=0.8.7
pkgrel=2
pkgdesc="Compact PipeWire system-wide parametric EQ"
arch=('any')
url="https://github.com/bhack/mini-eq"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libebur128'
  'pipewire'
  'pipewire-gobject'
  'pipewire-jack'
  'python-cairo'
  'python-gobject'
  'python-numpy'
  'wireplumber'
)
makedepends=(
  'gnome-shell'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'git'
  'python-pytest'
  'python-pytest-deadfixtures'
)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ea93ddd419c637922022557ff97d2e816ad9ed3ff13965c2a0c33a4e89bea7b')

prepare() {
  cd "$pkgbase-$pkgver"
  mkdir -p dist/gnome-shell-extension
}

build() {
  cd "$pkgbase-$pkgver"
  python -m build --wheel --no-isolation

  gnome-extensions pack "extensions/gnome-shell/${_uuid}" \
  --out-dir=dist/gnome-shell-extension \
  --extra-source="$pkgbase-symbolic.svg" \
  --force
}

check() {
  cd "$pkgbase-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
  test-env/bin/python -m pytest --dead-fixtures

  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package_mini-eq() {
  optdepends=('gnome-shell-extension-mini-eq: Control Mini EQ from the panel')

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "src/mini_eq/assets/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "src/mini_eq/assets/icons/hicolor/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 "src/mini_eq/assets/schemas/${_app_id}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  # Remove duplicate icons & schema
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rv "${pkgdir}${site_packages}/mini_eq/assets/"
}

package_gnome-shell-extension-mini-eq() {
  pkgdesc="Control Mini EQ from the panel"
  depends=(
    'gnome-shell'
    'mini-eq'
  )

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "dist/gnome-shell-extension/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
}
