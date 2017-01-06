# Maintainer: William Turner <willtur.will@gmail.com> 
pkgname=afdko-git
pkgver=2.5.65322.r8.32a48ad
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('i686' 'x86_64')
url='https://github.com/adobe-type-tools/afdko'
license=('custom')
depends=('python2'
         'python2-fonttools'
         'python2-booleanoperations'
         'python2-defcon'
         'python2-fontmath'
         'python2-mutatormath'
         'python2-robofab'
         'python2-ufonormalizer')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/adobe-type-tools/afdko.git"
        'use-system-python.patch'
        'profile.sh'
        'profile.csh')
sha256sums=('SKIP'
            '044967786fefa26687f3e3aa92c379bfe128151d59ad699b22260a89eb453be0'
            'af0a77eefbf707879d92fb3dfa1579d3e7002b80936633325b97b60d3833e4c2'
            'fdc7e7945896963c10d6439828a47ddc1896a8b2cd7eb98dffa409c1a630b200')

pkgver() {
  cd "${srcdir}/afdko"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/afdko/FDK"

  # remove things we won't need
  rm -r \
    FinishInstall{Linux,OSX,Windows.cmd} \
    Tools/{osx,win} \
    Tools/linux/AFDKOPython

  # the bundled python install is a mess, use system
  patch -p2 -i "${srcdir}/use-system-python.patch"

  cd "${srcdir}/afdko/FDK/Tools/Programs"

  # change the XFLAGS for x86_64
  if [ "${CARCH}" = "x86_64" ]; then
    sed -i 's/-m32/-m64/' $(find -type f -name '*.mak' | grep linux/gcc)
    sed -i 's/-m32/-m64/' $(find -type f -name Makefile | grep linux/gcc)
  fi
}

build() {
  cd "${srcdir}/afdko/FDK/Tools/Programs"

  # build all the release makefiles
  for f in $(ls */build/linux/gcc/release/Makefile); do
    cd "${srcdir}/afdko/FDK/Tools/Programs/$(dirname "$f")"
    make clean
    make
  done

  cd "${srcdir}/afdko/FDK"

  # copy the built executables in the "bin" folder
  cp Tools/Programs/*/exe/linux/release/* Tools/linux
}

package() {
  cd "${srcdir}/afdko"

  install -d "${pkgdir}/opt"
  cp -r FDK "${pkgdir}/opt/${pkgname%-git}"
  rm -r "${pkgdir}/opt/${pkgname%-git}/Tools/Programs"
  chown -R root:root "${pkgdir}/opt/${pkgname%-git}"

  # bash/csh profile for paths
  install -D -m755 "${srcdir}/profile.sh" "${pkgdir}/etc/profile.d/${pkgname%-git}.sh"
  install -D -m755 "${srcdir}/profile.csh" "${pkgdir}/etc/profile.d/${pkgname%-git}.csh"

  # license
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
