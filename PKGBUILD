# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

# Alright I give up, the whole rekall environment is practically hard-coded to be setup in a venv with pip
# I'm just gonna commit this and disown the package if anyone else wants to try and carry on
# If you do re-try this see if you can get it working with setuptools instead of pip
# Also the google devs will need to release source for a lot of the rekall-* libs that are only on PIP

pkgname=rekall-git
pkgver=1.0rc11.r551.g8db49aa9
pkgrel=1
pkgdesc='Rekall Memory Forensic Framework'
url='http://www.rekall-forensic.com'
arch=('any')
license=('GPL')
makedepends=('python-setuptools' 'python-pip')
depends=(
  'python'
  'python-yaml'
  'python-pyelftools'
  'python-future'
  'python-arrow'
  'python-sortedcontainers'
  'python-psutil'
  'python-yara'
  'python-pytz'
)
source=("${pkgname}::git+https://github.com/google/rekall.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  sed -i -r "s/'pytz==2017.3',/'pytz',/" rekall-core/setup.py # Remove pointless version requirement
}

package() {
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-lib/
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-core/
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-agent/
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/

  # Install rekall yara, efilter, and capstone from PIP because it has no source repository...
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps rekall-yara
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps rekall-efilter
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps rekall-capstone
  rm ${pkgdir}/usr/lib/python*/site-packages/yara.cpython*.so # Apparently --no-deps means everything except the yara dep...
  rm -rf ${pkgdir}/usr/lib/python*/site-packages/capstone # and capstone...

  # Build GUI
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-gui/

  # Move some files/dirs out of /usr into /usr/share/$PKGNAME/
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  # rekall-agent creates /usr/messages and /usr/test_data
  mv "${pkgdir}/usr/messages" "${pkgdir}/usr/share/${pkgname}/"
  mv "${pkgdir}/usr/test_data" "${pkgdir}/usr/share/${pkgname}/"

  # rekall-core creates /usr/resources
  mv "${pkgdir}/usr/resources" "${pkgdir}/usr/share/${pkgname}/"

  # rekall creates /usr/tools
  mv "${pkgdir}/usr/tools" "${pkgdir}/usr/share/${pkgname}/"
}
