# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Janis Jansons <aur@janhouse.lv>

pkgname=cecdaemon-devel
pkgver=r4.444ee75
pkgrel=5
pkgdesc="CEC Daemon for linux media centers (development version)"
arch=('any')
url="https://github.com/simons-public/cecdaemon"
license=('BSD')
depends=('python' 'python-importlib-metadata' 'libcec' 'python-cec-git' 'python-uinput' 'python-pyudev')
provides=('cecdaemon')
conflicts=('cecdaemon' 'cecdaemon-git')
makedepends=('git' 'python-setuptools')
source=(
  'cecdaemon-devel::git+https://github.com/simons-public/cecdaemon.git'
  'modules-load.conf'
)
sha256sums=('SKIP'
            'a771c9695d7283f7771adc00b680bd27391e6ac00e9fd026f4796067ee9a87eb')
b2sums=('SKIP'
        '4f298ba1d1fdc19f5b90ea8d9292be9a44c85567995ea14136e401d39ce3c159b43be50f0043d1f10bed6892d24d8f7a6bf04f5a448ee2044f43b07c4c66cee0')
backup=(etc/cecdaemon.conf)

prepare() {
  cd "${pkgname}"
  sed -i 's/cec.conf/cecdaemon.conf/' 'examples/cecdaemon.service-example'
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}"

  install -Dm0644 "${srcdir}/modules-load.conf" "${pkgdir}/usr/lib/modules-load.d/cecdaemon.conf"
  install -Dm0644 "examples/cecdaemon.conf-example" "${pkgdir}/etc/cecdaemon.conf"
  install -Dm0644 "examples/cecdaemon.service-example" "${pkgdir}/usr/lib/systemd/system/cecdaemon.service"
}
