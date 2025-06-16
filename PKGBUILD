# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=archcraft-pkg
url=https://azccriminal.space
pkgver=1.0.0
pkgrel=1
pkgdesc="archcraft-pkg Alternative realtime crafting header coop reactivable and file-timesnapshot package utility."
arch=('any')
license=('GPL')
depends=('bash' 'zstd' 'tar' 'python')
source=("archcraft-pkg-src.tar.zst::https://mirror.azccriminal.space/dist/archcraft-pkg.pkg.tar.zst")
noextract=("archcraft-pkg-src.tar.zst")
sha256sums=('SKIP')

build() {
  echo ":: Extracting archive"
  mkdir -p "$srcdir/archcraft-pkg"
  tar -I zstd -xf "$srcdir/archcraft-pkg-src.tar.zst" -C "$srcdir/archcraft-pkg"

  echo ":: Searching for setup.py"
  setup_path=$(find "$srcdir/archcraft-pkg" -type f -name "setup.py" | head -n 1)

  if [[ -z "$setup_path" ]]; then
    echo "!! setup.py not found."
    exit 1
  fi

  setup_dir=$(dirname "$setup_path")
  echo ":: Found setup.py in $setup_dir"

  cd "$setup_dir" || exit 1
  echo ":: Running setup.py build"
  python setup.py build
}

package() {
  echo ":: Searching for setup.py again"
  setup_path=$(find "$srcdir/archcraft-pkg" -type f -name "setup.py" | head -n 1)

  if [[ -z "$setup_path" ]]; then
    echo "!! setup.py not found during packaging."
    exit 1
  fi

  setup_dir=$(dirname "$setup_path")
  cd "$setup_dir" || exit 1

  echo ":: Installing to pkgdir"
  python setup.py install --root="$pkgdir" --optimize=1
}
