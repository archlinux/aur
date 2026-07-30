pkgname=g3m-git
pkgver=3.3.0.r1.g2cce134
pkgrel=5
pkgdesc="GameMaker mod manager (runs directly from Python source)"
arch=('x86_64')
url="https://github.com/y114git/G3M"
license=('GPL-3.0-only')
depends=(
  'python>=3.14'
  'python-pyqt6'
  'python-defusedxml'
  'python-psutil'
  'python-py7zr'
  'python-dotenv'
  'python-rarfile'
  'python-requests'
  'python-urllib3'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('g3m')
conflicts=('g3m')
options=('!strip')
source=(
  'G3M::git+https://github.com/y114git/G3M.git'
  'G3M-Linux-3.3.0.zip::https://github.com/y114git/G3M/releases/download/3.3.0/G3M-Linux-3.3.0.zip'
  'https://files.pythonhosted.org/packages/9f/09/51b8905714b733bac66dbc041a7821372d70d888d273ae474c4037d4202d/pyinstaller-6.21.0-py3-none-manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/6b/93/39f2296a69fe2c70dcc9b9724147ffc9d7f676f67eb3cbad3baa725ae32d/playsound3-3.3.1.tar.gz'
  'extract-g3mtool.py'
  'avoid-rechmod.patch'
  'fix-linux-protocol-registration.patch'
  'g3m'
  'g3m.desktop'
)
sha256sums=(
  'SKIP'
  'e47e5ca988da9be72a96c356d91e2ad0c22951b01ad36fadbef50eb4dac95541'
  '605169523a6b5ace39f13dfbff21add9f2bc43df99c7daf9394fefb2c45e8b6f'
  '3f0eb87d5ff2061d07663c4b010b8e7d66c274344712b01d561a0a73447ef41d'
  'f58c452cd9bbb9a62fda48690c04f2c2e96f87e983cfbfc51e4a3f781619a371'
  '9e3b337fc864f5da3404307c91e1e7205dc06650fbf6283351f04d7a9e9c8e0f'
  '5a19030c21a9ebab86f3afa612bbbd6710bcb1ac93d917d07f8396295c518ed1'
  'd6aba76579f9146fa1b86cd5cda8d0a7f7482c9e223760a91453a9ba0bdf106f'
  '2d964b0a38639f1b8a4c42ab506cf2e3295865804245dba71a63f6055140b663'
)

pkgver() {
  cd G3M
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  patch -d G3M -p1 < avoid-rechmod.patch
  patch -d G3M -p1 < fix-linux-protocol-registration.patch
  mkdir -p pyinstaller-wheel
  bsdtar -xf pyinstaller-6.21.0-py3-none-manylinux2014_x86_64.whl \
    -C pyinstaller-wheel
}

build() {
  cd "playsound3-3.3.1"
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" playsound3-3.3.1/dist/*.whl

  install -d "$pkgdir/usr/lib/g3m"
  cp -a G3M/src/. "$pkgdir/usr/lib/g3m/"
  find "$pkgdir/usr/lib/g3m" -type d -name __pycache__ -prune -exec rm -r {} +
  rm -rf "$pkgdir/usr/lib/g3m/G3M.egg-info"

  PYTHONPATH=pyinstaller-wheel python extract-g3mtool.py \
    archive_content/G3M \
    "$pkgdir/usr/lib/g3m/assets/bin/g3mtool_linux"
  chmod 755 "$pkgdir/usr/lib/g3m/assets/bin/g3mtool_linux/G3MTool"

  install -Dm755 g3m "$pkgdir/usr/bin/g3m"
  install -Dm644 g3m.desktop "$pkgdir/usr/share/applications/g3m.desktop"
  install -Dm644 G3M/src/assets/icons/icon.ico "$pkgdir/usr/share/pixmaps/g3m.ico"
  install -Dm644 G3M/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
