# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/android-studio by Kordian Bruck <k@bruck.me>
# Based on aur/android-studio-canary by tilal6991 <lalitmaganti@gmail.com>, vanpra <pranavmaganti@gmail.com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

# PRs are welcome here: https://github.com/yurikoles-aur/android-studio-beta
# SHA-256 Checksums and binary links can be found here: https://developer.android.com/studio/archive

PKGEXT='.pkg.tar'
_pkgname=android-studio
_beta=1
pkgname="${_pkgname}-beta"
pkgver=2023.2.1.19
pkgrel=1
pkgdesc='The Official Android IDE (Beta branch)'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/preview'
license=('APACHE')
depends=(
  'fontconfig'
  'freetype2'
  'libxml2'
  'libxrender'
  'libxtst'
  'which'
)
optdepends=(
  'android-emulator'
  'android-platform'
  'android-sdk'
  'android-sdk-build-tools: aapt, aapt2, aidl, apksigner, bcc_compat, d8, dexdump, dx, lld, llvm-rs-cc, mainDexClases, split-select, zipalign'
  'android-sdk-cmdline-tools-latest: apkanalyzer, avdmanager, lint, retrace, screenshot2, sdkmanager'
  'android-sdk-platform-tools: adb, dmtracedump, e2fsdroid, etc1tool, fastboot, hprof-conv, make_f2fs, make_f2fs_casefold, mke2fs, sload_f2fs, sqlite3, systrace'
  'android-support-repository'
  'android-tools: adb, fastboot, e2fsdroid,mke2fs.android, mkbootimg, ext2simg.'
  'e2fsprogs'
  'git: for flutter'
  'glib2: GTK+ look and feel'
  'gtk2: GTK+ look and feel'
  'gvfs: GTK+ look and feel'
  'lib32-gcc-libs: for aapt and mksdcard'
  'lib32-zlib: for aapt'
  'ncurses5-compat-libs: native gdb support'
  'usbutils'
)
options=('!strip')
source=("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "license.html")
sha256sums=('95f2415fb44b2338a2baff34e7e81db7cc5f264163cb46d287beff6e390d147e'
            'c4a15624eb258acbe119567b044f4a54be4ebb41f05e6f6cb4d941d130dc714f'
            '6c4ae36e7e336f833de7d6151a4e1bb1d0133affeba9cef86f1190e0637128d1')

if [ "${CARCH}" = "i686" ]; then
  depends+=('java-environment')
fi

build() {
  if [[ "${_beta}" -eq 0 ]]; then return 0; fi

  cd "${_pkgname}"

  # Change the product name to produce a unique WM_CLASS attribute
  mkdir -p _resources
  bsdtar -xf lib/resources.jar -C _resources
  pushd _resources
  sed "s/\"Studio\"/\"Studio Beta\"/" -i idea/AndroidStudioApplicationInfo.xml
  bsdtar -acf ../lib/resources.jar .
  popd
  rm -r _resources
}

package() {
  cd "${_pkgname}"

  # Install the application
  install -d "${pkgdir}"/{opt/"${pkgname}",usr/bin}
  cp -a . "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/bin/studio.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Copy licenses
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  # Add the icon and desktop file.
  install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  chmod -R ugo+rX "${pkgdir}/opt"
}
