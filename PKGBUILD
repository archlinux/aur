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
pkgrel=1
url='https://github.com/atar-axis/xpadneo'
arch=(any)
license=('GPL-2.0-only AND GPL-3.0-or-later')
checkdepends=('dkms' 'fakeroot' 'LINUX-HEADERS')
source=(
  "xpadneo::git+${url}.git#commit=39625746fff63c997eeb53fe3a6fc1a3de08702e"
  "0001-rumble-rework-trigger-rumble-modes-and-add-hack-mode.patch"
)
b2sums=('68ba38fd564f2c2ca2b5a1915c4c626b6089c8a12bf9775e17e2c6a52d595c87cd886dab46f3d03b57bde8e6acdfe4fde59af7ae7111cdf399cf716997c3cc96'
        '35c6d0253f6509c1166aca1a24df8e9d3b95cb727b7ac72f2122e83fbb65799c7e53145fd5b6742a3388a45e4c808a85aad2982b6ab20ce89cc147733e144af8')

prepare() {
  cd "xpadneo"

  # Apply patches
  for patch in "${srcdir}"/0001-*.patch; do
    echo "Applying patch: ${patch}"
    patch -p1 < "${patch}"
  done
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

  # enable trigger rumble hack default
  echo "options hid-xpadneo trigger_rumble_mode=3" >> "${pkgdir}/usr/lib/modprobe.d/xpadneo.conf"
}
