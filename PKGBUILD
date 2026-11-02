# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: marmis <tiagodepalves@gmail.com>
# Contributor: Benzy
# Contributor: Kudlaty
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms-trigger-rumble-hack
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad (with trigger rumble hack)'
pkgver=0.11.pre
pkgrel=2
url='https://github.com/detiam/xpadneo'
arch=(any)
license=('GPL-2.0-only AND GPL-3.0-or-later')
checkdepends=('dkms' 'fakeroot' 'LINUX-HEADERS')
source=(
  "xpadneo::git+${url}.git#commit=359267f7d86c7a70c241f60569967a15dc58458a"
)
b2sums=('320bb57fdd902d55b537d8ea1a787ececec5d8ba950abdb60940a64258ad2cc1f4211ecd9c955682762e4d0b08016176c522a30aa118bdb8847879076db3f204')

prepare() {
  cd "xpadneo"

  # Apply patches
  #for patch in "${srcdir}"/0001-*.patch; do
  #  echo "Applying patch: ${patch}"
  #  patch -p1 < "${patch}"
  #done
}

build() {
  cd "xpadneo"

  echo "${pkgver}" > VERSION
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
  echo '##' Checking if module builds on Linux "${kver}"...
  echo

  mkdir -p check/dkms check/src
  local dkms_options=(
    --dkmstree "${PWD}/check/dkms"
    --sourcetree "${PWD}/check/src"
    -k "${kver}"
  )

  fakeroot dkms "${dkms_options[@]}" add "xpadneo/hid-xpadneo"
  fakeroot dkms "${dkms_options[@]}" build "hid-xpadneo/${pkgver}"
}

package() {
  depends=('dkms' 'bluez' 'bluez-utils')
  provides=("xpadneo-dkms")
  conflicts=("xpadneo-dkms")

  cd "xpadneo"

  # Add modprobe and udev files
  make PREFIX="${pkgdir}" ETC_PREFIX='/usr/lib' install

  # License applicability
  local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -vD -t "${license_dir}/" -m644 LICENSE.md LICENSES/*.txt

  # DKMS files
  local target_dir="${pkgdir}/usr/src/hid-xpadneo-${pkgver}"
  install -vD -t "${target_dir}" -m644 hid-xpadneo/{Makefile,dkms.conf}
  install -vD -t "${target_dir}" -m755 hid-xpadneo/dkms.post_{install,remove}

  # Module source
  cd hid-xpadneo
  find src/ -type f -not -name '.*' -not -name 'AGENTS.md' \
    -exec install -vD -m644 {} -T "${target_dir}/{}" \;

  mkdir -p "${pkgdir}/usr/lib/modprobe.d"

  # enable trigger rumble hack default
  echo "options hid-xpadneo disable_deadzones=1 trigger_rumble_mode=3" > "${pkgdir}/usr/lib/modprobe.d/xpadneo.conf"
}
