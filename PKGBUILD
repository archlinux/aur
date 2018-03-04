# Maintainer: Robin Broda <robin at broda dot me>

_pkgbase=indicator-sysmonitor
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-budgie-git" "${_pkgbase}-appindicator-git")
pkgver=r90.f5f5f6f
pkgrel=9
pkgdesc='A configurable system monitoring applet'
arch=('any')
url='https://github.com/fossfreedom/indicator-sysmonitor'
license=('GPL3')
conflicts=('indicator-sysmonitor')
provides=('indicator-sysmonitor')
depends=('python' 'python-psutil')
makedepends=('git' 'libappindicator-gtk3')
source=('git+https://github.com/fossfreedom/indicator-sysmonitor.git'
        "${pkgbase}-80.patch::https://github.com/fossfreedom/indicator-sysmonitor/pull/80.patch")
md5sums=('SKIP'
         '02c52d9d2f45c57ff4f6f6e5dcc47973')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}"

  patch Makefile "${srcdir}/${pkgbase}-80.patch"
}

package_indicator-sysmonitor-budgie-git() {
  pkgdesc+=", budgie-panel version"
  conflicts+=('indicator-sysmonitor-budgie')
  provides+=('indicator-sysmonitor-budgie')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" installbudgie

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}

package_indicator-sysmonitor-appindicator-git() {
  pkgdesc+=", appindicator version"
  depends+=('libappindicator-gtk3')
  conflicts+=('indicator-sysmonitor-appindicator')
  provides+=('indicator-sysmonitor-appindicator')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install

  python -m compileall -d '/' "${pkgdir}/"
  python -O -m compileall -d '/' "${pkgdir}/"
}
