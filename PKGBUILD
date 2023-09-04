# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Mario Oenning <mo-son at mailbox dot org>
# Author: hattedsquirrel <https://hattedsquirrel.net/>

pkgname=ryzen_monitor-git
pkgver=1.0.5
pkgrel=5
pkgdesc='Monitor power information of Ryzen processors via the PM table of the SMU'
arch=('x86_64')
url='https://github.com/hattedsquirrel/ryzen_monitor'
license=('AGPL3')
depends=('ryzen_smu')
provides=('ryzen_monitor')
conflicts=('ryzen_monitor')
source=(
  "git+${url}.git"
  '0001-update-smulib.patch'
)
sha256sums=('SKIP'
            '5c75945c460a6f858a70e25f65eb529708e72af248726d52b3a1132e151c6b2a')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/0001-update-smulib.patch"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"

  # license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # binary
  install -Dm755 "src/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
