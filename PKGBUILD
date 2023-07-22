# Maintainer: SelfRef <arch@selfref.dev>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=edl-git
pkgver=r419.76a2bf4
pkgrel=3
pkgdesc="Inofficial Qualcomm Firehose / Sahara / Streaming / Diag Tools"
arch=('any')
url="https://github.com/bkerler/edl"
license=('MIT')
depends=(
  'android-tools'
  'xz'
  'python'
  'python-pip'
  'python-capstone'
  'python-pyusb'
  'python-wheel'
  'python-docopt'
  'python-colorama'
  'python-pycryptodome'
  'python-lxml'
  'python-pyserial'
  'python-keystone'
)
optdepends=('python-exscript: telnet support')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(
  ${pkgname%-git}::git+https://github.com/bkerler/edl.git
          Loaders::git+https://github.com/bkerler/Loaders.git
)
md5sums=('SKIP' 'SKIP')

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule.externals/vendor/Loaders.url "$srcdir/Loaders"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd ${pkgname%-git}
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
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
}
