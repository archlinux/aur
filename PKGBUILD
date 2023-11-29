# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol
_app_id="org.$pkgname.CoolerControl"
pkgver=0.17.2
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL3')
depends=('hicolor-icon-theme' 'python' 'liquidctl' 'pyside6' 'qt6-svg' 'python-apscheduler'
         'python-matplotlib' 'python-numpy' 'python-setproctitle' 'python-jeepney' 'python-requests'
         'python-fastapi' 'uvicorn' 'python-orjson' 'python-dataclass-wizard' 'gcc-libs' 'glibc'
         'python-colorlog' 'python-dateutil' 'python-pillow' 'python-pydantic' 'python-urllib3')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry' 'cargo' 'npm' 'nvm')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('nvidia-utils: NVIDIA GPU support')
provides=("$pkgname")
conflicts=("$pkgname" coolero)
# lto is handled by cargo and can conflict with makepkg settings
options=(!lto)
source=("https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('61b6af7b014fc16641490ab7572d7885dea8e0f2cf01de426c745b1a226adaab')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/$pkgname-$pkgver/coolercontrol-ui/.nvm"
  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-ui"
  nvm install 18.18.2
}

build() {
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-gui"
  python -m build --wheel --no-isolation
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-liqctld"
  python -m build --wheel --no-isolation
  # This is the new UI in preview. The above Python coolercontrol-gui package will be removed with the next release
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-ui"
  _ensure_local_nvm
  npm install
  npm run build
  cp -r dist/* "${srcdir}/$pkgname-$pkgver/coolercontrold/resources/app/"
  cd "${srcdir}/$pkgname-$pkgver/coolercontrold"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "${srcdir}/$pkgname-$pkgver"
  desktop-file-validate "packaging/metadata/$_app_id.desktop"
  appstream-util validate-relax "packaging/metadata/$_app_id.metainfo.xml"
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-gui"
  python -m coolercontrol -v
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-liqctld"
  python -m coolercontrol-liqctld -v
  cd "${srcdir}/$pkgname-$pkgver/coolercontrold"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-gui"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "${srcdir}/$pkgname-$pkgver/coolercontrol-liqctld"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "${srcdir}/$pkgname-$pkgver/coolercontrold"
  install -Dm755 "target/release/coolercontrold" -t "$pkgdir/usr/bin"

  cd "${srcdir}/$pkgname-$pkgver"
  # systemd service files
  install -Dm644 "packaging/systemd/${pkgname}d.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "packaging/systemd/${pkgname}-liqctld.service" -t "$pkgdir/usr/lib/systemd/system/"

  # desktop metadata
  install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
