# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>

# TODO add test, see about packaging jtreg and using it here

pkgbase=jdk-openjdk-xdg-bin
pkgname=('jre-openjdk-headless-xdg-bin' 'jre-openjdk-xdg-bin' 'jdk-openjdk-xdg-bin' 'openjdk-src-xdg-bin' 'openjdk-doc-xdg-bin')
_majorver=18
_minorver=0
_securityver=2.1
_updatever=0
pkgrel=1
pkgver=${_majorver}.${_minorver}.${_securityver}.u${_updatever}
#pkgver=${_majorver}.u${_updatever}
_git_tag=jdk-${_majorver}.${_minorver}.${_securityver}+${_updatever}
#_git_tag=jdk-${_majorver}+${_updatever}
arch=('x86_64')
url='https://openjdk.java.net/'
license=('custom')
makedepends=('java-environment>=11' 'cpio' 'unzip' 'zip' 'libelf' 'libcups' 'libx11'
             'libxrender' 'libxtst' 'libxt' 'libxext' 'libxrandr' 'alsa-lib' 'pandoc'
             'graphviz' 'freetype2' 'libjpeg-turbo' 'giflib' 'libpng' 'lcms2'
             'libnet' 'bash' 'harfbuzz' 'gcc-libs' 'glibc')
options=(!lto)
source=("https://github.com/noahvogt/java-openjdk-xdg-aur/releases/download/$pkgver-$pkgrel/jdk-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "https://github.com/noahvogt/java-openjdk-xdg-aur/releases/download/$pkgver-$pkgrel/jre-openjdk-headless-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "https://github.com/noahvogt/java-openjdk-xdg-aur/releases/download/$pkgver-$pkgrel/jre-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "https://github.com/noahvogt/java-openjdk-xdg-aur/releases/download/$pkgver-$pkgrel/openjdk-doc-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "https://github.com/noahvogt/java-openjdk-xdg-aur/releases/download/$pkgver-$pkgrel/openjdk-src-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
noextract=("jdk-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "jre-openjdk-headless-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "jre-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "openjdk-doc-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
        "openjdk-src-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('f0df23f90e1457e1173670d98fdd82d60c13582e621ea34b5dd986276b690378'
            '4cc6d91c68d98f04af47e4e2c8a4488e579f49e91bd02aa54568e6c8f46c532b'
            '87956a0b991bd5c4e4fbdcc1c43a38f9274c31b698e22129fcceee6890243923'
            '9fb2b768dd209d88aca8995b101feb42cc5a20a28e47a483fe14eb715296d0bb'
            '30eed8e686d2fb93bee3feff4387cd029ff18f3d53dd8527add959c86f47de5e')
provides=('jre-openjdk-headless' 'jre-openjdk' 'jdk-openjdk' 'openjdk-src'
          'openjdk-doc')
conflicts=('jre-openjdk-headless' 'jre-openjdk' 'jdk-openjdk' 'openjdk-src'
           'openjdk-doc' 'jdk-openjdk-xdg')

case "${CARCH}" in
  x86_64) _JARCH='x86_64';;
  i686)   _JARCH='x86';;
esac

_jvmdir=/usr/lib/jvm/java-${_majorver}-openjdk
_jdkdir=jdk${_majorver}u-${_git_tag//+/-}
_imgdir=${_jdkdir}/build/linux-${_JARCH}-server-release/images

_nonheadless=(lib/libawt_xawt.{so,debuginfo}
              lib/libjawt.{so,debuginfo}
              lib/libjsound.{so,debuginfo}
              lib/libsplashscreen.{so,debuginfo})
# prepare() {
# echo oof
# exit 1
# }

package_jre-openjdk-headless-xdg-bin() {
  pkgdesc="OpenJDK Java ${_majorver} headless runtime environment - with improved Support for the XDG Base Directory Specification"
  depends=('java-runtime-common>=3' 'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'libjpeg.so'
           'lcms2' 'liblcms2.so' 'libnet' 'freetype2' 'libfreetype.so' 'harfbuzz' 'libharfbuzz.so'
           'glibc' 'gcc-libs')
  optdepends=('java-rhino: for some JavaScript support')
  provides=("java-runtime-headless=${_majorver}" "java-runtime-headless-openjdk=${_majorver}" "jre${_majorver}-openjdk-headless=${pkgver}-${pkgrel}")
  backup=(etc/${pkgbase%-*}/logging.properties
          etc/${pkgbase%-*}/management/jmxremote.access
          etc/${pkgbase%-*}/management/jmxremote.password.template
          etc/${pkgbase%-*}/management/management.properties
          etc/${pkgbase%-*}/net.properties
          etc/${pkgbase%-*}/security/java.policy
          etc/${pkgbase%-*}/security/java.security
          etc/${pkgbase%-*}/security/policy/README.txt
          etc/${pkgbase%-*}/security/policy/limited/default_US_export.policy
          etc/${pkgbase%-*}/security/policy/limited/default_local.policy
          etc/${pkgbase%-*}/security/policy/limited/exempt_local.policy
          etc/${pkgbase%-*}/security/policy/unlimited/default_US_export.policy
          etc/${pkgbase%-*}/security/policy/unlimited/default_local.policy
          etc/${pkgbase%-*}/sound.properties)
  install=install_jre-openjdk-headless.sh

  mkdir -p "$srcdir/jre-openjdk-headless"
  bsdtar -C "$srcdir/jre-openjdk-headless" -xf "$srcdir/jre-openjdk-headless-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
  cd "$srcdir/jre-openjdk-headless"
  cp -R "${srcdir}/jre-openjdk-headless/usr/" "${pkgdir}/usr"
  cp -R "${srcdir}/jre-openjdk-headless/etc/" "${pkgdir}/etc"
}

package_jre-openjdk-xdg-bin() {
  pkgdesc="OpenJDK Java ${_majorver} full runtime environment - with improved Support for the XDG Base Directory Specification"
  depends=("jre${_majorver}-openjdk-headless=${pkgver}-${pkgrel}" 'giflib' 'libgif.so'
           'glibc' 'gcc-libs' 'libpng')
  optdepends=('alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ 2 look and feel - desktop usage'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
  provides=("java-runtime=${_majorver}" "java-runtime-openjdk=${_majorver}" "jre${_majorver}-openjdk=${pkgver}-${pkgrel}")
  install=install_jre-openjdk.sh

  mkdir -p "$srcdir/jre-openjdk"
  bsdtar -C "$srcdir/jre-openjdk" -xf "$srcdir/jre-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
  cd "$srcdir/jre-openjdk"
  cp -R "${srcdir}/jre-openjdk/usr/" "${pkgdir}/usr"
}

package_jdk-openjdk-xdg-bin() {
  pkgdesc="OpenJDK Java ${_majorver} development kit - with improved Support for the XDG Base Directory Specification"
  depends=("jre${_majorver}-openjdk=${pkgver}-${pkgrel}" 'java-environment-common=3'
           'hicolor-icon-theme' 'libelf' 'glibc' 'gcc-libs')
  provides=("java-environment=${_majorver}" "java-environment-openjdk=${_majorver}" "jdk${_majorver}-openjdk=${pkgver}-${pkgrel}")
  install=install_jdk-openjdk.sh

  mkdir -p "$srcdir/jdk-openjdk"
  bsdtar -C "$srcdir/jdk-openjdk" -xf "$srcdir/jdk-openjdk-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
  cd "$srcdir/jdk-openjdk"
  cp -R "${srcdir}/jdk-openjdk/usr/" "${pkgdir}/usr"
}

package_openjdk-src-xdg-bin() {
  pkgdesc="OpenJDK Java ${_majorver} sources - with improved Support for the XDG Base Directory Specification"
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openjdk=${pkgver}-${pkgrel}")
  provides=("openjdk${_majorver}-src=${pkgver}-${pkgrel}")

  mkdir -p "$srcdir/openjdk-src"
  bsdtar -C "$srcdir/openjdk-src" -xf "$srcdir/openjdk-src-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
  cd "$srcdir/openjdk-src"
  cp -R "${srcdir}/openjdk-src/usr/" "${pkgdir}/usr"
}

package_openjdk-doc-xdg-bin() {
  pkgdesc="OpenJDK Java ${_majorver} documentation - with improved Support for the XDG Base Directory Specification"
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openjdk=${pkgver}-${pkgrel}")
  provides=("openjdk${_majorver}-doc=${pkgver}-${pkgrel}")

  mkdir -p "$srcdir/openjdk-doc"
  bsdtar -C "$srcdir/openjdk-doc" -xf "$srcdir/openjdk-doc-xdg-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
  cd "$srcdir/openjdk-doc"
  cp -R "${srcdir}/openjdk-doc/usr/" "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
