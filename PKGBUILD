# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Mario Oenning <mo-son at mailbox dot org>
# Author: hattedsquirrel <https://hattedsquirrel.net/>

pkgname=ryzen_monitor-git
_pkgname=ryzen_monitor
pkgver=1.0.5.r7.g7529c7c
pkgrel=1
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
            '8c44e25918d58552a36334b62589802c0694f1d8df127d24caaf215c5c9110d6')

pkgver() {
  cd "${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
