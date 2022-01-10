# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=edl-git
pkgver=r299.d5ff2d4
pkgrel=1
# https://github.com/bkerler/edl/blob/d13f2d22c8124631019625de206bbf275d0b6808/setup.py#L36
pkgdesc="Qualcomm reverse engineering and flashing tools"
arch=(any)
url=https://github.com/bkerler/edl
license=(custom:MIT)
depends=(
  # https://github.com/bkerler/edl/blob/41e0f272798dfe13e77650065bb8425c1df9bf1f/README.md#linux-debianubuntumintetc
  android-tools # adb fastboot
  xz # liblzma-dev
  'python>=3.0' # python3-dev
  python-pip # python3-pip
  # requirements.txt pyproject.toml setup.py
  # (pylzma)
  # (usb)
  python-capstone
  python-pyusb
  python-wheel 
  python-docopt
  python-colorama
  python-pycryptodome
  python-lxml
  python-pyserial
  python-keystone
)
makedepends=(git 'python-setuptools>=42')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!strip emptydirs)
source=(
  ${pkgname%-git}::git+https://github.com/bkerler/${pkgname%-git}.git
          Loaders::git+https://github.com/bkerler/Loaders.git
)
md5sums=(SKIP SKIP)

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule.Loaders.url "$srcdir/Loaders"
  git submodule update
}

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd ${pkgname%-git}
  python setup.py build
}

package(){

  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  cd "$pkgdir/usr"
  mkdir -pv share/licenses/$pkgname; mv -v LICENSE $_/
  mkdir -pv share/doc/$pkgname;      mv -v README.md $_/

  # namcap edl-git-r*-any.pkg.tar | grep -v \
  #   -e "lacks PIE" \
  #   -e "lacks FULL RELRO" \
  #   -e "found in an 'any' package"

}
