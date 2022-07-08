# Maintainer: Eric Woudstra <ericwouds@gmail.com>

# gsctool is only available in certein branches. It is not in the main/master branch.

_gitname="ec"
_gitroot="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
_gitbranch="cr50_stab"
pkgname=chromeos-gsctool-git
pkgver=r20220616235852.f35ac20
pkgrel=1
pkgdesc='Chromium OS gsctool'
url='https://chromium.googlesource.com/chromiumos/platform/ec'
arch=(i686 x86_64)
depends=(glibc libusb)
makedepends=(git)
license=(GPL)

pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
  if [[ -d "${srcdir}/${_gitname}/" ]]; then
    cd "${srcdir}/${_gitname}/"
    git reset --hard
    git pull --depth=1 origin "${_gitbranch}:${_gitbranch}"
    git checkout "${_gitbranch}"
    echo
  else
    cd "${srcdir}/"
    git clone --branch "${_gitbranch}" --depth=1 "${_gitroot}" "${srcdir}/${_gitname}/"
    echo
  fi
}

build() {
  cd "${srcdir}/ec/extra/usb_updater"
  sed -i '/-Werror/d' ./Makefile
  make
}

package() {
  cd "${srcdir}/ec/extra/usb_updater"
  install -m755 -vDt $pkgdir/usr/bin gsctool
}
