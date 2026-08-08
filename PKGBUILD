# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
pkgver=0.10.4
pkgrel=1
url='https://github.com/atar-axis/xpadneo'
arch=(any)
license=('GPL-2.0-only AND GPL-3.0-or-later')
checkdepends=('LINUX-HEADERS' 'fakeroot')
depends=('dkms' 'bluez' 'bluez-utils')
source=("xpadneo-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2858e466c5fde7e3d06d878dd7fb695751375e11a112bd3d389f9db5a82ef3ffcc1e3431b213f4807aeb8f05fd4280c7ca2a0a56305b0e984eb9b70df4843735')

build() {
  cd "xpadneo-${pkgver}"

  make build
}

check() {
  local kernels=(/usr/lib/modules/*/build)
  if [[ ! -d ${kernels[0]} ]]; then
    echo LINUX-HEADERS required to run check > /dev/stderr
    return 0
  fi

  local kver=${kernels[0]}
  kver=$(dirname "${kver}")
  kver=$(basename "${kver}")
  echo '##' Checking if module can be built for Linux "${kver}"...
  echo
  mkdir -p check/dkms check/src

  fakeroot dkms --dkmstree "${PWD}/check/dkms" --sourcetree "${PWD}/check/src" -k "${kver}" \
    add "xpadneo-${pkgver}/hid-xpadneo"
  fakeroot dkms --dkmstree "${PWD}/check/dkms" --sourcetree "${PWD}/check/src" -k "${kver}" \
    build "hid-xpadneo/v${pkgver}"
}

package() {
  cd "xpadneo-${pkgver}"

  # Add modprobe and udev files
  make PREFIX="${pkgdir}" ETC_PREFIX='/usr/lib' install

  # License applicability
  local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -vD -t "${license_dir}/" -m644 LICENSE.md LICENSES/*.txt

  # DKMS files
  local target_dir="${pkgdir}/usr/src/hid-xpadneo-v${pkgver}"
  install -vD -t "${target_dir}" -m644 hid-xpadneo/{Makefile,dkms.conf}
  install -vD -t "${target_dir}" -m755 hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type f -not -name '.*' \
    -exec install -vD -m644 {} -T "${target_dir}/{}" \;
}
