_hydrajoy=hydrajoy
_sixense_sdk=sixense-sdk
bkgbase=${_hydrajoy}-git
pkgname=( ${_hydrajoy}-git $_sixense_sdk )
pkgver=r7.61d5da4
#pkgver_hydrajoy-git=r7.61d5da4
#pkgver_sixense-sdk=20111215 # Using date from readme for now
pkgrel=2
_giturl="https://github.com/yomboprime/${_hydrajoy}"
arch=(x86_64)
url=${_giturl}
makedepends=('git')
source=("git+${_giturl}.git")
md5sums=('SKIP')

# If there are no tags then use number of revisions since beginning of the history:
pkgver() {
  cd "$_hydrajoy"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_hydrajoy}/src
  # remove prebuilt binary
  rm hydrajoy64
  make
}

package_hydrajoy-git () {
  pkgdesc="A program that exposes the Razer Hydra controller as a 20 axis virtual joystick on Linux."
  license=('GPL3')
  depends=( ${_sixense_sdk} )
  provides=( ${_hydrajoy} )
  
  mkdir -p "${pkgdir}"/usr/bin/
  mv ${srcdir}/${_hydrajoy}/src/hydrajoy64 "${pkgdir}"/usr/bin/hydrajoy
  
  install -Dm 644 ${srcdir}/${_hydrajoy}/98-uinput.rules \
    "${pkgdir}/usr/lib/udev/rules.d/98-hydrajoy-uinput.rules"
  sed -i 's/GROUP=\"yombo\", //g' "${pkgdir}/usr/lib/udev/rules.d/98-hydrajoy-uinput.rules"
}

package_sixense-sdk () {
  pkgdesc="Sixense SDK libraries and headers"
  license=('custom')
  
  mkdir -p "${pkgdir}"/usr/lib/
  mkdir -p "${pkgdir}"/usr/lib32/
  cp ${srcdir}/${_hydrajoy}/lib/sixense/lib/linux/release/{libsixense.so,libsixense_utils.so} "${pkgdir}"/usr/lib32/
  cp ${srcdir}/${_hydrajoy}/lib/sixense/lib/linux_x64/release/{libsixense_x64.so,libsixense_utils_x64.so} "${pkgdir}"/usr/lib/
  
  mkdir -p "${pkgdir}"/usr/include/
  cp -r ${srcdir}/${_hydrajoy}/lib/sixense/include "${pkgdir}"/usr/
  
  install -Dm 644 ${srcdir}/${_hydrajoy}/lib/sixense/install/99-sixense-libusb.rules \
    "${pkgdir}"/usr/lib/udev/rules.d/99-sixense-libusb.rules
}
