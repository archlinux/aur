# $Id: 469156894119f3e86346aecbb0de97fac03a04fe $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the OpenOnload website, http://www.openonload.org/ :
#   ``OpenOnload(r) is a high performance network stack from Solarflare that
#   dramatically reduces latency and cpu utilisation, and increases message rate
#   and bandwidth.  OpenOnload runs on Linux and supports TCP/UDP/IP network
#   protocols with the standard BSD sockets API, and requires no modifications
#   to applications to use. It achieves performance improvements in part by
#   performing network processing at user-level, bypassing the OS kernel
#   entirely on the data path. Networking performance is improved without
#   sacrificing the security and multiplexing functions that the OS kernel
#   normally provides.'' (10/3/2013)

pkgname='openonload'
pkgdesc="A high performance network stack from Solarflare."
pkgver='201509'
if [[ -z "$_kernelver" ]]; then
    #_kernelver="$(uname -r)"                                      # running
    _kernelver="$(cat /lib/modules/extramodules-4.1-lts/version)"  # installed
fi
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.openonload.org/'
license=('custom')
depends=("linux-lts")
makedepends=("linux-lts" "linux-lts-headers")
options=('libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.openonload.org/download/openonload-${pkgver//\./-}.tgz"
        'openonload.install'
        'openonload.service'
        'openonload-201310-cpp11-space-literal-fix.patch'
        'openonload-201405-extramodules-and-noinitrc.patch'
        'openonload-201405-extramodules-and-noinitrc2.patch'
)
sha512sums=('012e65107327d52af455e8c6b476b65a360180269d47beb4b99883883af8e5c1c017dfbf13f112c25db5811d3cb92f52316e3311ff4cc4cb138dec2fc8f9d47a'
            'ac464250f2fb96d13e8ae129bac80c03f8cca62e450fdd765f24ccd064e28e9942e4a16ebc693e75c71fc1eb86c3a1b08337b2e39c6c618e129d8ec87d872bdb'
            'b7e4529e37c64f99c660ca9b58f388cdd8f0d2f250ba875eb210f4909bb1f1c985a065aae64c048ca6f824adc6e3176c6eae1f582c049631326db73e939edd7b'
            'd4fda83764e79cff525f578e14b337937d2a6a3e0fc5f3cc5ec07b739f4bcc46b294fa560db595b0efb14bdf70eab44e833c05278e28d8fb947f9f8b77748a78'
            'a206a6890793a4b3d7ac7090ef2a660d80782f9d6995df0e04d563e0653e10c480e7444a11b3cae64c669592375d5fdb21893c961438e0864e478138b37c5dd9'
            '5a2a8984bfc8ba4e75637fab24970764da165dd3cf7253dd32f647a866e4ad0bfd77732f3739066f2479333a466574a55db46142d3ed47a5c5f6e2f6e65c0b39')

install="openonload.install"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver//\./-}"

  patch -p1 < "${srcdir}/openonload-201310-cpp11-space-literal-fix.patch"
  patch -p1 < "${srcdir}/openonload-201405-extramodules-and-noinitrc.patch"
  patch -p1 < "${srcdir}/openonload-201405-extramodules-and-noinitrc2.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver//\./-}"

  case $CARCH in
    "i686")
      # x86 (32 bit) build
      ./scripts/onload_build --kernelver "$_kernelver" --user32 ${DEBUG:+--debug}
    ;;
    "x86_64")
      # x64 build
      ./scripts/onload_build --kernelver "$_kernelver" ${DEBUG:+--debug}
    ;;
    *)
      # unsupported
      echo "Unsupported architecture."
      exit 1
    ;;
  esac
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver//\./-}"

  # OpenOnload:
  install -dm755 "${pkgdir}/etc/modprobe.d"
  install -dm755 "${pkgdir}/etc/depmod.d"
  i_prefix="${pkgdir}" ./scripts/onload_install --verbose \
      --kernelver "$_kernelver" \
      ${DEBUG:+--debug} rpm_install
  rm -f "${pkgdir}/etc/modprobe.conf" # may be created by onload_install
  mv "${pkgdir}/usr/lib64/"* "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/lib64"
  mv "${pkgdir}/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/sbin"
  mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin"

  install -Dm755 scripts/onload_install \
                                  "${pkgdir}/usr/lib/onload/onload_install"

  install -Dm644 "${srcdir}/openonload.service" \
                                  "${pkgdir}/usr/lib/systemd/system/openonload.service"

  # ef_vi libraries:
  install -dm755                  "${pkgdir}/usr/lib/"
  install -m644 build/gnu_${CARCH}/lib/ciul/libciul.so.1.1.1 \
      "${pkgdir}/usr/lib/"
  ln -s /usr/lib/libciul.so.1.1.1 ${pkgdir}/usr/lib/libciul.so.1
  ln -s /usr/lib/libciul.so.1.1.1 ${pkgdir}/usr/lib/libciul.so

  install -m644 build/gnu_${CARCH}/lib/ciul/lib{ciul,efvi}1.a \
      "${pkgdir}/usr/lib/"

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/openonload"
  install -m644 ChangeLog         "${pkgdir}/usr/share/doc/openonload"
  install -m644 LICENSE           "${pkgdir}/usr/share/doc/openonload"
  install -m644 README            "${pkgdir}/usr/share/doc/openonload"
  install -m644 README.ef_vi      "${pkgdir}/usr/share/doc/openonload"
  install -m644 ReleaseNotes      "${pkgdir}/usr/share/doc/openonload"
  install -m644 ReleaseNotes-sfc  "${pkgdir}/usr/share/doc/openonload"

  # Install ef_vi tests/samples:
  install -dm755                  "${pkgdir}/usr/share/openonload/examples"
  cp -r "src/tests/."             "${pkgdir}/usr/share/openonload/examples/."
  chmod -R a=rX                   "${pkgdir}/usr/share/openonload/examples"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/openonload"
  ln -s "/usr/share/doc/openonload/LICENSE" \
                                  "${pkgdir}/usr/share/licenses/openonload"

}
